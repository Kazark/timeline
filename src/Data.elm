module Data (timeline) where

import Date exposing (..)
import History exposing (..)
import Clock exposing (currentDate)


current =
  currentDate () |> fromDate


johnOwen =
  { from = duringYear 1616, to = on 1683 Aug 24, label = "John Owen" }


goodwinBorn =
  on 1600 Oct 5


goodwinDied =
  on 1679 Feb 23


thomasGoodwin =
  { from = goodwinBorn, to = goodwinDied, label = "Thomas Goodwin" }


perkinsBorn =
  duringYear 1558


perkinsDied =
  duringYear 1602


williamPerkins =
  { from = perkinsBorn, to = perkinsDied, label = "William Perkins" }


amesBorn =
  duringYear 1576


amesDied =
  on 1633 Nov 14


williamAmes =
  { from = amesBorn, to = amesDied, label = "William Ames" }


flavelBorn =
  duringYear 1627


flavelDied =
  duringYear 1691


johnFlavel =
  { from = flavelBorn, to = flavelDied, label = "John Flavel" }


rutherfordBorn =
  duringYear 1600


rutherfordDied =
  on 1661 Mar 29


samuelRutherford =
  { from = rutherfordBorn, to = rutherfordDied, label = "Samuel Rutherford" }


bunyanBorn =
  on 1628 Nov 30


bunyanDied =
  on 1688 Aug 31


johnBunyan =
  { from = bunyanBorn, to = bunyanDied, label = "John Bunyan" }


bostonBorn =
  on 1676 Mar 17


bostonDied =
  on 1732 May 20


thomasBoston =
  { from = bostonBorn, to = bostonDied, label = "Thomas Boston" }


watsonBorn =
  duringYear 1620


watsonDied =
  duringYear 1686


thomasWatson =
  { from = watsonBorn, to = watsonDied, label = "Thomas Watson" }


loveBorn =
  duringYear 1618


loveDied =
  on 1651 Aug 22


christopherLove =
  { from = loveBorn, to = loveDied, label = "Christopher Love" }


turretinBorn =
  on 1623 Oct 17


turretinDied =
  on 1687 Sep 28


francisTurretin =
  { from = turretinBorn, to = turretinDied, label = "Francis Turretin" }


witsiusBorn =
  on 1636 Feb 12


witsiusDied =
  on 1708 Oct 22


hermannWitsius =
  { from = witsiusBorn, to = witsiusDied, label = "Hermann Witsius" }


brainerdBorn =
  on 1718 Apr 20


brainerdDied =
  on 1747 Oct 9


davidBrainerd =
  { from = brainerdBorn, to = brainerdDied, label = "David Brainerd" }


swinnockBorn =
  duringYear 1627


swinnockDied =
  duringYear 1673


georgeSwinnock =
  { from = swinnockBorn, to = swinnockDied, label = "George Swinnock" }


sibbesBorn =
  duringYear 1577


sibbesDied =
  duringYear 1635


richardSibbes =
  { from = sibbesBorn, to = sibbesDied, label = "Richard Sibbes" }


cottonBorn =
  on 1585 Dec 4


cottonDied =
  on 1652 Dec 23


johnCotton =
  { from = cottonBorn, to = cottonDied, label = "John Cotton" }


rmatherBorn =
  duringYear 1596


rmatherDied =
  on 1669 Apr 22


richardMather =
  { from = rmatherBorn, to = rmatherDied, label = "Richard Mather" }


imatherBorn =
  on 1639 Jun 21


imatherDied =
  on 1723 Aug 23


increaseMather =
  { from = imatherBorn, to = imatherDied, label = "Increase Mather" }


cmatherBorn =
  on 1663 Feb 12


cmatherDied =
  on 1728 Feb 13


cottonMather =
  { from = cmatherBorn, to = cmatherDied, label = "Cotton Mather" }


charnockBorn =
  duringYear 1628


charnockDied =
  duringYear 1680


stephenCharnock =
  { from = charnockBorn, to = charnockDied, label = "Stephen Charnock" }


knoxBorn =
  duringYear 1513


knoxDied =
  on 1572 Nov 24


johnKnox =
  { from = knoxBorn, to = knoxDied, label = "John Knox" }


renwickBorn =
  on 1662 Feb 15


renwickDied =
  on 1688 Feb 17


jamesRenwick =
  { from = renwickBorn, to = renwickDied, label = "James Renwick" }


tyndaleBorn =
  duringYear 1494


tyndaleDied =
  duringYear 1536


williamTyndale =
  { from = tyndaleBorn, to = tyndaleDied, label = "William Tyndale" }


wycliffeBorn =
  duringYear 1320


wycliffeDied =
  on 1384 Dec 31


johnWycliffe =
  { from = wycliffeBorn, to = wycliffeDied, label = "John Wycliffe" }


husBorn =
  duringYear 1369


husDied =
  on 1415 Jul 6


janHus =
  { from = husBorn, to = husDied, label = "Jan Hus" }


lutherBorn =
  on 1483 Nov 10


lutherDied =
  on 1546 Feb 18


martinLuther =
  { from = lutherBorn, to = lutherDied, label = "Martin Luther" }


zwingliBorn =
  on 1484 Jan 1


zwingliDied =
  on 1531 Oct 11


huldrychZwingli =
  { from = zwingliBorn, to = zwingliDied, label = "Huldrych Zwingli" }


calvinBorn =
  on 1509 Jul 10


calvinDied =
  on 1564 May 27


johnCalvin =
  { from = calvinBorn, to = calvinDied, label = "John Calvin" }


bezaBorn =
  on 1519 Jun 24


bezaDied =
  on 1605 Oct 13


theodoreBeza =
  { from = bezaBorn, to = bezaDied, label = "Theodore Beza" }


melanchthonBorn =
  on 1497 Feb 16


melanchthonDied =
  on 1560 Apr 19


philipMelanchthon =
  { from = melanchthonBorn, to = melanchthonDied, label = "Philip Melanchthon" }


ursinusBorn =
  on 1534 Jul 18


ursinusDied =
  on 1583 May 6


zachariasUrsinus =
  { from = ursinusBorn, to = ursinusDied, label = "Zacharias Ursinus" }


abrakelBorn =
  on 1635 Jan 2


abrakelDied =
  on 1711 Oct 30


wilhelmusABrakel =
  { from = abrakelBorn, to = abrakelDied, label = "Wilhelmus a Brakel" }


waldoBorn =
  duringYear 1140


waldoDied =
  duringYear 1205


peterWaldo =
  { from = waldoBorn, to = waldoDied, label = "Peter Waldo" }


edwardsBorn =
  on 1703 Oct 5


edwardsDied =
  on 1758 Mar 22


jonathanEdwards =
  { from = edwardsBorn, to = edwardsDied, label = "Jonathan Edwards" }


ballBorn =
  duringMonth 1585 Oct


ballDied =
  on 1640 Oct 20


johnBall =
  { from = ballBorn, to = ballDied, label = "John Ball" }


ryleBorn =
  on 1816 May 10


ryleDied =
  on 1900 Jun 10


jcRyle =
  { from = ryleBorn, to = ryleDied, label = "JC Ryle" }


chodgeBorn =
  on 1797 Dec 27


chodgeDied =
  on 1878 Jun 19


charlesHodge =
  { from = chodgeBorn, to = chodgeDied, label = "Charles Hodge" }


bavinckBorn =
  on 1854 Dec 13


bavinckDied =
  on 1921 Jul 29


hermanBavinck =
  { from = bavinckBorn, to = bavinckDied, label = "Herman Bavinck" }


gvosBorn =
  on 1862 Mar 14


gvosDied =
  on 1949 Aug 13


geerhardusVos =
  { from = gvosBorn, to = gvosDied, label = "Geerhardus Vos" }


vantilBorn =
  on 1895 May 3


vantilDied =
  on 1987 Apr 17


corneliusVanTil =
  { from = vantilBorn, to = vantilDied, label = "Cornelius Van Til" }


murrayBorn =
  on 1898 Oct 14


murrayDied =
  on 1975 May 8


johnMurray =
  { from = murrayBorn, to = murrayDied, label = "John Murray" }


machenBorn =
  on 1881 Jul 28


machenDied =
  on 1937 Jan 1


jGreshamMachen =
  { from = machenBorn, to = machenDied, label = "J Gresham Machen" }


burroughsBorn =
  duringYear 1600


burroughsDied =
  on 1646 Nov 13


jeremiahBurroughs =
  { from = burroughsBorn, to = burroughsDied, label = "Jeremiah Burroughs" }


anselmBorn =
  duringYear 1033


anselmDied =
  on 1109 Apr 21


anselmOfCanterbury =
  { from = anselmBorn, to = anselmDied, label = "Anselm of Canterbury" }


acquinasBorn =
  duringYear 1225


acquinasDied =
  on 1274 Mar 7


thomasAcquinas =
  { from = acquinasBorn, to = acquinasDied, label = "Thomas Acquinas" }


augustineBorn =
  on 354 Nov 13


augustineDied =
  on 430 Aug 28


augustineOfHippo =
  { from = augustineBorn, to = augustineDied, label = "Augustine of Hippo" }


boethiusBorn =
  duringYear 480


boethiusDied =
  duringYear 524


aniciusBoethius =
  { from = boethiusBorn, to = boethiusDied, label = "Anicius Boethius" }


athanasiusBorn =
  duringYear 297


athanasiusDied =
  on 373 May 2


athanasiusOfAlexandria =
  { from = athanasiusBorn, to = athanasiusDied, label = "Athanasius of Alexandria" }


chrysostomBorn =
  duringYear 349


chrysostomDied =
  duringYear 407


johnChrysostom =
  { from = chrysostomBorn, to = chrysostomDied, label = "John Chrysostom" }


arminiusBorn =
  on 1560 Oct 10


arminiusDied =
  on 1609 Oct 19


jacobusArminius =
  { from = arminiusBorn, to = arminiusDied, label = "Jacobus Arminius" }


nazianzusBorn =
  duringYear 329


nazianzusDied =
  on 390 Jan 25


gregoryNazianzus =
  { from = nazianzusBorn, to = nazianzusDied, label = "Gregory of Nazianzus" }


martyrBorn =
  duringYear 100


martyrDied =
  duringYear 165


justinMartyr =
  { from = martyrBorn, to = martyrDied, label = "Justin Martyr" }


brownHBorn =
  duringYear 1722


brownHDied =
  on 1787 Jun 19


johnBrownOfHaddington =
  { from = brownHBorn, to = brownHDied, label = "John Brown of Haddington" }


spurgeonBorn =
  on 1834 Jun 19


spurgeonDied =
  on 1892 Jan 31


charlesSpurgeon =
  { from = spurgeonBorn, to = spurgeonDied, label = "Charles Spurgeon" }


kuyperBorn =
  on 1837 Oct 29


kuyperDied =
  on 1920 Nov 8


abrahamKuyper =
  { from = kuyperBorn, to = kuyperDied, label = "Abraham Kuyper" }


hegelBorn =
  on 1770 Aug 27


hegelDied =
  on 1831 Nov 14


gwfHegel =
  { from = hegelBorn, to = hegelDied, label = "GWF Hegel" }


kantBorn =
  on 1724 Apr 22


kantDied =
  on 1804 Feb 12


immanuelKant =
  { from = kantBorn, to = kantDied, label = "Immanuel Kant" }


barthBorn =
  on 1886 May 10


barthDied =
  on 1968 Dec 10


karlBarth =
  { from = barthBorn, to = barthDied, label = "Karl Barth" }


kierkegaardBorn =
  on 1813 May 5


kierkegaardDied =
  on 1855 Nov 11


sorenKierkegaard =
  { from = kierkegaardBorn, to = kierkegaardDied, label = "Soren Kierkegaard" }


reidBorn =
  on 1710 Apr 26


reidDied =
  on 1796 Oct 7


thomasReid =
  { from = reidBorn, to = reidDied, label = "Thomas Reid" }


harnackBorn =
  on 1851 May 7


harnackDied =
  on 1930 Jun 10


adolfVonHarnack =
  { from = harnackBorn, to = harnackDied, label = "Adolf von Harnack" }


schleiermacherBorn =
  on 1768 Nov 21


schleiermacherDied =
  on 1834 Feb 12


friedrichSchleiermacher =
  { from = schleiermacherBorn, to = schleiermacherDied, label = "Friedrich Schleiermacher" }


klineBorn =
  on 1922 Dec 15


klineDied =
  on 2007 Apr 14


meredithKline =
  { from = klineBorn, to = klineDied, label = "Meredith Kline" }


schaefferBorn =
  on 1912 Jan 30


schaefferDied =
  on 1984 May 15


francisSchaeffer =
  { from = schaefferBorn, to = schaefferDied, label = "Francis Schaeffer" }


bucerBorn =
  on 1491 Nov 11


bucerDied =
  on 1551 Feb 28


martinBucer =
  { from = bucerBorn, to = bucerDied, label = "Martin Bucer" }


lewisBorn =
  on 1898 Nov 29


lewisDied =
  on 1963 Nov 22


csLewis =
  { from = lewisBorn, to = lewisDied, label = "CS Lewis" }


lombardBorn =
  duringYear 1096


lombardDied =
  duringMonth 1160 Jul


peterLombard =
  { from = lombardBorn, to = lombardDied, label = "Peter Lombard" }


abelardBorn =
  duringYear 1079


abelardDied =
  on 1142 Apr 21


peterAbelard =
  { from = abelardBorn, to = abelardDied, label = "Peter Abelard" }


haldaneBorn =
  on 1764 Feb 28


haldaneDied =
  on 1842 Dec 12


robertHaldane =
  { from = haldaneBorn, to = haldaneDied, label = "Robert Haldane" }


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


timeline : Timeline
timeline =
  { timeSpans =
      [ johnOwen
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
      , thomasAcquinas
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
      ]
  , events = []
  }
