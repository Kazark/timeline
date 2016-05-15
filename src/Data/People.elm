module Data.People (people) where

import Date exposing (..)
import History exposing (..)


johnOwen =
  { from = duringYear 1616, to = on 1683 Aug 24, label = "John Owen" }


thomasGoodwin =
  { from = on 1600 Oct 5, to = on 1679 Feb 23, label = "Thomas Goodwin" }


williamPerkins =
  { from = duringYear 1558, to = duringYear 1602, label = "William Perkins" }


williamAmes =
  { from = duringYear 1576, to = on 1633 Nov 14, label = "William Ames" }


johnFlavel =
  { from = duringYear 1627, to = duringYear 1691, label = "John Flavel" }


samuelRutherford =
  { from = duringYear 1600, to = on 1661 Mar 29, label = "Samuel Rutherford" }


johnBunyan =
  { from = on 1628 Nov 30, to = on 1688 Aug 31, label = "John Bunyan" }


thomasBoston =
  { from = on 1676 Mar 17, to = on 1732 May 20, label = "Thomas Boston" }


thomasWatson =
  { from = duringYear 1620, to = duringYear 1686, label = "Thomas Watson" }


christopherLove =
  { from = duringYear 1618, to = on 1651 Aug 22, label = "Christopher Love" }


francisTurretin =
  { from = on 1623 Oct 17, to = on 1687 Sep 28, label = "Francis Turretin" }


hermannWitsius =
  { from = on 1636 Feb 12, to = on 1708 Oct 22, label = "Hermann Witsius" }


davidBrainerd =
  { from = on 1718 Apr 20, to = on 1747 Oct 9, label = "David Brainerd" }


georgeSwinnock =
  { from = duringYear 1627, to = duringYear 1673, label = "George Swinnock" }


richardSibbes =
  { from = duringYear 1577, to = duringYear 1635, label = "Richard Sibbes" }


johnCotton =
  { from = on 1585 Dec 4, to = on 1652 Dec 23, label = "John Cotton" }


richardMather =
  { from = duringYear 1596, to = on 1669 Apr 22, label = "Richard Mather" }


increaseMather =
  { from = on 1639 Jun 21, to = on 1723 Aug 23, label = "Increase Mather" }


cottonMather =
  { from = on 1663 Feb 12, to = on 1728 Feb 13, label = "Cotton Mather" }


stephenCharnock =
  { from = duringYear 1628, to = duringYear 1680, label = "Stephen Charnock" }


johnKnox =
  { from = duringYear 1513, to = on 1572 Nov 24, label = "John Knox" }


jamesRenwick =
  { from = on 1662 Feb 15, to = on 1688 Feb 17, label = "James Renwick" }


williamTyndale =
  { from = duringYear 1494, to = duringYear 1536, label = "William Tyndale" }


johnWycliffe =
  { from = duringYear 1320, to = on 1384 Dec 31, label = "John Wycliffe" }


janHus =
  { from = duringYear 1369, to = on 1415 Jul 6, label = "Jan Hus" }


martinLuther =
  { from = on 1483 Nov 10, to = on 1546 Feb 18, label = "Martin Luther" }


huldrychZwingli =
  { from = on 1484 Jan 1, to = on 1531 Oct 11, label = "Huldrych Zwingli" }


johnCalvin =
  { from = on 1509 Jul 10, to = on 1564 May 27, label = "John Calvin" }


theodoreBeza =
  { from = on 1519 Jun 24, to = on 1605 Oct 13, label = "Theodore Beza" }


philipMelanchthon =
  { from = on 1497 Feb 16, to = on 1560 Apr 19, label = "Philip Melanchthon" }


zachariasUrsinus =
  { from = on 1534 Jul 18, to = on 1583 May 6, label = "Zacharias Ursinus" }


wilhelmusABrakel =
  { from = on 1635 Jan 2, to = on 1711 Oct 30, label = "Wilhelmus a Brakel" }


peterWaldo =
  { from = duringYear 1140, to = duringYear 1205, label = "Peter Waldo" }


jonathanEdwards =
  { from = on 1703 Oct 5, to = on 1758 Mar 22, label = "Jonathan Edwards" }


johnBall =
  { from = duringMonth 1585 Oct, to = on 1640 Oct 20, label = "John Ball" }


jcRyle =
  { from = on 1816 May 10, to = on 1900 Jun 10, label = "JC Ryle" }


charlesHodge =
  { from = on 1797 Dec 27, to = on 1878 Jun 19, label = "Charles Hodge" }


hermanBavinck =
  { from = on 1854 Dec 13, to = on 1921 Jul 29, label = "Herman Bavinck" }


geerhardusVos =
  { from = on 1862 Mar 14, to = on 1949 Aug 13, label = "Geerhardus Vos" }


corneliusVanTil =
  { from = on 1895 May 3, to = on 1987 Apr 17, label = "Cornelius Van Til" }


johnMurray =
  { from = on 1898 Oct 14, to = on 1975 May 8, label = "John Murray" }


jGreshamMachen =
  { from = on 1881 Jul 28, to = on 1937 Jan 1, label = "J Gresham Machen" }


jeremiahBurroughs =
  { from = duringYear 1600, to = on 1646 Nov 13, label = "Jeremiah Burroughs" }


anselmOfCanterbury =
  { from = duringYear 1033, to = on 1109 Apr 21, label = "Anselm of Canterbury" }


thomasAquinas =
  { from = duringYear 1225, to = on 1274 Mar 7, label = "Thomas Aquinas" }


augustineOfHippo =
  { from = on 354 Nov 13, to = on 430 Aug 28, label = "Augustine of Hippo" }


aniciusBoethius =
  { from = duringYear 480, to = duringYear 524, label = "Anicius Boethius" }


athanasiusOfAlexandria =
  { from = duringYear 297, to = on 373 May 2, label = "Athanasius of Alexandria" }


johnChrysostom =
  { from = duringYear 349, to = duringYear 407, label = "John Chrysostom" }


jacobusArminius =
  { from = on 1560 Oct 10, to = on 1609 Oct 19, label = "Jacobus Arminius" }


gregoryNazianzus =
  { from = duringYear 329, to = on 390 Jan 25, label = "Gregory of Nazianzus" }


justinMartyr =
  { from = duringYear 100, to = duringYear 165, label = "Justin Martyr" }


johnBrownOfHaddington =
  { from = duringYear 1722, to = on 1787 Jun 19, label = "John Brown of Haddington" }


charlesSpurgeon =
  { from = on 1834 Jun 19, to = on 1892 Jan 31, label = "Charles Spurgeon" }


abrahamKuyper =
  { from = on 1837 Oct 29, to = on 1920 Nov 8, label = "Abraham Kuyper" }


gwfHegel =
  { from = on 1770 Aug 27, to = on 1831 Nov 14, label = "GWF Hegel" }


immanuelKant =
  { from = on 1724 Apr 22, to = on 1804 Feb 12, label = "Immanuel Kant" }


karlBarth =
  { from = on 1886 May 10, to = on 1968 Dec 10, label = "Karl Barth" }


sorenKierkegaard =
  { from = on 1813 May 5, to = on 1855 Nov 11, label = "Soren Kierkegaard" }


thomasReid =
  { from = on 1710 Apr 26, to = on 1796 Oct 7, label = "Thomas Reid" }


adolfVonHarnack =
  { from = on 1851 May 7, to = on 1930 Jun 10, label = "Adolf von Harnack" }


friedrichSchleiermacher =
  { from = on 1768 Nov 21, to = on 1834 Feb 12, label = "Friedrich Schleiermacher" }


meredithKline =
  { from = on 1922 Dec 15, to = on 2007 Apr 14, label = "Meredith Kline" }


francisSchaeffer =
  { from = on 1912 Jan 30, to = on 1984 May 15, label = "Francis Schaeffer" }


martinBucer =
  { from = on 1491 Nov 11, to = on 1551 Feb 28, label = "Martin Bucer" }


csLewis =
  { from = on 1898 Nov 29, to = on 1963 Nov 22, label = "CS Lewis" }


peterLombard =
  { from = duringYear 1096, to = duringMonth 1160 Jul, label = "Peter Lombard" }


peterAbelard =
  { from = duringYear 1079, to = on 1142 Apr 21, label = "Peter Abelard" }


robertHaldane =
  { from = on 1764 Feb 28, to = on 1842 Dec 12, label = "Robert Haldane" }


williamOfOckham =
  { from = duringYear 1287, to = duringYear 1347, label = "William of Ockham" }


bonaventure =
  { from = duringYear 1221, to = on 1274 Jul 15, label = "Bonaventure" }


dunsScotus =
  { from = duringYear 1266, to = on 1308 Nov 8, label = "John Duns Scotus" }


matthewHenry =
  { from = on 1662 Oct 18, to = on 1714 Jun 22, label = "Matthew Henry" }


johnGill =
  { from = on 1697 Nov 23, to = on 1771 Oct 14, label = "John Gill" }


richardBaxter =
  { from = on 1615 Nov 12, to = on 1691 Dec 8, label = "Richard Baxter" }


archibaldAlexander =
  { from = on 1772 Apr 17, to = on 1851 Oct 22, label = "Archibald Alexander" }


bbWarfield =
  { from = on 1851 Nov 5, to = on 1921 Feb 16, label = "BB Warfield" }


aaHodge =
  { from = on 1823 Jul 18, to = on 1886 Nov 12, label = "AA Hodge" }


dMartynLloydJones =
  { from = on 1899 Dec 20, to = on 1981 Mar 1, label = "D. Martyn Lloyd-Jones" }


williamGurnell =
  { from = duringYear 1616, to = on 1679 Oct 12, label = "William Gurnall" }


robertMCheyne =
  { from = on 1813 May 21, to = on 1843 Mar 25, label = "Robert Murray M'Cheyne" }


karlRahner =
  { from = on 1904 Mar 5, to = on 1984 Mar 30, label = "Karl Rahner" }


jacopoSadoleto =
  { from = on 1477 Jul 12, to = on 1547 Oct 18, label = "Jacopo Sadoleto" }


desideriusErasmus =
  { from = on 1466 Oct 28, to = on 1536 Jul 12, label = "Desiderius Erasmus" }


danteAlighieri =
  { from = duringYear 1265, to = duringYear 1321, label = "Dante Alighieri" }


johnMilton =
  { from = on 1608 Dec 9, to = on 1674 Nov 8, label = "John Milton" }


walterMarshall =
  { from = on 1628 Jun 15, to = duringMonth 1680 Aug, label = "Walter Marshall" }


georgeWhitefield =
  { from = on 1714 Dec 27, to = on 1770 Sep 30, label = "George Whitefield" }


henryErskine =
  { from = duringYear 1624, to = duringYear 1696, label = "Henry Erskine" }


ralphErskine =
  { from = on 1685 Mar 18, to = on 1752 Nov 6, label = "Ralph Erskine" }


ebenezerErskine =
  { from = on 1680 Jun 22, to = on 1754 Jun 2, label = "Ebenezer Erskine" }


gisbertusVoetius =
  { from = on 1589 Mar 3, to = on 1676 Nov 1, label = "Gisbertus Voetius" }


hugoGrotius =
  { from = on 1583 Apr 10, to = on 1645 Aug 28, label = "Hugo Grotius" }


girolamoZanchi =
  { from = on 1516 Feb 2, to = on 1590 Nov 19, label = "Girolamo Zanchi" }


robertBellarmine =
  { from = on 1542 Oct 4, to = on 1621 Sep 17, label = "Robert Bellarmine" }


williamCarey =
  { from = on 1761 Aug 17, to = on 1834 Jun 9, label = "William Carey" }


hudsonTaylor =
  { from = on 1832 May 21, to = on 1905 Jun 3, label = "James Hudson Taylor" }


peterMartyrVermigli =
  { from = on 1499 Sep 8, to = on 1562 Nov 12, label = "Peter Martyr Vermigli" }


ericLiddell =
  { from = on 1902 Jan 16, to = on 1945 Feb 21, label = "Eric Liddell" }


johnEliot =
  { from = duringYear 1604, to = on 1690 May 21, label = "John Eliot" }


faustoSozzini =
  { from = on 1539 Dec 5, to = on 1604 Mar 4, label = "Fausto Sozzini" }


williamPlumer =
  { from = on 1802 Jul 26, to = on 1880 Oct 22, label = "William Plumer" }


tremperLongman =
  { from = on 1952 Sep 8, to = current, label = "Tremper Longman III" }


joelBeeke =
  { from = duringYear 1952, to = current, label = "Joel Beeke" }


ejYoung =
  { from = on 1907 Nov 29, to = on 1968 Feb 14, label = "Edward J. Young" }


bernardOfClairvaux =
  { from = duringYear 1090, to = on 1153 Aug 20, label = "Bernard of Clairvaux" }


thomasAKempis =
  { from = duringYear 1380, to = on 1471 Jul 25, label = "Thomas a Kempis" }


johnWitherspoon =
  { from = on 1723 Feb 5, to = on 1794 Nov 15, label = "John Witherspoon" }


juliusWellhausen =
  { from = on 1844 May 17, to = on 1918 Jan 7, label = "Julius Wellhausen" }


davidHume =
  { from = on 1711 May 7, to = on 1776 Aug 25, label = "David Hume" }


williamFarel =
  { from = duringYear 1489, to = on 1565 Sep 13, label = "William Farel" }


jerome =
  { from = duringYear 347, to = on 420 Sep 30, label = "Jerome" }


basilOfCaesarea =
  { from = duringYear 320, to = duringMonth 379 Jan, label = "Basil of Caesarea" }


gregoryOfNyssa =
  { from = duringYear 335, to = duringYear 395, label = "Gregory of Nyssa" }


bruceWaltke =
  { from = on 1930 Aug 30, to = current, label = "Bruce Waltke" }


ignatiusOfAntioch =
  { from = duringYear 35, to = duringYear 108, label = "Ignatius of Antioch" }


polycarp =
  { from = duringYear 69, to = duringYear 155, label = "Polycarp" }


eusebius =
  { from = duringYear 260, to = duringYear 339, label = "Eusebius" }


johnTheApostle =
  { from = duringYear 6, to = duringYear 100, label = "John the Apostle" }


heinrichBullinger =
  { from = on 1504 Jul 18, to = on 1575 Sep 17, label = "Heinrich Bullinger" }


tertullian =
  { from = duringYear 155, to = duringYear 240, label = "Tertullian" }


arius =
  { from = duringYear 250, to = duringYear 336, label = "Arius" }


pelagius =
  { from = duringYear 360, to = duringYear 418, label = "Pelagius" }


mani =
  { from = duringYear 216, to = duringYear 274, label = "Mani" }


obadiahSedgwick =
  { from = duringYear 1600, to = duringYear 1658, label = "Obadiah Sedgwick" }


richardCameron =
  { from = duringYear 1648, to = on 1680 Jul 22, label = "Richard Cameron" }


johnCameron =
  { from = duringYear 1579, to = duringYear 1625, label = "John Cameron" }


mosesAmyraut =
  { from = duringMonth 1596 Sep, to = on 1664 Jan 8, label = "Moses Amyraut" }


davidPareus =
  { from = on 1548 Dec 30, to = on 1622 Jun 15, label = "David Pareus" }


johannesCocceius =
  { from = on 1603 Aug 9, to = on 1669 Nov 4, label = "Johannes Cocceius" }


thomasChalmers =
  { from = duringYear 1780, to = duringYear 1847, label = "Thomas Chalmers" }


johnHowe =
  { from = duringYear 1630, to = duringYear 1705, label = "John Howe" }


jiPacker =
  { from = duringYear 1926, to = current, label = "J.I. Packer" }


jgVos =
  { from = duringYear 1903, to = duringYear 1983, label = "J.G. Vos" }


johnGerstner =
  { from = on 1914 Nov 22, to = on 1996 Mar 24, label = "John Gerstner" }


rcSproul =
  { from = on 1939 Feb 13, to = current, label = "R.C. Sproul" }


johannesMaccovius =
  { from = duringYear 1588, to = duringYear 1644, label = "Johannes Maccovius" }


jamesUssher =
  { from = duringYear 1581, to = duringYear 1656, label = "James Ussher" }


matthewBarker =
  { from = duringYear 1619, to = duringYear 1698, label = "Matthew Barker" }


richardVines =
  { from = duringYear 1600, to = duringYear 1655, label = "Richard Vines" }


johnCaryl =
  { from = duringYear 1602, to = duringYear 1673, label = "Joseph Caryl" }


paulBaynes =
  { from = duringYear 1573, to = duringYear 1617, label = "Paul Baynes" }


francisRoberts =
  { from = duringYear 1609, to = duringYear 1675, label = "Francis Roberts" }


georgeGillespie =
  { from = duringYear 1613, to = duringYear 1648, label = "George Gillespie" }


patrickGillespie =
  { from = duringYear 1617, to = duringYear 1675, label = "Patrick Gillespie" }


thomasAdams =
  { from = duringYear 1583, to = duringYear 1652, label = "Thomas Adams" }


isaacAmbrose =
  { from = duringYear 1604, to = duringYear 1664, label = "Isaac Ambrose" }


edwardLeigh =
  { from = duringYear 1603, to = duringYear 1671, label = "Edward Leigh" }


jamesDurham =
  { from = duringYear 1622, to = duringYear 1658, label = "James Durham" }


franciscoSuarez =
  { from = on 1548 Jan 5, to = on 1617 Sep 25, label = "Francisco Suarez" }


leonardusLessius =
  { from = on 1554 Oct 1, to = on 1623 Jan 15, label = "Leonardus Lessius" }


peterRamus =
  { from = duringYear 1515, to = on 1572 Aug 26, label = "Peter Ramus" }


constantineI =
  { from = on 272 Feb 27, to = on 337 May 22, label = "Constantine I" }


people : List TimeSpan
people =
  [ johnOwen
  , thomasChalmers
  , johnHowe
  , jiPacker
  , jgVos
  , johnGerstner
  , rcSproul
  , jamesUssher
  , matthewBarker
  , richardVines
  , johnCaryl
  , paulBaynes
  , francisRoberts
  , georgeGillespie
  , patrickGillespie
  , thomasAdams
  , isaacAmbrose
  , edwardLeigh
  , jamesDurham
  , obadiahSedgwick
  , johnCameron
  , richardCameron
  , peterRamus
  , mosesAmyraut
  , johannesMaccovius
  , davidPareus
  , johannesCocceius
  , bruceWaltke
  , ejYoung
  , thomasAKempis
  , franciscoSuarez
  , leonardusLessius
  , bernardOfClairvaux
  , georgeWhitefield
  , henryErskine
  , ralphErskine
  , ebenezerErskine
  , matthewHenry
  , johnGill
  , richardBaxter
  , thomasGoodwin
  , williamPerkins
  , williamAmes
  , johnFlavel
  , samuelRutherford
  , johnBunyan
  , johnWitherspoon
  , juliusWellhausen
  , davidHume
  , williamFarel
  , constantineI
  , jerome
  , ignatiusOfAntioch
  , polycarp
  , tertullian
  , arius
  , pelagius
  , mani
  , eusebius
  , johnTheApostle
  , heinrichBullinger
  , basilOfCaesarea
  , gregoryOfNyssa
  , thomasBoston
  , thomasWatson
  , walterMarshall
  , christopherLove
  , francisTurretin
  , gisbertusVoetius
  , hugoGrotius
  , girolamoZanchi
  , robertBellarmine
  , williamCarey
  , hudsonTaylor
  , peterMartyrVermigli
  , ericLiddell
  , williamPlumer
  , johnEliot
  , faustoSozzini
  , hermannWitsius
  , davidBrainerd
  , georgeSwinnock
  , richardMather
  , increaseMather
  , cottonMather
  , richardSibbes
  , johnCotton
  , stephenCharnock
  , johnKnox
  , jamesRenwick
  , williamGurnell
  , robertMCheyne
  , williamTyndale
  , joelBeeke
  , tremperLongman
  , karlRahner
  , jacopoSadoleto
  , desideriusErasmus
  , danteAlighieri
  , johnMilton
  , johnWycliffe
  , janHus
  , archibaldAlexander
  , bbWarfield
  , aaHodge
  , dMartynLloydJones
  , csLewis
  , peterLombard
  , peterAbelard
  , robertHaldane
  , williamOfOckham
  , bonaventure
  , dunsScotus
  , martinLuther
  , huldrychZwingli
  , johnCalvin
  , theodoreBeza
  , philipMelanchthon
  , zachariasUrsinus
  , wilhelmusABrakel
  , peterWaldo
  , jonathanEdwards
  , johnBall
  , jcRyle
  , charlesHodge
  , hermanBavinck
  , geerhardusVos
  , corneliusVanTil
  , johnMurray
  , jGreshamMachen
  , jeremiahBurroughs
  , anselmOfCanterbury
  , thomasAquinas
  , augustineOfHippo
  , aniciusBoethius
  , athanasiusOfAlexandria
  , charlesSpurgeon
  , abrahamKuyper
  , gwfHegel
  , immanuelKant
  , karlBarth
  , sorenKierkegaard
  , thomasReid
  , johnChrysostom
  , jacobusArminius
  , gregoryNazianzus
  , justinMartyr
  , johnBrownOfHaddington
  , adolfVonHarnack
  , friedrichSchleiermacher
  , meredithKline
  , francisSchaeffer
  , martinBucer
  , { from = duringYear 1569, to = duringYear 1614, label = "Robert Parker" }
  , { from = on 1576 Jun 6, to = on 1649 Oct 3, label = "Giovanni Deodati" }
  ]
