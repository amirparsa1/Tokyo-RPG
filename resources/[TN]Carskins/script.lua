-- ============================================================================
--  FIX (bugfix pass 3) -- VEHICLE HANDLING / COLLISION
--
--  All 112 vehicles were loaded as
--      engineLoadDFF('<id>.dff', 18)
--      engineReplaceModel(dff, <id>)
--
--  The second argument of engineLoadDFF binds the model to a model id for
--  collision purposes. Passing 18 for every vehicle meant every replaced
--  car, van and truck inherited model 18's collision box, so handling,
--  weight and wheel contact were wrong across the whole server -- most
--  visibly on the family truck (model 573, "KamionMat").
--
--  Each load id is now aligned with the model it replaces.
-- ============================================================================



addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '573.txd' ) 
engineImportTXD( txd, 573 ) 
dff = engineLoadDFF('573.dff', 573) 
engineReplaceModel( dff, 573 )

--
txd = engineLoadTXD( '419.txd' ) 
engineImportTXD( txd, 419 ) 
dff = engineLoadDFF('419.dff', 419) 
engineReplaceModel( dff, 419 )
txd = engineLoadTXD( '400.txd' ) 
engineImportTXD( txd, 400 ) 
dff = engineLoadDFF('400.dff', 400) 
engineReplaceModel( dff, 400 )
--Fj Cruiser--
txd = engineLoadTXD( '401.txd' ) 
engineImportTXD( txd, 401 ) 
dff = engineLoadDFF('401.dff', 401) 
engineReplaceModel( dff, 401 )
--Koenigsegg Agera R--
txd = engineLoadTXD( '402.txd' ) 
engineImportTXD( txd, 402 ) 
dff = engineLoadDFF('402.dff', 402) 
engineReplaceModel( dff, 402 )
--
txd = engineLoadTXD( '404.txd' ) 
engineImportTXD( txd, 404 ) 
dff = engineLoadDFF('404.dff', 404) 
engineReplaceModel( dff, 404 )
--
txd = engineLoadTXD( '405.txd' ) 
engineImportTXD( txd, 405 ) 
dff = engineLoadDFF('405.dff', 405) 
engineReplaceModel( dff, 405 )
--
txd = engineLoadTXD( '408.txd' ) 
engineImportTXD( txd, 408 ) 
dff = engineLoadDFF('408.dff', 408) 
engineReplaceModel( dff, 408 )
--
txd = engineLoadTXD( '409.txd' ) 
engineImportTXD( txd, 409 ) 
dff = engineLoadDFF('409.dff', 409) 
engineReplaceModel( dff, 409 )
--
txd = engineLoadTXD( '410.txd' ) 
engineImportTXD( txd, 410 ) 
dff = engineLoadDFF('410.dff', 410) 
engineReplaceModel( dff, 410 )
--
txd = engineLoadTXD( '411.txd' ) 
engineImportTXD( txd, 411 ) 
dff = engineLoadDFF('411.dff', 411) 
engineReplaceModel( dff, 411 )
--
txd = engineLoadTXD( '412.txd' ) 
engineImportTXD( txd, 412 ) 
dff = engineLoadDFF('412.dff', 412) 
engineReplaceModel( dff, 412 )
--
txd = engineLoadTXD( '415.txd' ) 
engineImportTXD( txd, 415 ) 
dff = engineLoadDFF('415.dff', 415) 
engineReplaceModel( dff, 415 )
--
txd = engineLoadTXD( '416.txd' ) 
engineImportTXD( txd, 416 ) 
dff = engineLoadDFF('416.dff', 416) 
engineReplaceModel( dff, 416 )
--
txd = engineLoadTXD( '418.txd' ) 
engineImportTXD( txd, 418 ) 
dff = engineLoadDFF('418.dff', 418) 
engineReplaceModel( dff, 418 )
--
txd = engineLoadTXD( '420.txd' ) 
engineImportTXD( txd, 420 ) 
dff = engineLoadDFF('420.dff', 420) 
engineReplaceModel( dff, 420 )
--
txd = engineLoadTXD( '421.txd' ) 
engineImportTXD( txd, 421 ) 
dff = engineLoadDFF('421.dff', 421) 
engineReplaceModel( dff, 421 )
--

txd = engineLoadTXD( '422.txd' ) 
engineImportTXD( txd, 422 ) 
dff = engineLoadDFF('422.dff', 422) 
engineReplaceModel( dff, 422 )
--
txd = engineLoadTXD( '425.txd' ) 
engineImportTXD( txd, 425 ) 
dff = engineLoadDFF('425.dff', 425) 
engineReplaceModel( dff, 425 )
--
txd = engineLoadTXD( '426.txd' ) 
engineImportTXD( txd, 426 ) 
dff = engineLoadDFF('426.dff', 426) 
engineReplaceModel( dff, 426 )
--
txd = engineLoadTXD( '427.txd' ) 
engineImportTXD( txd, 427 ) 
dff = engineLoadDFF('427.dff', 427) 
engineReplaceModel( dff, 427 )
--
txd = engineLoadTXD( '429.txd' ) 
engineImportTXD( txd, 429 ) 
dff = engineLoadDFF('429.dff', 429) 
engineReplaceModel( dff, 429 )
--
txd = engineLoadTXD( '432.txd' ) 
engineImportTXD( txd, 432 ) 
dff = engineLoadDFF('432.dff', 432) 
engineReplaceModel( dff, 432 )
--
txd = engineLoadTXD( '434.txd' ) 
engineImportTXD( txd, 434 ) 
dff = engineLoadDFF('434.dff', 434) 
engineReplaceModel( dff, 434 )
--
txd = engineLoadTXD( '436.txd' ) 
engineImportTXD( txd, 436 ) 
dff = engineLoadDFF('436.dff', 436) 
engineReplaceModel( dff, 436 )
--
txd = engineLoadTXD( '442.txd' ) 
engineImportTXD( txd, 442 ) 
dff = engineLoadDFF('442.dff', 442) 
engineReplaceModel( dff, 442 )
--
txd = engineLoadTXD( '444.txd' ) 
engineImportTXD( txd, 444 ) 
dff = engineLoadDFF('444.dff', 444) 
engineReplaceModel( dff, 444 )
--
txd = engineLoadTXD( '445.txd' ) 
engineImportTXD( txd, 445 ) 
dff = engineLoadDFF('445.dff', 445) 
engineReplaceModel( dff, 445 )
--
txd = engineLoadTXD( '447.txd' ) 
engineImportTXD( txd, 447 ) 
dff = engineLoadDFF('447.dff', 447) 
engineReplaceModel( dff, 447 )
--
txd = engineLoadTXD( '451.txd' ) 
engineImportTXD( txd, 451 ) 
dff = engineLoadDFF('451.dff', 451) 
engineReplaceModel( dff, 451 )
--
txd = engineLoadTXD( '454.txd' ) 
engineImportTXD( txd, 454 ) 
dff = engineLoadDFF('454.dff', 454) 
engineReplaceModel( dff, 454 )
--
txd = engineLoadTXD( '458.txd' ) 
engineImportTXD( txd, 458 ) 
dff = engineLoadDFF('458.dff', 458) 
engineReplaceModel( dff, 458 )
--
txd = engineLoadTXD( '460.txd' ) 
engineImportTXD( txd, 460 ) 
dff = engineLoadDFF('460.dff', 460) 
engineReplaceModel( dff, 460 )
--
txd = engineLoadTXD( '461.txd' ) 
engineImportTXD( txd, 461 ) 
dff = engineLoadDFF('461.dff', 461) 
engineReplaceModel( dff, 461 )
--
txd = engineLoadTXD( '462.txd' ) 
engineImportTXD( txd, 462 ) 
dff = engineLoadDFF('462.dff', 462) 
engineReplaceModel( dff, 462 )
--
txd = engineLoadTXD( '463.txd' ) 
engineImportTXD( txd, 463 ) 
dff = engineLoadDFF('463.dff', 463) 
engineReplaceModel( dff, 463 )
--

--
txd = engineLoadTXD( '467.txd' ) 
engineImportTXD( txd, 467 ) 
dff = engineLoadDFF('467.dff', 467) 
engineReplaceModel( dff, 467 )
--
txd = engineLoadTXD( '468.txd' ) 
engineImportTXD( txd, 468 ) 
dff = engineLoadDFF('468.dff', 468) 
engineReplaceModel( dff, 468 )
--
txd = engineLoadTXD( '469.txd' ) 
engineImportTXD( txd, 469 ) 
dff = engineLoadDFF('469.dff', 469) 
engineReplaceModel( dff, 469 )
--
txd = engineLoadTXD( '470.txd' ) 
engineImportTXD( txd, 470 ) 
dff = engineLoadDFF('470.dff', 470) 
engineReplaceModel( dff, 470 )
--
txd = engineLoadTXD( '474.txd' ) 
engineImportTXD( txd, 474 ) 
dff = engineLoadDFF('474.dff', 474) 
engineReplaceModel( dff, 474 )
--
txd = engineLoadTXD( '475.txd' ) 
engineImportTXD( txd, 475 ) 
dff = engineLoadDFF('475.dff', 475) 
engineReplaceModel( dff, 475 )
--
txd = engineLoadTXD( '477.txd' ) 
engineImportTXD( txd, 477 ) 
dff = engineLoadDFF('477.dff', 477) 
engineReplaceModel( dff, 477 )
--
txd = engineLoadTXD( '479.txd' ) 
engineImportTXD( txd, 479 ) 
dff = engineLoadDFF('479.dff', 479) 
engineReplaceModel( dff, 479 )
--
txd = engineLoadTXD( '480.txd' ) 
engineImportTXD( txd, 480 ) 
dff = engineLoadDFF('480.dff', 480) 
engineReplaceModel( dff, 480 )
--
txd = engineLoadTXD( '482.txd' ) 
engineImportTXD( txd, 482 ) 
dff = engineLoadDFF('482.dff', 482) 
engineReplaceModel( dff, 482 )
--
txd = engineLoadTXD( '484.txd' ) 
engineImportTXD( txd, 484 ) 
dff = engineLoadDFF('484.dff', 484) 
engineReplaceModel( dff, 484 )
--
txd = engineLoadTXD( '487.txd' ) 
engineImportTXD( txd, 487 ) 
dff = engineLoadDFF('487.dff', 487) 
engineReplaceModel( dff, 487 )
--
txd = engineLoadTXD( '488.txd' ) 
engineImportTXD( txd, 488 ) 
dff = engineLoadDFF('488.dff', 488) 
engineReplaceModel( dff, 488 )
--
txd = engineLoadTXD( '490.txd' ) 
engineImportTXD( txd, 490 ) 
dff = engineLoadDFF('490.dff', 490) 
engineReplaceModel( dff, 490 )
--
txd = engineLoadTXD( '491.txd' ) 
engineImportTXD( txd, 491 ) 
dff = engineLoadDFF('491.dff', 491) 
engineReplaceModel( dff, 491 )
--
txd = engineLoadTXD( '492.txd' ) 
engineImportTXD( txd, 492 ) 
dff = engineLoadDFF('492.dff', 492) 
engineReplaceModel( dff, 492 )
--
txd = engineLoadTXD( '494.txd' ) 
engineImportTXD( txd, 494 ) 
dff = engineLoadDFF('494.dff', 494) 
engineReplaceModel( dff, 494 )
--
txd = engineLoadTXD( '495.txd' ) 
engineImportTXD( txd, 495 ) 
dff = engineLoadDFF('495.dff', 495) 
engineReplaceModel( dff, 495 )
--
txd = engineLoadTXD( '496.txd' ) 
engineImportTXD( txd, 496 ) 
dff = engineLoadDFF('496.dff', 496) 
engineReplaceModel( dff, 496 )
--
txd = engineLoadTXD( '497.txd' ) 
engineImportTXD( txd, 497 ) 
dff = engineLoadDFF('497.dff', 497) 
engineReplaceModel( dff, 497 )
--
txd = engineLoadTXD( '501.txd' ) 
engineImportTXD( txd, 501 ) 
dff = engineLoadDFF('501.dff', 501) 
engineReplaceModel( dff, 501 )

--
txd = engineLoadTXD( '502.txd' ) 
engineImportTXD( txd, 502 ) 
dff = engineLoadDFF('502.dff', 502) 
engineReplaceModel( dff, 502 )

--
txd = engineLoadTXD( '503.txd' ) 
engineImportTXD( txd, 503 ) 
dff = engineLoadDFF('503.dff', 503) 
engineReplaceModel( dff, 503 )

--
txd = engineLoadTXD( '506.txd' ) 
engineImportTXD( txd, 506 ) 
dff = engineLoadDFF('506.dff', 506) 
engineReplaceModel( dff, 506 )

--
txd = engineLoadTXD( '511.txd' ) 
engineImportTXD( txd, 511 ) 
dff = engineLoadDFF('511.dff', 511) 
engineReplaceModel( dff, 511 )

--
txd = engineLoadTXD( '514.txd' ) 
engineImportTXD( txd, 514 ) 
dff = engineLoadDFF('514.dff', 514) 
engineReplaceModel( dff, 514 )


--
txd = engineLoadTXD( '516.txd' ) 
engineImportTXD( txd, 516 ) 
dff = engineLoadDFF('516.dff', 516) 
engineReplaceModel( dff, 516 )


--
txd = engineLoadTXD( '517.txd' ) 
engineImportTXD( txd, 517 ) 
dff = engineLoadDFF('517.dff', 517) 
engineReplaceModel( dff, 517 )


-- 
txd = engineLoadTXD( '518.txd' ) 
engineImportTXD( txd, 518 ) 
dff = engineLoadDFF('518.dff', 518) 
engineReplaceModel( dff, 518 )


--
txd = engineLoadTXD( '520.txd' ) 
engineImportTXD( txd, 520 ) 
dff = engineLoadDFF('520.dff', 520) 
engineReplaceModel( dff, 520 )


--
txd = engineLoadTXD( '521.txd' ) 
engineImportTXD( txd, 521 ) 
dff = engineLoadDFF('521.dff', 521) 
engineReplaceModel( dff, 521 )


--
txd = engineLoadTXD( '522.txd' ) 
engineImportTXD( txd, 522 ) 
dff = engineLoadDFF('522.dff', 522) 
engineReplaceModel( dff, 522 )


--
txd = engineLoadTXD( '523.txd' ) 
engineImportTXD( txd, 523 ) 
dff = engineLoadDFF('523.dff', 523) 
engineReplaceModel( dff, 523 )





--
txd = engineLoadTXD( '526.txd' ) 
engineImportTXD( txd, 526 ) 
dff = engineLoadDFF('526.dff', 526) 
engineReplaceModel( dff, 526 )


--
txd = engineLoadTXD( '527.txd' ) 
engineImportTXD( txd, 527 ) 
dff = engineLoadDFF('527.dff', 527) 
engineReplaceModel( dff, 527 )


--
txd = engineLoadTXD( '528.txd' ) 
engineImportTXD( txd, 528 ) 
dff = engineLoadDFF('528.dff', 528) 
engineReplaceModel( dff, 528 )


--
txd = engineLoadTXD( '529.txd' ) 
engineImportTXD( txd, 529 ) 
dff = engineLoadDFF('529.dff', 529) 
engineReplaceModel( dff, 529 )
--
txd = engineLoadTXD( '534.txd' ) 
engineImportTXD( txd, 534 ) 
dff = engineLoadDFF('534.dff', 534) 
engineReplaceModel( dff, 534 )
--
txd = engineLoadTXD( '536.txd' ) 
engineImportTXD( txd, 536 ) 
dff = engineLoadDFF('536.dff', 536) 
engineReplaceModel( dff, 536 )



txd = engineLoadTXD( '540.txd' ) 
engineImportTXD( txd, 540 ) 
dff = engineLoadDFF('540.dff', 540) 
engineReplaceModel( dff, 540 )



txd = engineLoadTXD( '541.txd' ) 
engineImportTXD( txd, 541 ) 
dff = engineLoadDFF('541.dff', 541) 
engineReplaceModel( dff, 541 )



txd = engineLoadTXD( '542.txd' ) 
engineImportTXD( txd, 542 ) 
dff = engineLoadDFF('542.dff', 542) 
engineReplaceModel( dff, 542 )



txd = engineLoadTXD( '546.txd' ) 
engineImportTXD( txd, 546 ) 
dff = engineLoadDFF('546.dff', 546) 
engineReplaceModel( dff, 546 )



txd = engineLoadTXD( '547.txd' ) 
engineImportTXD( txd, 547 ) 
dff = engineLoadDFF('547.dff', 547) 
engineReplaceModel( dff, 547 )



txd = engineLoadTXD( '548.txd' ) 
engineImportTXD( txd, 548 ) 
dff = engineLoadDFF('548.dff', 548) 
engineReplaceModel( dff, 548 )



txd = engineLoadTXD( '549.txd' ) 
engineImportTXD( txd, 549 ) 
dff = engineLoadDFF('549.dff', 549) 
engineReplaceModel( dff, 549 )



txd = engineLoadTXD( '550.txd' ) 
engineImportTXD( txd, 550 ) 
dff = engineLoadDFF('550.dff', 550) 
engineReplaceModel( dff, 550 )



txd = engineLoadTXD( '551.txd' ) 
engineImportTXD( txd, 551 ) 
dff = engineLoadDFF('551.dff', 551) 
engineReplaceModel( dff, 551 )



txd = engineLoadTXD( '555.txd' ) 
engineImportTXD( txd, 555 ) 
dff = engineLoadDFF('555.dff', 555) 
engineReplaceModel( dff, 555 )



txd = engineLoadTXD( '559.txd' ) 
engineImportTXD( txd, 559 ) 
dff = engineLoadDFF('559.dff', 559) 
engineReplaceModel( dff, 559 )



txd = engineLoadTXD( '560.txd' ) 
engineImportTXD( txd, 560 ) 
dff = engineLoadDFF('560.dff', 560) 
engineReplaceModel( dff, 560 )



txd = engineLoadTXD( '561.txd' ) 
engineImportTXD( txd, 561 ) 
dff = engineLoadDFF('561.dff', 561) 
engineReplaceModel( dff, 561 )



txd = engineLoadTXD( '562.txd' ) 
engineImportTXD( txd, 562 ) 
dff = engineLoadDFF('562.dff', 562) 
engineReplaceModel( dff, 562 )



txd = engineLoadTXD( '566.txd' ) 
engineImportTXD( txd, 566 ) 
dff = engineLoadDFF('566.dff', 566) 
engineReplaceModel( dff, 566 )



txd = engineLoadTXD( '567.txd' ) 
engineImportTXD( txd, 567 ) 
dff = engineLoadDFF('567.dff', 567) 
engineReplaceModel( dff, 567 )



txd = engineLoadTXD( '567.txd' ) 
engineImportTXD( txd, 567 ) 
dff = engineLoadDFF('567.dff', 567) 
engineReplaceModel( dff, 567 )



txd = engineLoadTXD( '568.txd' ) 
engineImportTXD( txd, 568 ) 
dff = engineLoadDFF('568.dff', 568) 
engineReplaceModel( dff, 568 )



txd = engineLoadTXD( '573.txd' ) 
engineImportTXD( txd, 573 ) 
dff = engineLoadDFF('573.dff', 573) 
engineReplaceModel( dff, 573 )



txd = engineLoadTXD( '575.txd' ) 
engineImportTXD( txd, 575 ) 
dff = engineLoadDFF('575.dff', 575) 
engineReplaceModel( dff, 575 )



txd = engineLoadTXD( '577.txd' ) 
engineImportTXD( txd, 577 ) 
dff = engineLoadDFF('577.dff', 577) 
engineReplaceModel( dff, 577 )



txd = engineLoadTXD( '579.txd' ) 
engineImportTXD( txd, 579 ) 
dff = engineLoadDFF('579.dff', 579) 
engineReplaceModel( dff, 579 )



txd = engineLoadTXD( '580.txd' ) 
engineImportTXD( txd, 580 ) 
dff = engineLoadDFF('580.dff', 580) 
engineReplaceModel( dff, 580 )



txd = engineLoadTXD( '581.txd' ) 
engineImportTXD( txd, 581 ) 
dff = engineLoadDFF('581.dff', 581) 
engineReplaceModel( dff, 581 )



txd = engineLoadTXD( '582.txd' ) 
engineImportTXD( txd, 582 ) 
dff = engineLoadDFF('582.dff', 582) 
engineReplaceModel( dff, 582 )



txd = engineLoadTXD( '585.txd' ) 
engineImportTXD( txd, 585 ) 
dff = engineLoadDFF('585.dff', 585) 
engineReplaceModel( dff, 585 )



txd = engineLoadTXD( '587.txd' ) 
engineImportTXD( txd, 587 ) 
dff = engineLoadDFF('587.dff', 587) 
engineReplaceModel( dff, 587 )



txd = engineLoadTXD( '588.txd' ) 
engineImportTXD( txd, 588 ) 
dff = engineLoadDFF('588.dff', 588) 
engineReplaceModel( dff, 588 )



txd = engineLoadTXD( '589.txd' ) 
engineImportTXD( txd, 589 ) 
dff = engineLoadDFF('589.dff', 589) 
engineReplaceModel( dff, 589 )



txd = engineLoadTXD( '596.txd' ) 
engineImportTXD( txd, 596 ) 
dff = engineLoadDFF('596.dff', 596) 
engineReplaceModel( dff, 596 )



txd = engineLoadTXD( '597.txd' ) 
engineImportTXD( txd, 597 ) 
dff = engineLoadDFF('597.dff', 597) 
engineReplaceModel( dff, 597 )



txd = engineLoadTXD( '598.txd' ) 
engineImportTXD( txd, 598 ) 
dff = engineLoadDFF('598.dff', 598) 
engineReplaceModel( dff, 598 )



txd = engineLoadTXD( '599.txd' ) 
engineImportTXD( txd, 599 ) 
dff = engineLoadDFF('599.dff', 599) 
engineReplaceModel( dff, 599 )



txd = engineLoadTXD( '601.txd' ) 
engineImportTXD( txd, 601 ) 
dff = engineLoadDFF('601.dff', 601) 
engineReplaceModel( dff, 601 )



txd = engineLoadTXD( '602.txd' ) 
engineImportTXD( txd, 602 ) 
dff = engineLoadDFF('602.dff', 602) 
engineReplaceModel( dff, 602 )



txd = engineLoadTXD( '603.txd' ) 
engineImportTXD( txd, 603 ) 
dff = engineLoadDFF('603.dff', 603) 
engineReplaceModel( dff, 603 )



txd = engineLoadTXD( '604.txd' ) 
engineImportTXD( txd, 604 ) 
dff = engineLoadDFF('604.dff', 604) 
engineReplaceModel( dff, 604 )

end)
