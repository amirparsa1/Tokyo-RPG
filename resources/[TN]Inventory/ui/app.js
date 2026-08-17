/* ==========================================================================
   INVENTORY — front-end
   Pure view. Lua pushes state via INV.sync({...}); every user action is
   reported back through the ajax bridge and re-validated server-side.
   ========================================================================== */
'use strict';

const SLOTS = 55;
const COLS  = 11;

let ST = {
  name:'—', id:'0000', cash:0, hp:100, armor:0,
  items:[],          // [{slot, id, qty, name, cat, value}]
  equipped:[]        // [id|null] x4
};
let sel = null;      // selected slot number
let dragFrom = null;

const $  = s => document.querySelector(s);
const $$ = s => [...document.querySelectorAll(s)];

/* ---------------------------------------------------------------- bridge */
function send(action, a, b){
  try{
    fetch('http://mta/local/invAction', {
      method:'POST',
      headers:{'Content-Type':'application/x-www-form-urlencoded'},
      body:`act=${encodeURIComponent(action)}&a=${encodeURIComponent(a??'')}&b=${encodeURIComponent(b??'')}`
    }).catch(()=>{});
  }catch(e){ console.log('[dev]', action, a, b); }
}

/* ---------------------------------------------------------------- scale */
function fit(){
  // 1080p -> 16px. Clamped so 768p stays legible and 1440p doesn't balloon.
  const r = Math.max(13, Math.min(19, window.innerHeight/67));
  document.documentElement.style.fontSize = r+'px';
}
addEventListener('resize', fit); fit();

/* ---------------------------------------------------------------- helpers */
const byslot = s => ST.items.find(i => i.slot === s);
const esc = s => String(s??'').replace(/[<>&"]/g, c => ({'<':'&lt;','>':'&gt;','&':'&amp;','"':'&quot;'}[c]));
const icon = id => `../Items/${id}.png`;

/* ---------------------------------------------------------------- build */
function buildGrid(){
  const g = $('#grid'); g.innerHTML = '';
  for (let s = 1; s <= SLOTS; s++){
    const d = document.createElement('div');
    d.className = 'slot'; d.dataset.slot = s;
    d.innerHTML = `<span class="n">${String(s).padStart(2,'0')}</span>`;
    d.draggable = true;
    g.appendChild(d);
  }
  $('#grid').style.gridTemplateColumns = `repeat(${COLS},1fr)`;
}

function buildEquip(){
  const e = $('#equip'); e.innerHTML = '';
  for (let i = 0; i < 4; i++){
    const d = document.createElement('div');
    d.className = 'eq empty';
    e.appendChild(d);
  }
}

/* ---------------------------------------------------------------- paint */
function paint(){
  $('#opName').textContent = ST.name;
  $('#opId').textContent   = String(ST.id).padStart(4,'0');
  $('#opCash').textContent = '$' + Number(ST.cash||0).toLocaleString('en-US');

  const used = ST.items.length;
  $('#opCap').textContent   = `${used}/${SLOTS}`;
  $('#gridMeta').textContent = `${used} OF ${SLOTS} SLOTS`;

  $('#vHpN').textContent = Math.round(ST.hp);
  $('#vHp').style.width  = Math.max(0,Math.min(100,ST.hp))+'%';
  $('#vHp').parentElement.className = 'meter ' + (ST.hp > 60 ? 'ok' : ST.hp > 25 ? '' : 'bad');

  $('#vArN').textContent = Math.round(ST.armor);
  $('#vAr').style.width  = Math.max(0,Math.min(100,ST.armor))+'%';

  const wt = used / SLOTS * 100;
  $('#vWtN').textContent = wt.toFixed(1);
  $('#vWt').style.width  = wt+'%';

  // slots
  $$('.slot').forEach(el => {
    const s  = +el.dataset.slot;
    const it = byslot(s);
    el.className = 'slot' + (it ? ' filled' : '') + (sel === s ? ' sel' : '');
    el.querySelector('img')?.remove();
    el.querySelector('.q')?.remove();
    if (it){
      const im = document.createElement('img');
      im.src = icon(it.id); im.onerror = () => im.remove();
      el.appendChild(im);
      if (it.qty > 1){
        const q = document.createElement('span');
        q.className = 'q'; q.textContent = it.qty;
        el.appendChild(q);
      }
    }
  });

  // equipped
  $$('.eq').forEach((el,i) => {
    const id = ST.equipped[i];
    el.className = 'eq' + (id ? '' : ' empty');
    el.innerHTML = '';
    if (id){
      const im = document.createElement('img');
      im.src = icon(id); im.onerror = () => im.remove();
      el.appendChild(im);
    }
  });

  paintDetail();
}

function paintDetail(){
  const it = sel != null ? byslot(sel) : null;
  $('#detEmpty').hidden = !!it;
  $('#detFull').hidden  = !it;
  if (!it) return;

  const img = $('#dImg');
  img.src = icon(it.id); img.style.visibility = 'visible';
  img.onerror = () => { img.style.visibility = 'hidden'; };

  $('#dQty').textContent  = '×' + it.qty;
  $('#dName').textContent = it.name || ('ITEM ' + it.id);
  $('#dCat').textContent  = (it.cat || 'GENERAL').toUpperCase();
  $('#dSlot').textContent = String(it.slot).padStart(2,'0');
  $('#dId').textContent   = it.id;
  $('#dStack').textContent= it.qty;
  $('#dVal').textContent  = it.value ? ('$' + Number(it.value).toLocaleString('en-US')) : '—';

  $('[data-act="split"]').disabled = it.qty < 2;
}

/* ---------------------------------------------------------------- events */
$('#grid').addEventListener('click', e => {
  const el = e.target.closest('.slot'); if (!el) return;
  const s = +el.dataset.slot;
  sel = byslot(s) ? s : null;
  paint();
});

$('#grid').addEventListener('contextmenu', e => {
  e.preventDefault();
  const el = e.target.closest('.slot'); if (!el) return;
  const s = +el.dataset.slot;
  if (byslot(s)) { sel = s; paint(); send('use', s); }
});

/* drag to move */
$('#grid').addEventListener('dragstart', e => {
  const el = e.target.closest('.slot'); if (!el) return;
  const s = +el.dataset.slot;
  if (!byslot(s)) { e.preventDefault(); return; }
  dragFrom = s; el.classList.add('drag');
});
$('#grid').addEventListener('dragover', e => {
  e.preventDefault();
  const el = e.target.closest('.slot'); if (!el) return;
  $$('.slot.over').forEach(x => x.classList.remove('over'));
  el.classList.add('over');
});
$('#grid').addEventListener('drop', e => {
  e.preventDefault();
  const el = e.target.closest('.slot'); if (!el || dragFrom == null) return;
  const to = +el.dataset.slot;
  if (to !== dragFrom) send('move', dragFrom, to);
  dragFrom = null;
  $$('.slot.over,.slot.drag').forEach(x => x.classList.remove('over','drag'));
});
$('#grid').addEventListener('dragend', () => {
  dragFrom = null;
  $$('.slot.over,.slot.drag').forEach(x => x.classList.remove('over','drag'));
});

/* actions */
$('.actions').addEventListener('click', e => {
  const b = e.target.closest('[data-act]'); if (!b || sel == null) return;
  const act = b.dataset.act;
  if (act === 'split'){ openSplit(); return; }
  send(act, sel);
});

$('#btnClose').addEventListener('click', () => send('close'));

/* keyboard */
addEventListener('keydown', e => {
  if (!$('#modal').hidden){
    if (e.key === 'Escape') closeSplit();
    if (e.key === 'Enter')  confirmSplit();
    return;
  }
  if (e.key === 'Escape') send('close');
  if (sel == null) return;
  if (e.key === 'Enter')  send('use', sel);
  if (e.key === 'Delete') send('drop', sel);
});

/* ---------------------------------------------------------------- split */
function openSplit(){
  const it = byslot(sel); if (!it || it.qty < 2) return;
  $('#mInput').value = Math.floor(it.qty/2);
  $('#modal').hidden = false;
  setTimeout(()=>$('#mInput').focus(), 20);
}
function closeSplit(){ $('#modal').hidden = true; }
function confirmSplit(){
  const it = byslot(sel); if (!it) return closeSplit();
  let n = parseInt($('#mInput').value, 10);
  if (!Number.isFinite(n) || n < 1 || n >= it.qty) return closeSplit();
  send('split', sel, n);
  closeSplit();
}
$('#mCancel').addEventListener('click', closeSplit);
$('#mOk').addEventListener('click', confirmSplit);

/* ---------------------------------------------------------------- toast */
let tT;
function toast(msg){
  const t = $('#toast');
  t.textContent = msg; t.classList.add('show');
  clearTimeout(tT); tT = setTimeout(()=>t.classList.remove('show'), 1800);
}

/* ---------------------------------------------------------------- API */
window.INV = {
  sync(d){ Object.assign(ST, d||{});
           if (sel != null && !byslot(sel)) sel = null;
           paint(); },
  show(){ $('#scrim').classList.add('in'); $('#root').classList.add('in'); },
  hide(){ $('#scrim').classList.remove('in'); $('#root').classList.remove('in');
          sel = null; closeSplit(); },
  toast,
  net(ok){ const d=$('.f-l .dot'), s=$('#netState');
           d.className = 'dot ' + (ok?'on':'bad');
           s.textContent = ok ? 'CONNECTED' : 'DESYNC'; }
};

/* ---------------------------------------------------------------- boot */
buildGrid(); buildEquip(); paint();

/* dev preview outside MTA */
if (!navigator.userAgent.includes('MTA')){
  INV.sync({
    name:'AmirParsa', id:1428, cash:184500, hp:87, armor:42,
    equipped:[24,10,null,null],
    items:[
      {slot:1,  id:10, qty:3,  name:'Med Kit',       cat:'consumable', value:2500},
      {slot:2,  id:18, qty:12, name:'Ab',            cat:'consumable', value:150},
      {slot:3,  id:6,  qty:2,  name:'Galon Benzin',  cat:'utility',    value:900},
      {slot:5,  id:24, qty:64, name:'Hunter Bullet', cat:'ammunition', value:35},
      {slot:6,  id:50, qty:7,  name:'Almas Sefid',   cat:'mineral',    value:12000},
      {slot:7,  id:51, qty:3,  name:'Almas Sabz',    cat:'mineral',    value:14500},
      {slot:12, id:21, qty:9,  name:'Sigar',         cat:'consumable', value:400},
      {slot:13, id:11, qty:1,  name:'JetPack',       cat:'equipment',  value:75000},
      {slot:14, id:9,  qty:2,  name:'Kilid',         cat:'utility',    value:5000},
      {slot:23, id:12, qty:5,  name:'Nitrogen',      cat:'vehicle',    value:8000},
      {slot:24, id:16, qty:1,  name:'Repare',        cat:'vehicle',    value:3200},
      {slot:34, id:15, qty:1,  name:'Random Box',    cat:'container',  value:0},
      {slot:35, id:23, qty:2,  name:'Special Box',   cat:'container',  value:0},
      {slot:45, id:28, qty:1,  name:'Shild',         cat:'equipment',  value:22000}
    ]
  });
  INV.show();
}
