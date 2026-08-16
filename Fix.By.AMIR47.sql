-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2024 at 11:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `@khodeoxygen`
--

-- --------------------------------------------------------

--
-- Table structure for table `bankaccounts`
--

CREATE TABLE `bankaccounts` (
  `bOwner` varchar(40) NOT NULL,
  `bPassword` int(4) NOT NULL,
  `bMoney` int(20) NOT NULL,
  `bNumber` int(255) NOT NULL,
  `bSecPassword` int(6) NOT NULL,
  `bCvv2` int(3) NOT NULL,
  `bExpire` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banktickets`
--

CREATE TABLE `banktickets` (
  `ticketID` int(60) NOT NULL,
  `ticketAmount` int(20) NOT NULL,
  `transferBy` int(16) NOT NULL,
  `transferTo` int(16) NOT NULL,
  `ticketDate` date NOT NULL,
  `ticketTime` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bourse`
--

CREATE TABLE `bourse` (
  `saham` text NOT NULL,
  `arzesh` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `bID` int(11) NOT NULL,
  `bOwner` bigint(50) NOT NULL,
  `bName` tinytext NOT NULL DEFAULT '',
  `bX` float NOT NULL,
  `bY` float NOT NULL,
  `bZ` float NOT NULL,
  `bIntX` float NOT NULL,
  `bIntY` float NOT NULL,
  `bIntZ` float NOT NULL,
  `bInterior` bigint(50) DEFAULT 0,
  `bDimension` bigint(50) DEFAULT 0,
  `bMoney` bigint(50) DEFAULT 0,
  `bEnter` bigint(50) DEFAULT 50,
  `bPrice` bigint(50) DEFAULT 0,
  `bForSell` bigint(50) DEFAULT 0,
  `bLock` bigint(50) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `challengs`
--

CREATE TABLE `challengs` (
  `ChUser` int(1) NOT NULL,
  `Challenge1` int(1) NOT NULL,
  `Challenge2` int(1) NOT NULL,
  `Challenge3` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faction`
--

CREATE TABLE `faction` (
  `Row` int(11) NOT NULL,
  `fId` int(30) NOT NULL,
  `fName` varchar(50) NOT NULL,
  `fKhazane` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `familys`
--

CREATE TABLE `familys` (
  `fID` int(60) NOT NULL,
  `fName` varchar(20) NOT NULL,
  `fOwner` int(10) NOT NULL,
  `fShoar` varchar(50) NOT NULL,
  `fMemberSlot` int(4) NOT NULL,
  `fVehSlot` int(4) NOT NULL,
  `fTag` varchar(5) NOT NULL,
  `fLogo` int(3) NOT NULL,
  `fR` int(4) NOT NULL,
  `fG` int(4) NOT NULL,
  `fB` int(4) NOT NULL,
  `fRank8` varchar(10) NOT NULL,
  `fRank7` varchar(10) NOT NULL,
  `fRank6` varchar(10) NOT NULL,
  `fRank5` varchar(10) NOT NULL,
  `fRank4` varchar(10) NOT NULL,
  `fRank3` varchar(10) NOT NULL,
  `fRank2` varchar(10) NOT NULL,
  `fRank1` varchar(10) NOT NULL,
  `fGover` int(2) NOT NULL DEFAULT 0,
  `fPrice` int(7) NOT NULL,
  `fActive` int(3) NOT NULL DEFAULT 0,
  `fBan` int(25) NOT NULL DEFAULT 0,
  `fPerBan` int(3) NOT NULL DEFAULT 0,
  `fBanedBy` varchar(25) NOT NULL DEFAULT '',
  `fTime` int(20) NOT NULL DEFAULT 720,
  `fScore` int(6) NOT NULL DEFAULT 0,
  `fCreateDate` varchar(40) NOT NULL,
  `fPgx` varchar(25) DEFAULT NULL,
  `fPgy` varchar(25) DEFAULT NULL,
  `fPgz` varchar(25) DEFAULT NULL,
  `fGz` varchar(25) DEFAULT NULL,
  `fGx` varchar(25) DEFAULT NULL,
  `fGy` varchar(25) DEFAULT NULL,
  `fGrx` varchar(30) DEFAULT NULL,
  `fGry` varchar(30) DEFAULT NULL,
  `fGrz` varchar(30) DEFAULT NULL,
  `veh1` int(4) DEFAULT NULL,
  `veh2` int(4) DEFAULT NULL,
  `veh3` int(4) DEFAULT NULL,
  `veh4` int(4) DEFAULT NULL,
  `veh5` int(4) DEFAULT NULL,
  `veh6` int(4) DEFAULT NULL,
  `veh7` int(4) DEFAULT NULL,
  `veh8` int(4) DEFAULT NULL,
  `veh9` int(4) DEFAULT NULL,
  `veh10` int(4) DEFAULT NULL,
  `veh11` int(4) DEFAULT NULL,
  `veh12` int(4) DEFAULT NULL,
  `veh13` int(4) DEFAULT NULL,
  `veh14` int(4) DEFAULT NULL,
  `veh15` int(4) DEFAULT NULL,
  `veh16` int(4) DEFAULT NULL,
  `veh17` int(4) DEFAULT NULL,
  `veh18` int(4) DEFAULT NULL,
  `veh19` int(4) DEFAULT NULL,
  `veh20` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `ID` int(6) NOT NULL,
  `X` float DEFAULT NULL,
  `Y` float DEFAULT NULL,
  `Z` float DEFAULT NULL,
  `INTERIOR` int(10) DEFAULT NULL,
  `INTX` float DEFAULT NULL,
  `INTY` float DEFAULT NULL,
  `INTZ` float DEFAULT NULL,
  `MONEY` int(20) DEFAULT 0,
  `WEAP1` varchar(45) DEFAULT '0',
  `WEAP2` varchar(45) DEFAULT '0',
  `WEAP3` varchar(45) DEFAULT '0',
  `LOCKED` int(2) DEFAULT 0,
  `PRICE` int(10) DEFAULT 0,
  `OWNER` varchar(32) DEFAULT 'no-one',
  `RENTABLE` int(2) DEFAULT 0,
  `RENTALPRICE` int(10) DEFAULT 0,
  `RENT1` varchar(32) DEFAULT 'no-one',
  `RENT2` varchar(32) DEFAULT 'no-one',
  `RENT3` varchar(32) DEFAULT 'no-one',
  `RENT4` varchar(32) DEFAULT 'no-one',
  `RENT5` varchar(32) DEFAULT 'no-one',
  `RENT6` varchar(32) NOT NULL,
  `RENT7` varchar(32) NOT NULL,
  `RENT8` varchar(32) NOT NULL,
  `RENT9` varchar(32) NOT NULL,
  `RENT10` varchar(32) NOT NULL,
  `RENT11` varchar(32) NOT NULL,
  `RENT12` varchar(32) NOT NULL,
  `RENT13` varchar(32) NOT NULL,
  `RENT14` varchar(32) NOT NULL,
  `RENT15` varchar(32) NOT NULL,
  `Linked` int(25) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `InvID` int(60) NOT NULL,
  `InvOwner` varchar(255) NOT NULL,
  `Item1` int(255) NOT NULL DEFAULT 0,
  `Item2` int(255) NOT NULL DEFAULT 0,
  `Item3` int(255) NOT NULL DEFAULT 0,
  `Item4` int(255) NOT NULL DEFAULT 0,
  `Item5` int(255) NOT NULL DEFAULT 0,
  `Item6` int(255) NOT NULL DEFAULT 0,
  `Item7` int(255) NOT NULL DEFAULT 0,
  `Item8` int(255) NOT NULL DEFAULT 0,
  `Item9` int(255) NOT NULL DEFAULT 0,
  `Item10` int(255) NOT NULL DEFAULT 0,
  `Item11` int(255) NOT NULL DEFAULT 0,
  `Item12` int(255) NOT NULL DEFAULT 0,
  `Item13` int(255) NOT NULL DEFAULT 0,
  `Item14` int(255) NOT NULL DEFAULT 0,
  `Item15` int(255) NOT NULL DEFAULT 0,
  `Item16` int(255) NOT NULL DEFAULT 0,
  `Item17` int(255) NOT NULL DEFAULT 0,
  `Item18` int(255) NOT NULL DEFAULT 0,
  `Item19` int(255) NOT NULL DEFAULT 0,
  `Item20` int(255) NOT NULL DEFAULT 0,
  `Item21` int(255) NOT NULL DEFAULT 0,
  `Item22` int(255) NOT NULL DEFAULT 0,
  `Item23` int(255) NOT NULL DEFAULT 0,
  `Item24` int(255) NOT NULL DEFAULT 0,
  `Item25` int(255) NOT NULL DEFAULT 0,
  `Item26` int(255) NOT NULL DEFAULT 0,
  `Item27` int(255) NOT NULL DEFAULT 0,
  `Item28` int(255) NOT NULL DEFAULT 0,
  `Item29` int(255) NOT NULL DEFAULT 0,
  `Item30` int(255) NOT NULL DEFAULT 0,
  `Item31` int(255) NOT NULL DEFAULT 0,
  `Item32` int(255) NOT NULL DEFAULT 0,
  `Item33` int(255) NOT NULL DEFAULT 0,
  `Item34` int(255) NOT NULL DEFAULT 0,
  `Item35` int(255) NOT NULL DEFAULT 0,
  `Item36` int(255) NOT NULL DEFAULT 0,
  `Item37` int(255) NOT NULL DEFAULT 0,
  `Item38` int(255) NOT NULL DEFAULT 0,
  `Item39` int(255) NOT NULL DEFAULT 0,
  `Item40` int(255) NOT NULL DEFAULT 0,
  `Item41` int(255) NOT NULL DEFAULT 0,
  `Item42` int(255) NOT NULL DEFAULT 0,
  `Item43` int(255) NOT NULL DEFAULT 0,
  `Item44` int(255) NOT NULL DEFAULT 0,
  `Item45` int(255) NOT NULL DEFAULT 0,
  `Item46` int(255) NOT NULL DEFAULT 0,
  `Item47` int(255) NOT NULL DEFAULT 0,
  `Item48` int(255) NOT NULL DEFAULT 0,
  `Item49` int(255) NOT NULL DEFAULT 0,
  `Item50` int(255) NOT NULL DEFAULT 0,
  `Item51` int(255) NOT NULL DEFAULT 0,
  `Item52` int(255) NOT NULL DEFAULT 0,
  `Item53` int(255) NOT NULL DEFAULT 0,
  `Item54` int(255) NOT NULL DEFAULT 0,
  `Item55` int(255) NOT NULL DEFAULT 0,
  `Amount1` int(255) NOT NULL DEFAULT 0,
  `Amount2` int(255) NOT NULL DEFAULT 0,
  `Amount3` int(255) NOT NULL DEFAULT 0,
  `Amount4` int(255) NOT NULL DEFAULT 0,
  `Amount5` int(255) NOT NULL DEFAULT 0,
  `Amount6` int(255) NOT NULL DEFAULT 0,
  `Amount7` int(255) NOT NULL DEFAULT 0,
  `Amount8` int(255) NOT NULL DEFAULT 0,
  `Amount9` int(255) NOT NULL DEFAULT 0,
  `Amount10` int(255) NOT NULL DEFAULT 0,
  `Amount11` int(255) NOT NULL DEFAULT 0,
  `Amount12` int(255) NOT NULL DEFAULT 0,
  `Amount13` int(255) NOT NULL DEFAULT 0,
  `Amount14` int(255) NOT NULL DEFAULT 0,
  `Amount15` int(255) NOT NULL DEFAULT 0,
  `Amount16` int(255) NOT NULL DEFAULT 0,
  `Amount17` int(255) NOT NULL DEFAULT 0,
  `Amount18` int(255) NOT NULL DEFAULT 0,
  `Amount19` int(255) NOT NULL DEFAULT 0,
  `Amount20` int(255) NOT NULL DEFAULT 0,
  `Amount21` int(255) NOT NULL DEFAULT 0,
  `Amount22` int(255) NOT NULL DEFAULT 0,
  `Amount23` int(255) NOT NULL DEFAULT 0,
  `Amount24` int(255) NOT NULL DEFAULT 0,
  `Amount25` int(255) NOT NULL DEFAULT 0,
  `Amount26` int(255) NOT NULL DEFAULT 0,
  `Amount27` int(255) NOT NULL DEFAULT 0,
  `Amount28` int(255) NOT NULL DEFAULT 0,
  `Amount29` int(255) NOT NULL DEFAULT 0,
  `Amount30` int(255) NOT NULL DEFAULT 0,
  `Amount31` int(255) NOT NULL DEFAULT 0,
  `Amount32` int(255) NOT NULL DEFAULT 0,
  `Amount33` int(255) NOT NULL DEFAULT 0,
  `Amount34` int(255) NOT NULL DEFAULT 0,
  `Amount35` int(255) NOT NULL DEFAULT 0,
  `Amount36` int(255) NOT NULL DEFAULT 0,
  `Amount37` int(255) NOT NULL DEFAULT 0,
  `Amount38` int(255) NOT NULL DEFAULT 0,
  `Amount39` int(255) NOT NULL DEFAULT 0,
  `Amount40` int(255) NOT NULL DEFAULT 0,
  `Amount41` int(255) NOT NULL DEFAULT 0,
  `Amount42` int(255) NOT NULL DEFAULT 0,
  `Amount43` int(255) NOT NULL DEFAULT 0,
  `Amount44` int(255) NOT NULL DEFAULT 0,
  `Amount45` int(255) NOT NULL DEFAULT 0,
  `Amount46` int(255) NOT NULL DEFAULT 0,
  `Amount47` int(255) NOT NULL DEFAULT 0,
  `Amount48` int(255) NOT NULL DEFAULT 0,
  `Amount49` int(255) NOT NULL DEFAULT 0,
  `Amount50` int(255) NOT NULL DEFAULT 0,
  `Amount51` int(255) NOT NULL DEFAULT 0,
  `Amount52` int(255) NOT NULL DEFAULT 0,
  `Amount53` int(255) NOT NULL DEFAULT 0,
  `Amount54` int(255) NOT NULL DEFAULT 0,
  `Amount55` int(255) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parking`
--

CREATE TABLE `parking` (
  `id` int(11) NOT NULL,
  `owner` varchar(20) DEFAULT 'no-one',
  `X` float NOT NULL DEFAULT 0,
  `Y` float NOT NULL DEFAULT 0,
  `Z` float NOT NULL DEFAULT 0,
  `price` int(8) NOT NULL,
  `capacity` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `server`
--

CREATE TABLE `server` (
  `bLastTicketID` int(60) NOT NULL,
  `LastAccount` varchar(40) NOT NULL,
  `MostPlayersOnline` int(10) NOT NULL,
  `Tax` int(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Text` text NOT NULL,
  `Object` int(255) NOT NULL,
  `Power` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `specialbizzes`
--

CREATE TABLE `specialbizzes` (
  `id` int(10) NOT NULL,
  `sbOwned` int(10) NOT NULL,
  `sbOwner` varchar(64) NOT NULL,
  `sbMessage` varchar(128) NOT NULL,
  `sbEntranceX` float NOT NULL,
  `sbEntranceY` float NOT NULL,
  `sbEntranceZ` float NOT NULL,
  `sbLevelNeeded` int(10) NOT NULL,
  `sbBuyPrice` int(20) NOT NULL,
  `sbEntranceCost` int(20) NOT NULL,
  `sbTill` int(30) NOT NULL,
  `sbProducts` int(21) NOT NULL,
  `sbMaxProducts` int(20) NOT NULL,
  `sbPriceProd` int(20) NOT NULL,
  `sbForosh` int(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `name` text DEFAULT NULL,
  `template` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokengold`
--

CREATE TABLE `tokengold` (
  `ID` int(11) NOT NULL,
  `Token` varchar(20) NOT NULL,
  `Active` int(11) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `turfs`
--

CREATE TABLE `turfs` (
  `id` int(11) NOT NULL,
  `zOwner` varchar(64) NOT NULL,
  `zBaj` int(10) NOT NULL,
  `zMinX` float NOT NULL,
  `zMinY` float NOT NULL,
  `zMaxX` float NOT NULL,
  `zMaxY` float NOT NULL,
  `turfAttacked` int(11) NOT NULL DEFAULT 0,
  `warAttacker` varchar(255) DEFAULT NULL,
  `warNow` int(11) NOT NULL DEFAULT 0,
  `turfHQ` int(11) NOT NULL,
  `turfStable` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `pID` int(60) NOT NULL,
  `pName` varchar(40) NOT NULL,
  `pOldName` varchar(17) CHARACTER SET latin7 COLLATE latin7_estonian_cs NOT NULL,
  `pKey` varchar(128) NOT NULL,
  `pSerial` text NOT NULL,
  `pLevel` int(20) NOT NULL,
  `pAdmin` int(10) NOT NULL,
  `pGoldPremium` int(10) NOT NULL,
  `pSilverPremium` int(10) NOT NULL,
  `pBronzePremium` int(10) NOT NULL,
  `pColorNameTime` int(3) NOT NULL,
  `pDayTimePremium` int(3) NOT NULL,
  `pConnectTime` int(10) NOT NULL,
  `pPlayTime` int(7) NOT NULL,
  `pClearWantedTime` int(2) NOT NULL,
  `pAFKtime` int(10) NOT NULL,
  `pReg` int(10) NOT NULL,
  `pRegistredDate` varchar(24) NOT NULL,
  `pLastLogin` varchar(64) NOT NULL,
  `pSex` int(10) NOT NULL,
  `pReal` varchar(64) NOT NULL,
  `pAge` varchar(10) NOT NULL,
  `pTheme` int(11) NOT NULL,
  `pRented` int(10) NOT NULL,
  `pMuteTime` int(10) NOT NULL,
  `pExp` int(10) NOT NULL,
  `pCash` int(20) NOT NULL,
  `pSecoundSerial` text NOT NULL,
  `pCrimes` int(10) NOT NULL,
  `pKills` int(20) NOT NULL,
  `pDeaths` int(20) NOT NULL,
  `pArrested` int(10) NOT NULL,
  `pWantedDeaths` int(10) NOT NULL,
  `pPhoneBook` int(10) NOT NULL,
  `pColorName` varchar(20) NOT NULL,
  `pLottoNr` int(10) NOT NULL,
  `pFishes` int(10) NOT NULL,
  `pJob` int(10) NOT NULL,
  `pPayCheck` float NOT NULL,
  `pHeadValue` int(10) NOT NULL,
  `pContractBy` varchar(25) NOT NULL,
  `pJailTime` int(10) NOT NULL,
  `pMats` int(10) NOT NULL,
  `pDrugs` int(10) NOT NULL,
  `pLeader` int(10) NOT NULL,
  `pTow` int(10) NOT NULL,
  `pMember` int(10) NOT NULL,
  `pPunish` int(10) NOT NULL,
  `pFwarn` int(10) NOT NULL,
  `pRank` int(10) NOT NULL,
  `cSkin` int(10) NOT NULL,
  `fSkin` int(10) NOT NULL,
  `pbusdriverSkill` int(10) NOT NULL,
  `pPilotSkill` int(10) NOT NULL,
  `pTruckerSkill` int(10) NOT NULL,
  `pSwSkill` int(10) NOT NULL,
  `pWalkieTalkie` int(10) NOT NULL,
  `pDetSkill` int(10) NOT NULL,
  `pLawSkill` int(10) NOT NULL,
  `pMechSkill` int(10) NOT NULL,
  `pJackSkill` int(10) NOT NULL,
  `pNewsSkill` int(10) NOT NULL,
  `pDrugsSkill` int(10) NOT NULL,
  `pMatsSkill` int(10) NOT NULL,
  `pTeam` int(10) NOT NULL,
  `pPnumber` int(10) NOT NULL,
  `pPhousekey` int(10) NOT NULL,
  `pCar` int(10) NOT NULL,
  `pRob` int(10) NOT NULL,
  `pRobSkill` int(10) NOT NULL,
  `pPbizkey` int(10) NOT NULL,
  `pCarLic` int(10) NOT NULL,
  `pFlyLic` int(10) NOT NULL,
  `pBoatLic` int(10) NOT NULL,
  `pFishLic` int(10) NOT NULL,
  `pGunLic` int(10) NOT NULL,
  `pMatsLic` int(10) NOT NULL,
  `pCarLicS` int(10) NOT NULL,
  `pFlyLicS` int(10) NOT NULL,
  `pBoatLicS` int(10) NOT NULL,
  `pGunLicS` int(10) NOT NULL,
  `pMatsLicS` int(10) NOT NULL,
  `pCarTime` int(10) NOT NULL,
  `pPayDayHad` int(10) NOT NULL,
  `pTut` int(10) NOT NULL,
  `pWarns` int(10) NOT NULL,
  `pCanistra` int(10) NOT NULL,
  `pMarriedTo` varchar(128) NOT NULL,
  `pLighter` int(10) NOT NULL,
  `pCigarettes` int(10) NOT NULL,
  `pLanguage` int(10) NOT NULL,
  `pLawyerPoint` int(10) NOT NULL,
  `pApproval` int(10) NOT NULL,
  `pWanted` int(10) NOT NULL,
  `cLocationx` float NOT NULL,
  `cLocationy` float NOT NULL,
  `cLocationz` float NOT NULL,
  `cAngle` float NOT NULL,
  `cColor1` int(10) NOT NULL,
  `cColor2` int(10) NOT NULL,
  `cModel` int(10) NOT NULL,
  `cPrice` int(20) NOT NULL,
  `cPlate` varchar(128) NOT NULL,
  `cLock` int(10) NOT NULL,
  `cDestroyed` int(10) NOT NULL,
  `cFuel` int(10) NOT NULL,
  `cHealth` float NOT NULL,
  `cPaintJob` int(10) NOT NULL,
  `cKilo` float NOT NULL,
  `cPanel` int(10) NOT NULL,
  `cDoors` int(10) NOT NULL,
  `cLights` int(10) NOT NULL,
  `cTires` int(10) NOT NULL,
  `cFixed` int(10) NOT NULL,
  `pEmail` varchar(1000) NOT NULL,
  `pIp` varchar(200) NOT NULL,
  `pBanReason` varchar(1000) NOT NULL,
  `cInsurance` int(10) NOT NULL,
  `pBannedBy` varchar(40) NOT NULL,
  `pBanTime` int(5) NOT NULL,
  `pHelper` int(10) NOT NULL,
  `pGetHitTime` int(30) NOT NULL,
  `pCar_2` int(20) NOT NULL,
  `cLocationx_2` float NOT NULL,
  `cLocationy_2` float NOT NULL,
  `cLocationz_2` float NOT NULL,
  `cAngle_2` float NOT NULL,
  `cColor1_2` int(10) NOT NULL,
  `cColor2_2` int(10) NOT NULL,
  `cModel_2` int(10) NOT NULL,
  `cPrice_2` int(20) NOT NULL,
  `cPlate_2` varchar(128) NOT NULL,
  `cLock_2` int(10) NOT NULL,
  `cDestroyed_2` int(20) NOT NULL,
  `cFuel_2` int(20) NOT NULL,
  `cHealth_2` float NOT NULL,
  `cPaintJob_2` int(20) NOT NULL,
  `cKilo_2` double NOT NULL,
  `cPanel_2` int(30) NOT NULL,
  `cDoors_2` int(30) NOT NULL,
  `cLights_2` int(30) NOT NULL,
  `cTires_2` int(30) NOT NULL,
  `cFixed_2` int(10) NOT NULL,
  `cInsurance_2` int(10) NOT NULL,
  `pReferral` int(30) NOT NULL,
  `gLocationX` double NOT NULL,
  `gLocationY` double NOT NULL,
  `gLocationZ` double NOT NULL,
  `gAngle` double NOT NULL,
  `gLocationX_2` double NOT NULL,
  `gLocationY_2` double NOT NULL,
  `gLocationZ_2` double NOT NULL,
  `gAngle_2` double NOT NULL,
  `gParked` int(5) NOT NULL,
  `gParked_2` int(5) NOT NULL,
  `pBanDays` int(10) NOT NULL,
  `cCantSell` int(11) NOT NULL,
  `TutTime` int(11) NOT NULL,
  `TutTime1` int(11) NOT NULL,
  `pCell` int(11) NOT NULL,
  `UsedFind` int(11) NOT NULL,
  `pAJailed` int(11) NOT NULL,
  `pRespectBonus` int(11) NOT NULL,
  `pMoneyBonus` int(11) NOT NULL,
  `pOnline` int(11) NOT NULL,
  `cAdmin` int(10) NOT NULL,
  `cAdmin_2` int(10) NOT NULL,
  `pRep` int(11) NOT NULL,
  `pAav` int(11) NOT NULL,
  `pHav` int(11) NOT NULL,
  `pLav` int(11) NOT NULL,
  `pVipAccount` int(11) NOT NULL,
  `pGold` int(11) NOT NULL,
  `pPermKmr` int(11) NOT NULL,
  `pClan` int(11) NOT NULL,
  `pClanRank` int(11) NOT NULL,
  `pClanTagType` varchar(20) NOT NULL,
  `pClanDays` int(11) NOT NULL,
  `pSlot` int(11) NOT NULL,
  `vSlot` int(11) NOT NULL,
  `pSoldierCard` int(11) NOT NULL,
  `pFightStyle` int(11) NOT NULL,
  `pRecoil` int(30) NOT NULL,
  `pM4Skill` int(10) NOT NULL,
  `pAk47Skill` int(10) NOT NULL,
  `pColt47Skill` int(10) NOT NULL,
  `pSawnoffSkill` int(10) NOT NULL,
  `pDeagleSkill` int(10) NOT NULL,
  `pSpistolSkill` int(10) NOT NULL,
  `pShotgunSkill` int(10) NOT NULL,
  `pSpasSkill` int(10) NOT NULL,
  `pUziSkill` int(10) NOT NULL,
  `pMp5Skill` int(10) NOT NULL,
  `pRifleSkill` int(10) NOT NULL,
  `pTamrin` int(2) NOT NULL,
  `pDrivingSkill` int(10) NOT NULL,
  `pBikingSkill` int(10) NOT NULL,
  `pCyclingSkill` int(10) NOT NULL,
  `pBank` int(30) NOT NULL,
  `pBankPass` int(4) NOT NULL,
  `pBankcDate` varchar(15) NOT NULL,
  `pBankQues` varchar(100) NOT NULL,
  `pBankAnswer` varchar(50) NOT NULL,
  `pAvEvent` int(10) NOT NULL,
  `pAvAd` int(10) NOT NULL,
  `pShootSound` int(10) NOT NULL,
  `pExplosionSound` int(10) NOT NULL,
  `pGodShader` int(10) NOT NULL,
  `pSkyEffect` int(1) NOT NULL,
  `pWaterEffect` int(1) NOT NULL,
  `pYearInfo` int(6) NOT NULL,
  `pMonthInfo` int(5) NOT NULL,
  `pDayInfo` int(5) NOT NULL,
  `pPlateVeh` varchar(64) CHARACTER SET latin7 COLLATE latin7_estonian_cs NOT NULL,
  `pCall110Time` int(1) NOT NULL,
  `Challenges1` int(1) NOT NULL,
  `Challenges2` int(1) NOT NULL,
  `Challenges3` int(1) NOT NULL,
  `Challenges4` int(1) NOT NULL,
  `Challenges5` int(1) NOT NULL,
  `Challenges6` int(1) NOT NULL,
  `Challenges7` int(1) NOT NULL,
  `Challenges8` int(1) NOT NULL,
  `Challenges9` int(1) NOT NULL,
  `Challenges10` int(1) NOT NULL,
  `Challenges11` int(1) NOT NULL,
  `Challenges12` int(1) NOT NULL,
  `Challenges13` int(1) NOT NULL,
  `Challenges14` int(3) NOT NULL,
  `pOldHouseName` varchar(40) NOT NULL,
  `pLocX` varchar(20) NOT NULL,
  `pLocY` varchar(20) NOT NULL,
  `pLocZ` varchar(20) NOT NULL,
  `pGoldPack` int(1) NOT NULL,
  `pHandsPower` int(4) NOT NULL,
  `pLegPower` int(4) NOT NULL,
  `pGymPoint` int(3) NOT NULL,
  `pInv1` text NOT NULL DEFAULT '0,0',
  `pInv2` text NOT NULL DEFAULT '0,0',
  `pInv3` text NOT NULL DEFAULT '0,0',
  `pInv4` text NOT NULL DEFAULT '0,0',
  `pInv5` text NOT NULL DEFAULT '0,0',
  `pInv6` text NOT NULL DEFAULT '0,0',
  `pInv7` text NOT NULL DEFAULT '0,0',
  `pInv8` text NOT NULL DEFAULT '0,0',
  `pInv9` text NOT NULL DEFAULT '0,0',
  `pCredit` int(11) NOT NULL,
  `pEnteghal` int(11) NOT NULL,
  `pFacHoghogh` int(11) NOT NULL,
  `pJoinFaction` varchar(16) NOT NULL,
  `pBom` int(11) NOT NULL,
  `pFishesh` int(11) NOT NULL,
  `pFisheshValue` int(11) NOT NULL,
  `pMyPrize` int(11) NOT NULL DEFAULT 1,
  `pOilerSkill` int(11) NOT NULL,
  `nArz` int(11) NOT NULL,
  `pArz` int(11) NOT NULL,
  `nSod` int(11) NOT NULL,
  `pItem1` int(11) NOT NULL,
  `pItem2` int(11) NOT NULL,
  `pItem3` int(11) NOT NULL,
  `pItem4` int(11) NOT NULL,
  `pItem5` int(11) NOT NULL,
  `pItem6` int(11) NOT NULL,
  `pItem7` int(11) NOT NULL,
  `pItem8` int(11) NOT NULL,
  `pItem9` int(11) NOT NULL,
  `pItem10` int(11) NOT NULL,
  `pItem11` int(11) NOT NULL,
  `pItem12` int(11) NOT NULL,
  `pInvHeal` int(11) NOT NULL,
  `pInvMile` int(11) NOT NULL,
  `pInvUnjail` int(11) NOT NULL,
  `pInvMasterKey` int(11) NOT NULL,
  `pBoxM` int(11) NOT NULL,
  `pBoxR` int(11) NOT NULL,
  `pBoxRe` int(11) NOT NULL,
  `pBoxH` int(11) NOT NULL,
  `pInvCarSlot` int(11) NOT NULL,
  `pInvFill` int(11) NOT NULL,
  `pInvKill` int(11) NOT NULL,
  `pJayizeBox` int(11) DEFAULT 0,
  `pRpBiz` int(11) NOT NULL,
  `pStart` int(10) NOT NULL DEFAULT 1,
  `pVip` int(11) NOT NULL DEFAULT 0,
  `pAv` int(11) NOT NULL DEFAULT 0,
  `pLabel` varchar(10) NOT NULL,
  `pSeriallock` int(2) NOT NULL DEFAULT 1,
  `pLastx` varchar(15) NOT NULL,
  `pLasty` varchar(15) NOT NULL,
  `pLastz` varchar(15) NOT NULL,
  `pHdRoad` int(2) NOT NULL DEFAULT 0,
  `pColorR` varchar(5) NOT NULL DEFAULT '255',
  `pColorG` varchar(5) NOT NULL DEFAULT '255',
  `pColorB` varchar(5) NOT NULL DEFAULT '255',
  `pSspeaker` int(6) NOT NULL DEFAULT 0,
  `pSspeakerLife` int(1) NOT NULL DEFAULT 0,
  `pFamiId` int(25) NOT NULL DEFAULT 0,
  `pFamilyRank` int(3) NOT NULL DEFAULT 0,
  `pTicketBan` int(15) NOT NULL DEFAULT 0,
  `pBanTicketResone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `pBanTicketBy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `pBanAdTime` int(25) NOT NULL DEFAULT 0,
  `pBanAdBy` varchar(50) DEFAULT NULL,
  `pBanAdResone` varchar(50) DEFAULT NULL,
  `pHowContract` int(2) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `vID` int(120) NOT NULL,
  `vOwner` varchar(255) NOT NULL,
  `vLock` bigint(10) NOT NULL,
  `vSideskirt` bigint(10) NOT NULL,
  `vRearbumper` bigint(10) NOT NULL,
  `vModel` bigint(10) NOT NULL,
  `vColor1G` bigint(10) NOT NULL,
  `vFuel` bigint(10) NOT NULL,
  `vFrontbullbars` bigint(10) NOT NULL,
  `vMisc` bigint(10) NOT NULL,
  `vLocationX` varchar(255) NOT NULL,
  `vColor1B` bigint(10) NOT NULL,
  `vHealth` bigint(10) NOT NULL,
  `vRearbullbars` bigint(10) NOT NULL,
  `vSlot` bigint(10) NOT NULL,
  `vLocationY` varchar(255) NOT NULL,
  `vColor2R` bigint(10) NOT NULL,
  `vPaintjob` bigint(10) NOT NULL,
  `vRoof` bigint(10) NOT NULL,
  `vLocationZ` varchar(255) NOT NULL,
  `vColor2G` bigint(10) NOT NULL,
  `vNitro` bigint(10) NOT NULL,
  `vRotationX` varchar(255) NOT NULL,
  `vColor2B` bigint(10) NOT NULL,
  `vDoors` bigint(10) NOT NULL,
  `vHydraulics` bigint(10) NOT NULL,
  `vRotationY` varchar(255) NOT NULL,
  `vLightsR` bigint(10) NOT NULL,
  `vStereo` bigint(10) NOT NULL,
  `vRotationZ` varchar(255) NOT NULL,
  `vLightsG` bigint(10) NOT NULL,
  `vHood` bigint(10) NOT NULL,
  `vWheels` bigint(10) NOT NULL,
  `vPrice` bigint(10) NOT NULL,
  `vLightsB` bigint(10) NOT NULL,
  `vVent` bigint(10) NOT NULL,
  `vExhaust` bigint(10) NOT NULL,
  `vColor1R` bigint(10) NOT NULL,
  `vPlate` varchar(15) NOT NULL,
  `vSpoiler` bigint(10) NOT NULL,
  `vFrontbumper` bigint(10) NOT NULL,
  `vNeon` bigint(10) NOT NULL,
  `vBime` int(10) NOT NULL,
  `vTamir` int(1) NOT NULL,
  `vSuspension` varchar(10) NOT NULL,
  `vGolded` int(1) NOT NULL,
  `vSorat` varchar(10) NOT NULL,
  `vShetab` varchar(10) NOT NULL,
  `vVazn` varchar(10) NOT NULL,
  `vVaznPich` varchar(10) NOT NULL,
  `vinteria` varchar(10) NOT NULL,
  `vTormoz` varchar(10) NOT NULL,
  `vBrakebias` varchar(10) NOT NULL,
  `vDamage` varchar(10) NOT NULL,
  `vDrag` varchar(10) NOT NULL,
  `vDrivetype` varchar(10) NOT NULL,
  `vFarmon` varchar(10) NOT NULL,
  `vFarmon1` varchar(10) NOT NULL,
  `vEngineDrag` int(1) NOT NULL,
  `vEngineUltra` int(1) NOT NULL,
  `vPolice` int(11) NOT NULL,
  `pChips` int(11) NOT NULL,
  `vSuspensionlowerlimit` text NOT NULL,
  `vCenterMass` int(11) NOT NULL,
  `vLowerLimit` int(11) NOT NULL,
  `vSusForce` int(11) NOT NULL,
  `vMove` int(11) NOT NULL,
  `vLocationint` int(10) NOT NULL DEFAULT 0,
  `vLocationdim` int(10) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `war`
--

CREATE TABLE `war` (
  `warID` int(255) NOT NULL,
  `warAttacker` float DEFAULT NULL,
  `warDefender` float DEFAULT NULL,
  `warHour` int(10) DEFAULT NULL,
  `warDay` int(10) DEFAULT NULL,
  `warNow` int(10) DEFAULT NULL,
  `warAttackerScore` int(10) DEFAULT NULL,
  `warDefenderScore` int(10) DEFAULT NULL,
  `warTurf` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bankaccounts`
--
ALTER TABLE `bankaccounts`
  ADD UNIQUE KEY `bOwner` (`bOwner`,`bPassword`,`bMoney`,`bNumber`,`bSecPassword`,`bCvv2`,`bExpire`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `faction`
--
ALTER TABLE `faction`
  ADD PRIMARY KEY (`Row`);

--
-- Indexes for table `familys`
--
ALTER TABLE `familys`
  ADD PRIMARY KEY (`fID`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`InvID`);

--
-- Indexes for table `parking`
--
ALTER TABLE `parking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specialbizzes`
--
ALTER TABLE `specialbizzes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokengold`
--
ALTER TABLE `tokengold`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `turfs`
--
ALTER TABLE `turfs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`pID`),
  ADD KEY `pPayCheck` (`pPayCheck`),
  ADD KEY `pCar` (`pCar`),
  ADD KEY `pRobSkill` (`pRobSkill`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vID`);

--
-- Indexes for table `war`
--
ALTER TABLE `war`
  ADD PRIMARY KEY (`warID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `bID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faction`
--
ALTER TABLE `faction`
  MODIFY `Row` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `familys`
--
ALTER TABLE `familys`
  MODIFY `fID` int(60) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `ID` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `InvID` int(60) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parking`
--
ALTER TABLE `parking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specialbizzes`
--
ALTER TABLE `specialbizzes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokengold`
--
ALTER TABLE `tokengold`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `pID` int(60) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `vID` int(120) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `war`
--
ALTER TABLE `war`
  MODIFY `warID` int(255) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
