module Data.People (people) where

import Date exposing (..)
import History exposing (..)


people : List TimeSpan
people =
  [ { from = duringYear  6          , to = duringYear  100        , label = "John the Apostle" }
  , { from = duringYear  35         , to = duringYear  108        , label = "Ignatius of Antioch" }
  , { from = duringYear  69         , to = duringYear  155        , label = "Polycarp" }
  , { from = duringYear  100        , to = duringYear  165        , label = "Justin Martyr" }
  , { from = duringYear  155        , to = duringYear  240        , label = "Tertullian" }
  , { from = duringYear  184        , to = duringYear  153        , label = "Origen" }
  , { from = duringYear  216        , to = duringYear  274        , label = "Mani" }
  , { from = duringYear  250        , to = duringYear  336        , label = "Arius" }
  , { from = duringYear  260        , to = duringYear  339        , label = "Eusebius" }
  , { from = on          272 Feb 27 , to = on          337 May 22 , label = "Constantine I" }
  , { from = duringYear  297        , to = on          373 May 2  , label = "Athanasius of Alexandria" }
  , { from = duringYear  310        , to = duringYear  367        , label = "Hilary of Poitiers" }
  -- Years on Didymus the Blind from footnote in Owen Vol 3 (Banner of Truth edition, page 28).
  -- Wikipedia has 313 - 398.
  , { from = duringYear  311        , to = duringYear  396        , label = "Didymus the Blind" }
  , { from = duringYear  320        , to = duringMonth 379 Jan    , label = "Basil of Caesarea" }
  , { from = duringYear  329        , to = on          390 Jan 25 , label = "Gregory of Nazianzus" }
  , { from = duringYear  335        , to = duringYear  395        , label = "Gregory of Nyssa" }
  , { from = duringYear  340        , to = on          397 Apr 4  , label = "Aurelius Ambrosius" }
  , { from = duringYear  347        , to = on          420 Sep 30 , label = "Jerome" }
  , { from = duringYear  349        , to = duringYear  407        , label = "John Chrysostom" }
  , { from = on          354 Nov 13 , to = on          430 Aug 28 , label = "Augustine of Hippo" }
  , { from = duringYear  360        , to = duringYear  418        , label = "Pelagius" }
  , { from = duringYear  390        , to = duringYear  455        , label = "Prosper of Aquitaine" }
  -- Date of death for Fulgentius given as 527 or 533. I averaged it to 530.
  , { from = duringYear  462        , to = on          530 Jan 1  , label = "Fulgentius of Ruspe" }
  , { from = duringYear  480        , to = duringYear  524        , label = "Anicius Boethius" }
  , { from = duringYear  540        , to = on          604 Mar 12 , label = "Gregory the Great" }
  , { from = duringYear  1033       , to = on          1109 Apr 21, label = "Anselm of Canterbury" }
  , { from = duringYear  1079       , to = on          1142 Apr 21, label = "Peter Abelard" }
  , { from = duringYear  1090       , to = on          1153 Aug 20, label = "Bernard of Clairvaux" }
  , { from = duringYear  1096       , to = duringMonth 1160 Jul   , label = "Peter Lombard" }
  , { from = duringYear  1140       , to = duringYear  1205       , label = "Peter Waldo" }
  , { from = duringYear  1193       , to = duringYear  1280       , label = "Albertus Magnus" }
  , { from = duringYear  1221       , to = on          1274 Jul 15, label = "Bonaventure" }
  , { from = duringYear  1225       , to = on          1274 Mar 7 , label = "Thomas Aquinas" }
  , { from = duringYear  1265       , to = duringYear  1321       , label = "Dante Alighieri" }
  , { from = duringYear  1266       , to = on          1308 Nov 8 , label = "John Duns Scotus" }
  , { from = duringYear  1287       , to = duringYear  1347       , label = "William of Ockham" }
  , { from = duringYear  1290       , to = on          1349 Aug 26, label = "Thomas Bradwardine" }
  , { from = duringYear  1320       , to = on          1384 Dec 31, label = "John Wycliffe" }
  , { from = duringMonth 1340 Oct   , to = on          1384 Aug 20, label = "Gerard Groote" }
  , { from = duringYear  1369       , to = on          1415 Jul 6 , label = "Jan Hus" }
  , { from = duringYear  1380       , to = on          1471 Jul 25, label = "Thomas a Kempis" }
  , { from = duringYear  1398       , to = on          1468 Feb 3 , label = "Johannes Gutenberg" }
  , { from = on          1466 Oct 28, to = on          1536 Jul 12, label = "Desiderius Erasmus" }
  , { from = on          1477 Jul 12, to = on          1547 Oct 18, label = "Jacopo Sadoleto" }
  , { from = on          1483 Nov 10, to = on          1546 Feb 18, label = "Martin Luther" }
  , { from = on          1484 Jan 1 , to = on          1531 Oct 11, label = "Huldrych Zwingli" }
  , { from = duringYear  1489       , to = on          1565 Sep 13, label = "William Farel" }
  , { from = on          1491 Nov 11, to = on          1551 Feb 28, label = "Martin Bucer" }
  , { from = duringYear  1494       , to = duringYear  1536       , label = "William Tyndale" }
  , { from = on          1497 Feb 16, to = on          1560 Apr 19, label = "Philip Melanchthon" }
  , { from = on          1499 Sep 8 , to = on          1562 Nov 12, label = "Peter Martyr Vermigli" }
  , { from = on          1504 Jul 18, to = on          1575 Sep 17, label = "Heinrich Bullinger" }
  , { from = duringYear  1513       , to = on          1589 Sep 16, label = "Michael Baius" }
  , { from = on          1509 Jul 10, to = on          1564 May 27, label = "John Calvin" }
  , { from = duringYear  1513       , to = on          1572 Nov 24, label = "John Knox" }
  , { from = duringYear  1515       , to = on          1572 Aug 26, label = "Peter Ramus" }
  , { from = on          1516 Feb 2 , to = on          1590 Nov 19, label = "Girolamo Zanchi" }
  , { from = on          1519 Jun 24, to = on          1605 Oct 13, label = "Theodore Beza" }
  , { from = on          1534 Jul 18, to = on          1583 May 6 , label = "Zacharias Ursinus" }
  , { from = on          1539 Dec 5 , to = on          1604 Mar 4 , label = "Fausto Sozzini" }
  , { from = on          1542 Oct 4 , to = on          1621 Sep 17, label = "Robert Bellarmine" }
  , { from = on          1548 Jan 5 , to = on          1617 Sep 25, label = "Francisco Suarez" }
  , { from = on          1548 Dec 30, to = on          1622 Jun 15, label = "David Pareus" }
  , { from = on          1554 Oct 1 , to = on          1623 Jan 15, label = "Leonardus Lessius" }
  , { from = duringYear  1558       , to = duringYear  1602       , label = "William Perkins" }
  , { from = on          1560 Oct 10, to = on          1609 Oct 19, label = "Jacobus Arminius" }
  , { from = on          1563 Jan 30, to = on          1641 Jan 11, label = "Franciscus Gomarus" }
  , { from = duringYear  1569       , to = duringYear  1614       , label = "Robert Parker" }
  , { from = on          1569 Jul 19, to = on          1622 Sep 29, label = "Conrad Vorstius" }
  , { from = duringYear  1573       , to = duringYear  1617       , label = "Paul Baynes" }
  , { from = duringYear  1576       , to = on          1633 Nov 14, label = "William Ames" }
  , { from = on          1576 Jun 6 , to = on          1649 Oct 3 , label = "Giovanni Deodati" }
  , { from = duringYear  1577       , to = duringYear  1635       , label = "Richard Sibbes" }
  , { from = duringYear  1579       , to = duringYear  1625       , label = "John Cameron" }
  , { from = on          1579 Jan 4 , to = on          1629 Apr 8 , label = "Willem Teellinck" }
  , { from = duringYear  1581       , to = duringYear  1656       , label = "James Ussher" }
  , { from = on          1583 Apr 10, to = on          1645 Aug 28, label = "Hugo Grotius" }
  , { from = duringYear  1583       , to = duringYear  1652       , label = "Thomas Adams" }
  , { from = duringMonth 1585 Oct   , to = on          1640 Oct 20, label = "John Ball" }
  , { from = on          1585 Oct 28, to = on          1638 May 6 , label = "Cornelius Jansen" }
  , { from = on          1585 Dec 4 , to = on          1652 Dec 23, label = "John Cotton" }
  , { from = duringYear  1588       , to = duringYear  1644       , label = "Johannes Maccovius" }
  , { from = on          1589 Mar 3 , to = on          1676 Nov 1 , label = "Gisbertus Voetius" }
  , { from = on          1596 Mar 31, to = on          1650 Feb 11, label = "Rene Descartes" }
  , { from = duringYear  1596       , to = on          1669 Apr 22, label = "Richard Mather" }
  , { from = duringMonth 1596 Sep   , to = on          1664 Jan 8 , label = "Moses Amyraut" }
  , { from = duringYear  1600       , to = on          1646 Nov 13, label = "Jeremiah Burroughs" }
  , { from = duringYear  1600       , to = duringYear  1655       , label = "Richard Vines" }
  , { from = duringYear  1600       , to = duringYear  1658       , label = "Obadiah Sedgwick" }
  , { from = duringYear  1600       , to = on          1661 Mar 29, label = "Samuel Rutherford" }
  , { from = on          1600 Oct 5 , to = on          1679 Feb 23, label = "Thomas Goodwin" }
  , { from = duringYear  1602       , to = duringYear  1673       , label = "Joseph Caryl" }
  , { from = duringYear  1603       , to = duringYear  1671       , label = "Edward Leigh" }
  , { from = on          1603 Aug 9 , to = on          1669 Nov 4 , label = "Johannes Cocceius" }
  , { from = duringYear  1604       , to = duringYear  1664       , label = "Isaac Ambrose" }
  , { from = duringYear  1604       , to = on          1690 May 21, label = "John Eliot" }
  , { from = on          1608 Dec 9 , to = on          1674 Nov 8 , label = "John Milton" }
  , { from = duringYear  1609       , to = duringYear  1675       , label = "Francis Roberts" }
  , { from = duringYear  1613       , to = duringYear  1648       , label = "George Gillespie" }
  , { from = on          1615 Nov 12, to = on          1691 Dec 8 , label = "Richard Baxter" }
  , { from = duringYear  1616       , to = on          1679 Oct 12, label = "William Gurnall" }
  , { from = duringYear  1616       , to = on          1683 Aug 24, label = "John Owen" }
  , { from = duringYear  1617       , to = duringYear  1675       , label = "Patrick Gillespie" }
  , { from = duringYear  1618       , to = on          1651 Aug 22, label = "Christopher Love" }
  , { from = duringYear  1619       , to = duringYear  1698       , label = "Matthew Barker" }
  , { from = duringYear  1620       , to = duringYear  1686       , label = "Thomas Watson" }
  , { from = duringYear  1622       , to = duringYear  1658       , label = "James Durham" }
  , { from = on          1623 Jun 19, to = on          1662 Aug 19, label = "Blaise Pascal" }
  , { from = on          1623 Oct 17, to = on          1687 Sep 28, label = "Francis Turretin" }
  , { from = duringYear  1624       , to = duringYear  1696       , label = "Henry Erskine" }
  , { from = duringYear  1627       , to = duringYear  1673       , label = "George Swinnock" }
  , { from = duringYear  1627       , to = duringYear  1691       , label = "John Flavel" }
  , { from = on          1628 Jun 15, to = duringMonth 1680 Aug   , label = "Walter Marshall" }
  , { from = duringYear  1628       , to = duringYear  1680       , label = "Stephen Charnock" }
  , { from = on          1628 Nov 30, to = on          1688 Aug 31, label = "John Bunyan" }
  , { from = duringYear  1630       , to = duringYear  1705       , label = "John Howe" }
  , { from = on          1635 Jan 2 , to = on          1711 Oct 30, label = "Wilhelmus a Brakel" }
  , { from = on          1636 Feb 12, to = on          1708 Oct 22, label = "Hermann Witsius" }
  , { from = on          1639 Jun 21, to = on          1723 Aug 23, label = "Increase Mather" }
  , { from = duringYear  1648       , to = on          1680 Jul 22, label = "Richard Cameron" }
  , { from = on          1662 Feb 15, to = on          1688 Feb 17, label = "James Renwick" }
  , { from = on          1662 Oct 18, to = on          1714 Jun 22, label = "Matthew Henry" }
  , { from = on          1663 Feb 12, to = on          1728 Feb 13, label = "Cotton Mather" }
  , { from = on          1676 Mar 17, to = on          1732 May 20, label = "Thomas Boston" }
  , { from = on          1680 Jun 22, to = on          1754 Jun 2 , label = "Ebenezer Erskine" }
  , { from = on          1685 Mar 18, to = on          1752 Nov 6 , label = "Ralph Erskine" }
  , { from = on          1697 Nov 23, to = on          1771 Oct 14, label = "John Gill" }
  , { from = on          1703 Oct 5 , to = on          1758 Mar 22, label = "Jonathan Edwards" }
  , { from = duringYear  1706       , to = duringYear  1774       , label = "Alexander Comrie" }
  , { from = on          1710 Apr 26, to = on          1796 Oct 7 , label = "Thomas Reid" }
  , { from = on          1711 May 7 , to = on          1776 Aug 25, label = "David Hume" }
  , { from = on          1714 Dec 27, to = on          1770 Sep 30, label = "George Whitefield" }
  , { from = on          1718 Apr 20, to = on          1747 Oct 9 , label = "David Brainerd" }
  , { from = duringYear  1722       , to = on          1787 Jun 19, label = "John Brown of Haddington" }
  , { from = on          1723 Feb 5 , to = on          1794 Nov 15, label = "John Witherspoon" }
  , { from = on          1724 Apr 22, to = on          1804 Feb 12, label = "Immanuel Kant" }
  , { from = on          1761 Aug 17, to = on          1834 Jun 9 , label = "William Carey" }
  , { from = on          1764 Feb 28, to = on          1842 Dec 12, label = "Robert Haldane" }
  , { from = on          1768 Nov 21, to = on          1834 Feb 12, label = "Friedrich Schleiermacher" }
  , { from = on          1770 Aug 27, to = on          1831 Nov 14, label = "GWF Hegel" }
  , { from = on          1772 Apr 17, to = on          1851 Oct 22, label = "Archibald Alexander" }
  , { from = duringYear  1780       , to = duringYear  1847       , label = "Thomas Chalmers" }
  , { from = on          1797 Dec 27, to = on          1878 Jun 19, label = "Charles Hodge" }
  , { from = on          1802 Jul 26, to = on          1880 Oct 22, label = "William Plumer" }
  , { from = on          1813 May 5 , to = on          1855 Nov 11, label = "Soren Kierkegaard" }
  , { from = on          1813 May 21, to = on          1843 Mar 25, label = "Robert Murray M'Cheyne" }
  , { from = on          1816 May 10, to = on          1900 Jun 10, label = "JC Ryle" }
  , { from = on          1823 Jul 18, to = on          1886 Nov 12, label = "AA Hodge" }
  , { from = on          1832 May 21, to = on          1905 Jun 3 , label = "James Hudson Taylor" }
  , { from = on          1834 Jun 19, to = on          1892 Jan 31, label = "Charles Spurgeon" }
  , { from = on          1837 Oct 29, to = on          1920 Nov 8 , label = "Abraham Kuyper" }
  , { from = on          1844 May 17, to = on          1918 Jan 7 , label = "Julius Wellhausen" }
  , { from = on          1851 May 7 , to = on          1930 Jun 10, label = "Adolf von Harnack" }
  , { from = on          1851 Nov 5 , to = on          1921 Feb 16, label = "BB Warfield" }
  , { from = on          1854 Dec 13, to = on          1921 Jul 29, label = "Herman Bavinck" }
  , { from = on          1862 Mar 14, to = on          1949 Aug 13, label = "Geerhardus Vos" }
  , { from = on          1881 Jul 28, to = on          1937 Jan 1 , label = "J Gresham Machen" }
  , { from = on          1886 May 10, to = on          1968 Dec 10, label = "Karl Barth" }
  , { from = on          1895 May 3 , to = on          1987 Apr 17, label = "Cornelius Van Til" }
  , { from = on          1898 Oct 14, to = on          1975 May 8 , label = "John Murray" }
  , { from = on          1898 Nov 29, to = on          1963 Nov 22, label = "CS Lewis" }
  , { from = on          1899 Dec 20, to = on          1981 Mar 1 , label = "D. Martyn Lloyd-Jones" }
  , { from = on          1902 Jan 16, to = on          1945 Feb 21, label = "Eric Liddell" }
  , { from = duringYear  1903       , to = duringYear  1983       , label = "J.G. Vos" }
  , { from = on          1904 Mar 5 , to = on          1984 Mar 30, label = "Karl Rahner" }
  , { from = on          1907 Nov 29, to = on          1968 Feb 14, label = "Edward J. Young" }
  , { from = on          1912 Jan 30, to = on          1984 May 15, label = "Francis Schaeffer" }
  , { from = on          1914 Nov 22, to = on          1996 Mar 24, label = "John Gerstner" }
  , { from = on          1922 Dec 15, to = on          2007 Apr 14, label = "Meredith Kline" }
  , { from = duringYear  1926       , to = current                , label = "J.I. Packer" }
  , { from = on          1930 Aug 30, to = current                , label = "Bruce Waltke" }
  , { from = on          1939 Feb 13, to = current                , label = "R.C. Sproul" }
  , { from = duringYear  1952       , to = current                , label = "Joel Beeke" }
  , { from = on          1952 Sep 8 , to = current                , label = "Tremper Longman III" }
  ]
