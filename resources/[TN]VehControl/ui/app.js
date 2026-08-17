/* ==========================================================================
   [TN]VehControl -- CEF front-end

   Talks to Lua through two channels:
     Lua  -> JS :  the client calls  executeBrowserJavascript(browser, "VC.sync({...})")
     JS   -> Lua:  mta.triggerEvent('vcAction', id, arg)   (CEF ajax bridge)

   The panel is a pure view: it never decides whether an action is allowed,
   it only renders the state Lua sends and reports clicks back.
   ========================================================================== */
'use strict';

/* ---------- icons (inline so nothing extra has to be shipped) ---------- */
const ICON = {
  engine : '<path d="M6 10h2l2-3h4l2 3h2a2 2 0 012 2v4a2 2 0 01-2 2H6a2 2 0 01-2-2v-4a2 2 0 012-2z"/><path d="M9 7V5h6v2"/>',
  lock   : '<rect x="4" y="10" width="16" height="11" rx="2"/><path d="M8 10V7a4 4 0 018 0v3"/>',
  lights : '<path d="M4 12h3M17 12h3M12 4v3"/><circle cx="12" cy="13" r="5"/>',
  hazard : '<path d="M12 3l9 17H3z"/><path d="M12 9v5M12 17h.01"/>',
  windows: '<rect x="3" y="5" width="18" height="14" rx="2"/><path d="M3 12h18"/>',
  flip   : '<path d="M3 12a9 9 0 1015-6.7"/><path d="M18 3v4h-4"/>',
  alldoor: '<rect x="4" y="4" width="7" height="16" rx="2"/><rect x="13" y="4" width="7" height="16" rx="2"/>'
};

/* ---------- state mirror ---------- */
let ST = {
  name:'VEHICLE', plate:'---', health:100, speed:0,
  engine:false, lock:false, lights:false, hazard:false, windows:false,
  driver:false, doors:[false,false,false,false,false,false],
  seats:[], mySeat:0
};

const $  = s => document.querySelector(s);
const el = (t,c) => { const e=document.createElement(t); if(c) e.className=c; return e; };

/* ---------- bridge ---------- */
/* Page -> Lua.
   MTA exposes a Lua ajax handler at a virtual URL on the same origin, so a
   plain fetch() reaches it. (An earlier version called mta.triggerEvent, which
   belongs to the server event system and never arrived, leaving every button
   dead.) Outside MTA this falls through to console logging for preview. */
function send(id, arg){
  const a = (arg === undefined || arg === null) ? '' : String(arg);
  try {
    fetch('http://mta/local/vcAction', {
      method : 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body   : 'id=' + encodeURIComponent(id) + '&arg=' + encodeURIComponent(a)
    }).catch(()=>{});
  } catch(e){
    console.log('[dev] action', id, a);
  }
}

/* ---------- responsive root size ---------- */
function fit(){
  // 27rem panel should occupy ~ 30% of a 1080p height -> 16px root
  // Text must stay readable at gameplay distance, but the PANEL must not eat
  // the screen. So the type stays generous and the box metrics (padding, gaps,
  // min-heights) were tightened in CSS instead of shrinking the font.
  const r = Math.max(13.5, Math.min(19, window.innerHeight / 58));
  document.documentElement.style.fontSize = r + 'px';
}
window.addEventListener('resize', fit);
fit();

/* ---------- tiles ---------- */
const TILES = [
  { id:'engine',   name:'MOTOR',   ico:'engine',  on:'ROSHAN', off:'KHAMOOSH', driver:true },
  { id:'lock',     name:'GHOFL',   ico:'lock',    on:'GHOFL',  off:'BAZ' },
  { id:'lights',   name:'CHERAGH', ico:'lights',  on:'ROSHAN', off:'KHAMOOSH', driver:true },
  { id:'hazard',   name:'FLASHER', ico:'hazard',  on:'ROSHAN', off:'KHAMOOSH', driver:true },
  { id:'windows',  name:'SHISHE',  ico:'windows', on:'PAEEN',  off:'BALA' },
  { id:'flip',     name:'SAF',     ico:'flip',    act:true,    driver:true }
];

function buildGrid(){
  const g = $('#grid'); g.innerHTML='';
  TILES.forEach(t=>{
    const d = el('div','tile');
    d.dataset.id = t.id;
    d.innerHTML =
      `<svg class="t-ico" viewBox="0 0 24 24">${ICON[t.ico]}</svg>
       <div class="t-name">${t.name}</div>
       <div class="t-sub"></div>`;
    d.addEventListener('click', ()=>{
      if (d.classList.contains('lock')) return;
      send(t.id);
      d.animate([{transform:'scale(.94)'},{transform:'scale(1)'}],{duration:130});
    });
    g.appendChild(d);
  });
}

/* ---------- render ---------- */
function paint(){
  $('#vehName').textContent  = ST.name;
  $('#vehPlate').textContent = ST.plate || '---';

  /* gauges */
  $('#gHealth').innerHTML = Math.round(ST.health)+'<i>%</i>';
  const hb = $('#gHealthBar');
  hb.style.width = Math.max(0,Math.min(100,ST.health))+'%';
  hb.style.background = ST.health>60 ? 'var(--ok)' : ST.health>25 ? 'var(--warn)' : 'var(--bad)';

  $('#gSpeed').innerHTML = Math.round(ST.speed)+'<i>km/h</i>';
  const sb = $('#gSpeedBar');
  sb.style.width = Math.max(0,Math.min(100,ST.speed/2.4))+'%';
  sb.style.background = 'var(--cy)';

  /* door map */
  document.querySelectorAll('.dcell.door').forEach(d=>{
    const open = !!ST.doors[+d.dataset.door];
    d.classList.toggle('open', open);
    d.querySelector('.dv').textContent = open ? 'BAZ' : 'BASTE';
  });
  const bm = $('#beam'); if (bm) bm.classList.toggle('on', !!ST.lights);
  const cab = document.querySelector('.cabin'); if (cab) cab.classList.toggle('lit', !!ST.lights);

  /* lock badge */
  const lb = $('#lockBadge');
  lb.classList.toggle('open', !ST.lock);
  $('#lockTxt').textContent = ST.lock ? 'LOCKED' : 'OPEN';

  /* tiles */
  TILES.forEach(t=>{
    const d = document.querySelector(`.tile[data-id="${t.id}"]`);
    if(!d) return;
    const locked = t.driver && !ST.driver;
    d.classList.toggle('lock', locked);
    if (t.act){
      d.classList.add('act');
      d.querySelector('.t-sub').textContent = locked ? 'RANANDE' : 'KHODRO';
      return;
    }
    const on = !!ST[t.id];
    d.classList.toggle('on', on);
    d.querySelector('.t-sub').textContent = locked ? 'RANANDE' : (on ? t.on : t.off);
  });

  /* seats */
  const wrap = $('#seats'); wrap.innerHTML='';
  ST.seats.forEach((s,i)=>{
    const d = el('div','seat');
    const mine = (i === ST.mySeat);
    if (mine) d.classList.add('mine');
    else if (s) d.classList.add('busy');
    else d.classList.add('free');
    d.innerHTML = `<div class="s-lbl">${i===0?'RANANDE':'S'+i}</div>
                   <div class="s-who">${s ? esc(s) : 'KHALI'}</div>`;
    if (!mine && !s) d.addEventListener('click', ()=> send('seat', i));
    wrap.appendChild(d);
  });
}

function esc(s){ return String(s).replace(/[<>&]/g, c=>({'<':'&lt;','>':'&gt;','&':'&amp;'}[c])); }

/* ---------- doors + close ---------- */
document.querySelectorAll('.door').forEach(d=>{
  d.addEventListener('click', ()=> send('door', d.dataset.door));
});
$('#btnClose').addEventListener('click', ()=> send('close'));

/* ---------- toast ---------- */
let toastT;
function toast(msg){
  const t = $('#toast');
  t.textContent = msg; t.classList.add('show');
  clearTimeout(toastT);
  toastT = setTimeout(()=> t.classList.remove('show'), 1700);
}

/* ---------- public API used by Lua ---------- */
window.VC = {
  sync(data){ Object.assign(ST, data||{}); paint(); },
  show(){ const p=$('#panel'); p.classList.remove('booting','out'); p.classList.add('in'); },
  hide(){ const p=$('#panel'); p.classList.remove('in'); p.classList.add('out'); },
  toast
};

/* ---------- boot ---------- */
buildGrid();
paint();
setTimeout(()=>VC.show(), 30);

/* dev preview outside MTA */
if (!window.mta){
  VC.sync({
    name:'INFERNUS', plate:'TN-4821', health:87, speed:132,
    engine:true, lock:true, lights:true, hazard:false, windows:false,
    driver:true, doors:[false,false,true,false,false,false],
    seats:['AmirParsa', null, 'Reza', null], mySeat:0
  });
}
