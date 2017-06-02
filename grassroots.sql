-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 02, 2017 at 05:57 PM
-- Server version: 5.6.35
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grassroots`
--

-- --------------------------------------------------------

--
-- Table structure for table `wbc_address`
--

CREATE TABLE `wbc_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_affiliate`
--

CREATE TABLE `wbc_affiliate` (
  `affiliate_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_affiliate_activity`
--

CREATE TABLE `wbc_affiliate_activity` (
  `affiliate_activity_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_affiliate_login`
--

CREATE TABLE `wbc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_affiliate_transaction`
--

CREATE TABLE `wbc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_api`
--

CREATE TABLE `wbc_api` (
  `api_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_api`
--

INSERT INTO `wbc_api` (`api_id`, `name`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'CGvJFlr1h0dUcFm8wvmsL3WHl7ZCzZQX6oSp8v6AT66on2zUKOAMCfuLLxLHXU1apJsMOdCrBt20fA2MTA0j2hHSKy4Upt4BIzfVbv9qyWqMh7Vy3JFkkVINHzPYa5FES2VCr5kzOtMCRHaKjWhHhAR1YFGzBUvVX0FEuzbFOuPXR418ULZziJXZfL0wXZ3FFT0qYOrsUfNnSah048E5Tu11dgKhXILsaeEr5r6h1WFvHwFF2TWfu0gTtG7tvyZ9', 1, '2017-05-25 11:12:51', '2017-05-25 11:12:51');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_api_ip`
--

CREATE TABLE `wbc_api_ip` (
  `api_ip_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_api_session`
--

CREATE TABLE `wbc_api_session` (
  `api_session_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_attribute`
--

CREATE TABLE `wbc_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_attribute`
--

INSERT INTO `wbc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_attribute_description`
--

CREATE TABLE `wbc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_attribute_description`
--

INSERT INTO `wbc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(3, 1, 'Clockspeed'),
(1, 2, 'Description'),
(2, 2, 'No. of Cores'),
(4, 2, 'Điều trị 1'),
(5, 2, 'Điều trị 2'),
(6, 2, 'Điều trị  3'),
(7, 2, 'Điều trị  4'),
(8, 2, 'Điều trị  5'),
(9, 2, 'Điều trị  6'),
(10, 2, 'Điều trị  7'),
(11, 2, 'Điều trị  8'),
(3, 2, 'Clockspeed'),
(4, 1, 'Điều trị 1'),
(5, 1, 'Điều trị  2'),
(6, 1, 'Điều trị  3'),
(7, 1, 'Điều trị  4'),
(8, 1, 'Điều trị  5'),
(9, 1, 'Điều trị  6'),
(10, 1, 'Điều trị  7'),
(11, 1, 'Điều trị  8');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_attribute_group`
--

CREATE TABLE `wbc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_attribute_group`
--

INSERT INTO `wbc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_attribute_group_description`
--

CREATE TABLE `wbc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_attribute_group_description`
--

INSERT INTO `wbc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Treatments'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor'),
(3, 2, 'Điều trị'),
(5, 2, 'Motherboard'),
(6, 2, 'Processor');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_banner`
--

CREATE TABLE `wbc_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_banner`
--

INSERT INTO `wbc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Thương hiệu', 1),
(9, 'Banner Thương hiệu', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_banner_image`
--

CREATE TABLE `wbc_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_banner_image`
--

INSERT INTO `wbc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(79, 7, 1, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(87, 6, 1, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(80, 7, 1, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(99, 7, 2, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(100, 6, 2, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(148, 9, 1, 'đasadsd', '', 'catalog/man/bg_sub.jpg', 0),
(147, 9, 2, 'đâsdasdsadsa', '', 'catalog/man/bg_sub.jpg', 0),
(146, 8, 1, 'Canon', '', 'catalog/demo/manufacturer/brand-6.png', 0),
(144, 8, 1, 'RedBull', '', 'catalog/demo/manufacturer/brand-4.png', 0),
(145, 8, 1, 'NFL', '', 'catalog/demo/manufacturer/brand-5.png', 0),
(143, 8, 1, 'Sony', '', 'catalog/demo/manufacturer/brand-3.png', 0),
(110, 7, 2, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(142, 8, 1, 'Coca Cola', '', 'catalog/demo/manufacturer/brand-2.png', 0),
(141, 8, 1, 'Burger King', '', 'catalog/demo/manufacturer/brand-1.png', 0),
(140, 8, 2, 'NFL', '', 'catalog/demo/manufacturer/brand-6.png', 0),
(139, 8, 2, 'Harley Davidson', '', 'catalog/demo/manufacturer/brand-5.png', 0),
(138, 8, 2, 'Dell', '', 'catalog/demo/manufacturer/brand-4.png', 0),
(137, 8, 2, 'Disney', '', 'catalog/demo/manufacturer/brand-3.png', 0),
(136, 8, 2, 'Starbucks', '', 'catalog/demo/manufacturer/brand-2.png', 0),
(135, 8, 2, 'Nintendo', '', 'catalog/demo/manufacturer/brand-1.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_blog`
--

CREATE TABLE `wbc_blog` (
  `blog_id` int(11) NOT NULL,
  `allow_comment` int(1) NOT NULL DEFAULT '1',
  `count_read` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wbc_blog`
--

INSERT INTO `wbc_blog` (`blog_id`, `allow_comment`, `count_read`, `sort_order`, `status`, `author`, `date_added`, `image`) VALUES
(16, 1, 21, 0, 1, 'John', '2017-05-31 16:07:55', 'catalog/blogs/1.jpg'),
(17, 1, 0, 0, 1, 'John', '2017-05-31 16:08:41', 'catalog/blogs/2.jpg'),
(18, 1, 4, 0, 1, 'John', '2017-05-31 16:09:56', 'catalog/blogs/3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_blog_category`
--

CREATE TABLE `wbc_blog_category` (
  `blog_category_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `wbc_blog_category`
--

INSERT INTO `wbc_blog_category` (`blog_category_id`, `parent_id`, `sort_order`, `date_added`, `status`) VALUES
(49, 0, 0, '2017-05-29 15:21:11', 1),
(50, 0, 0, '2017-05-29 15:21:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_blog_category_description`
--

CREATE TABLE `wbc_blog_category_description` (
  `blog_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `meta_keywords` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `wbc_blog_category_description`
--

INSERT INTO `wbc_blog_category_description` (`blog_category_id`, `language_id`, `name`, `page_title`, `meta_keywords`, `meta_description`, `description`) VALUES
(1, 2, 'Name (H1)', 'Name (H1)', '', '', ''),
(1, 1, 'Name (H1)', 'Name (H1)', '', '', ''),
(49, 2, 'Tin tức', '', '', '', ''),
(50, 2, 'Blog', 'Blog', '', '', ''),
(49, 1, 'Tin tức', '', '', '', ''),
(50, 1, 'Blog', 'Blog', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_blog_category_to_layout`
--

CREATE TABLE `wbc_blog_category_to_layout` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_blog_category_to_store`
--

CREATE TABLE `wbc_blog_category_to_store` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `wbc_blog_category_to_store`
--

INSERT INTO `wbc_blog_category_to_store` (`blog_category_id`, `store_id`) VALUES
(49, 0),
(50, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_blog_comment`
--

CREATE TABLE `wbc_blog_comment` (
  `blog_comment_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date_added` datetime DEFAULT '0000-00-00 00:00:00',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_blog_description`
--

CREATE TABLE `wbc_blog_description` (
  `blog_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  `page_title` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `short_description` text COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `tags` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `wbc_blog_description`
--

INSERT INTO `wbc_blog_description` (`blog_id`, `language_id`, `title`, `page_title`, `meta_keyword`, `meta_description`, `short_description`, `description`, `tags`) VALUES
(16, 2, '\'Cuộc chiến\' Uber, Grab và taxi tại các nước diễn ra thế nào?', '\'Cuộc chiến\' Uber, Grab và taxi tại các nước diễn ra thế nào?', '', '', 'Taxi truyền thống ở Mỹ, Thái Lan, Hong Kong... cũng bị ảnh hưởng vì Uber, Grab và các ứng dụng gọi xe thông minh. Tuy vậy, người dân ở đây cũng ủng hộ các ứng dụng gọi xe này', '&lt;p&gt;Taxi truyền thống ở Mỹ, Thái Lan, Hong Kong... cũng bị ảnh hưởng vì Uber, Grab và các ứng dụng gọi xe thông minh. Tuy vậy, người dân ở đây cũng ủng hộ các ứng dụng gọi xe này&lt;/p&gt;\r\n\r\n&lt;p&gt;Tại nhiều quốc gia trên thế giới, cuộc đối đầu giữa taxi truyền thống và ứng dụng gọi xe trở nên không cân sức, khi với lợi thế về công nghệ, giá cả, những Uber, Lyft, Didi Chungxing hay Grab đang dần thắng thế.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;h3&gt;Uber toàn thắng trên sân nhà&lt;/h3&gt;\r\n\r\n&lt;p&gt;&quot;Cảm giác đi một&amp;nbsp;chiếc Lyft hay Uber gần gũi hơn là một chiếc taxi. Lái xe trò chuyện cùng tôi, chỉnh điều hòa phía tài xế về phía tôi để sưởi khi tôi lạnh, cảm giác giống xe gia đình&quot;, anh Will Oshiro (Mỹ) chia sẻ như vậy.&lt;/p&gt;\r\n\r\n&lt;p&gt;Người đàn ông này cho hay đã rất lâu rồi anh không gọi taxi truyền thống nữa, bởi việc gọi xe khó khăn hơn, giá cước cũng cao hơn.&lt;/p&gt;\r\n\r\n&lt;p&gt;Còn Aleksandr Vasilenko cho hay anh đã ngừng đi taxi truyền thống sau một vài chuyến, vì &quot;tài xế taxi rất cáu kỉnh, trong khi tài xế Uber hay Lyft rất thân thiện, xe của họ cũng sạch sẽ hơn mà giá lại rẻ. Xe taxi truyền thống thường xuyên ám mùi thuốc lá lâu ngày rất khó chịu&quot;.&lt;/p&gt;\r\n\r\n&lt;p&gt;Tại Mỹ, quê nhà của Uber, ứng dụng tiên phong cho mô hình gọi xe bằng điện thoại thông minh, hàng loạt công ty taxi truyền thống đang sa thải nhân viên hay tệ hơn, đang làm thủ tục phá sản.&lt;/p&gt;\r\n', ''),
(16, 1, '\'Cuộc chiến\' Uber, Grab và taxi tại các nước diễn ra thế nào?', '\'Cuộc chiến\' Uber, Grab và taxi tại các nước diễn ra thế nào?', '', '', 'Taxi truyền thống ở Mỹ, Thái Lan, Hong Kong... cũng bị ảnh hưởng vì Uber, Grab và các ứng dụng gọi xe thông minh. Tuy vậy, người dân ở đây cũng ủng hộ các ứng dụng gọi xe này', '&lt;p&gt;Taxi truyền thống ở Mỹ, Thái Lan, Hong Kong... cũng bị ảnh hưởng vì Uber, Grab và các ứng dụng gọi xe thông minh. Tuy vậy, người dân ở đây cũng ủng hộ các ứng dụng gọi xe này&lt;/p&gt;\r\n\r\n&lt;p&gt;Tại nhiều quốc gia trên thế giới, cuộc đối đầu giữa taxi truyền thống và ứng dụng gọi xe trở nên không cân sức, khi với lợi thế về công nghệ, giá cả, những Uber, Lyft, Didi Chungxing hay Grab đang dần thắng thế.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;h3&gt;Uber toàn thắng trên sân nhà&lt;/h3&gt;\r\n\r\n&lt;p&gt;&quot;Cảm giác đi một&amp;nbsp;chiếc Lyft hay Uber gần gũi hơn là một chiếc taxi. Lái xe trò chuyện cùng tôi, chỉnh điều hòa phía tài xế về phía tôi để sưởi khi tôi lạnh, cảm giác giống xe gia đình&quot;, anh Will Oshiro (Mỹ) chia sẻ như vậy.&lt;/p&gt;\r\n\r\n&lt;p&gt;Người đàn ông này cho hay đã rất lâu rồi anh không gọi taxi truyền thống nữa, bởi việc gọi xe khó khăn hơn, giá cước cũng cao hơn.&lt;/p&gt;\r\n\r\n&lt;p&gt;Còn Aleksandr Vasilenko cho hay anh đã ngừng đi taxi truyền thống sau một vài chuyến, vì &quot;tài xế taxi rất cáu kỉnh, trong khi tài xế Uber hay Lyft rất thân thiện, xe của họ cũng sạch sẽ hơn mà giá lại rẻ. Xe taxi truyền thống thường xuyên ám mùi thuốc lá lâu ngày rất khó chịu&quot;.&lt;/p&gt;\r\n\r\n&lt;p&gt;Tại Mỹ, quê nhà của Uber, ứng dụng tiên phong cho mô hình gọi xe bằng điện thoại thông minh, hàng loạt công ty taxi truyền thống đang sa thải nhân viên hay tệ hơn, đang làm thủ tục phá sản.&lt;/p&gt;\r\n', ''),
(17, 2, 'Diệp Lâm Anh, host The Face mắc lỗi trang phục tuần qua', 'Diệp Lâm Anh, host The Face mắc lỗi trang phục tuần qua', '', '', 'Tuần qua, Diệp Lâm Anh tham dự sự kiện thời trang tại Hà Nội với phong cách gợi cảm. Chiếc váy ôm sát, chất liệu trong suốt giúp nữ diễn viên khoe khéo vóc dáng thon gọn. Tuy nhiên, người đẹp mắc lỗi chọn nội y thiếu tinh tế, làm xấu tổng thể. Ảnh: Việt Hùng. \r\n', '&lt;table align=&quot;center&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Tuần qua, Diệp Lâm Anh tham dự sự kiện thời trang tại Hà Nội với phong cách gợi cảm. Chiếc váy ôm sát, chất liệu trong suốt giúp nữ diễn viên khoe khéo vóc dáng thon gọn. Tuy nhiên, người đẹp mắc lỗi chọn nội y thiếu tinh tế, làm xấu tổng thể. Ảnh:&lt;em&gt;&amp;nbsp;Việt Hùng.&amp;nbsp;&lt;/em&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table align=&quot;center&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;img alt=&quot;Diep Lam Anh, host The Face mac loi trang phuc tuan qua hinh anh 2&quot; src=&quot;http://znews-photo-td.zadn.vn/w1024/Uploaded/OpluOAA/2017_05_31/NGT_66384_Zing.jpg&quot; style=&quot;height:2048px; width:1365px&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Diễn viên Thanh Trúc dự họp báo ra mắt phim ngắn&amp;nbsp;&lt;em&gt;Cô gái kẹo kéo&lt;/em&gt;&amp;nbsp;hôm 27/5 với trang phục kém sang, không mang hơi thở hiện đại. Cách cô mix chân váy đỏ đồng điệu với màu viền áo càng làm bộ cánh trở nên màu mè, diêm dúa. Ảnh:&lt;em&gt;&amp;nbsp;Nguyễn Thành&lt;/em&gt;.&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table align=&quot;center&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;img alt=&quot;Diep Lam Anh, host The Face mac loi trang phuc tuan qua hinh anh 3&quot; src=&quot;http://znews-photo-td.zadn.vn/w1024/Uploaded/OpluOAA/2017_05_31/kim_anh_vu_cong.jpg&quot; style=&quot;height:2048px; width:1365px&quot; title=&quot;Diệp Lâm Anh, host The Face mắc lỗi trang phục tuần qua hình ảnh 3&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Vũ công Kim Anh (ảnh trái) mắc lỗi phối áo khoác không phù hợp với bộ cánh gợi cảm bên trong. Chiếc áo khoác đỏ rực phá hỏng set đồ của cô. Ảnh:&amp;nbsp;&lt;em&gt;Nguyễn Thành.&lt;/em&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table align=&quot;center&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;img alt=&quot;Diep Lam Anh, host The Face mac loi trang phuc tuan qua hinh anh 4&quot; src=&quot;http://znews-photo-td.zadn.vn/w1024/Uploaded/OpluOAA/2017_05_31/02hoangyenchibi7.jpg&quot; style=&quot;height:899px; width:600px&quot; /&gt;&lt;a href=&quot;http://news.zing.vn/diep-lam-anh-host-the-face-mac-loi-trang-phuc-tuan-qua-post750901.html#slideshow&quot;&gt;Phóng to&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Hoàng Yến Chibi vẫn theo đuổi hình ảnh trẻ trung, nhí nhảnh. Tuy nhiên, cách mix đồ lần này của cô bị nhận xét sến. Bản thân chiếc váy chấm bi xếp tầng đã rất nổi bật, nữ ca sĩ không cần tạo thêm điểm nhấn bằng đôi sandal gắn cục bông sắc màu. Ảnh:&amp;nbsp;&lt;em&gt;BTC.&amp;nbsp;&lt;/em&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', ''),
(17, 1, 'Diệp Lâm Anh, host The Face mắc lỗi trang phục tuần qua', 'Diệp Lâm Anh, host The Face mắc lỗi trang phục tuần qua', '', '', 'Tuần qua, Diệp Lâm Anh tham dự sự kiện thời trang tại Hà Nội với phong cách gợi cảm. Chiếc váy ôm sát, chất liệu trong suốt giúp nữ diễn viên khoe khéo vóc dáng thon gọn. Tuy nhiên, người đẹp mắc lỗi chọn nội y thiếu tinh tế, làm xấu tổng thể. Ảnh: Việt Hùng. \r\n', '&lt;table align=&quot;center&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Tuần qua, Diệp Lâm Anh tham dự sự kiện thời trang tại Hà Nội với phong cách gợi cảm. Chiếc váy ôm sát, chất liệu trong suốt giúp nữ diễn viên khoe khéo vóc dáng thon gọn. Tuy nhiên, người đẹp mắc lỗi chọn nội y thiếu tinh tế, làm xấu tổng thể. Ảnh:&lt;em&gt;&amp;nbsp;Việt Hùng.&amp;nbsp;&lt;/em&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table align=&quot;center&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;img alt=&quot;Diep Lam Anh, host The Face mac loi trang phuc tuan qua hinh anh 2&quot; src=&quot;http://znews-photo-td.zadn.vn/w1024/Uploaded/OpluOAA/2017_05_31/NGT_66384_Zing.jpg&quot; style=&quot;height:2048px; width:1365px&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Diễn viên Thanh Trúc dự họp báo ra mắt phim ngắn&amp;nbsp;&lt;em&gt;Cô gái kẹo kéo&lt;/em&gt;&amp;nbsp;hôm 27/5 với trang phục kém sang, không mang hơi thở hiện đại. Cách cô mix chân váy đỏ đồng điệu với màu viền áo càng làm bộ cánh trở nên màu mè, diêm dúa. Ảnh:&lt;em&gt;&amp;nbsp;Nguyễn Thành&lt;/em&gt;.&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table align=&quot;center&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;img alt=&quot;Diep Lam Anh, host The Face mac loi trang phuc tuan qua hinh anh 3&quot; src=&quot;http://znews-photo-td.zadn.vn/w1024/Uploaded/OpluOAA/2017_05_31/kim_anh_vu_cong.jpg&quot; style=&quot;height:2048px; width:1365px&quot; title=&quot;Diệp Lâm Anh, host The Face mắc lỗi trang phục tuần qua hình ảnh 3&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Vũ công Kim Anh (ảnh trái) mắc lỗi phối áo khoác không phù hợp với bộ cánh gợi cảm bên trong. Chiếc áo khoác đỏ rực phá hỏng set đồ của cô. Ảnh:&amp;nbsp;&lt;em&gt;Nguyễn Thành.&lt;/em&gt;&amp;nbsp;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;table align=&quot;center&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;img alt=&quot;Diep Lam Anh, host The Face mac loi trang phuc tuan qua hinh anh 4&quot; src=&quot;http://znews-photo-td.zadn.vn/w1024/Uploaded/OpluOAA/2017_05_31/02hoangyenchibi7.jpg&quot; style=&quot;height:899px; width:600px&quot; /&gt;&lt;a href=&quot;http://news.zing.vn/diep-lam-anh-host-the-face-mac-loi-trang-phuc-tuan-qua-post750901.html#slideshow&quot;&gt;Phóng to&lt;/a&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Hoàng Yến Chibi vẫn theo đuổi hình ảnh trẻ trung, nhí nhảnh. Tuy nhiên, cách mix đồ lần này của cô bị nhận xét sến. Bản thân chiếc váy chấm bi xếp tầng đã rất nổi bật, nữ ca sĩ không cần tạo thêm điểm nhấn bằng đôi sandal gắn cục bông sắc màu. Ảnh:&amp;nbsp;&lt;em&gt;BTC.&amp;nbsp;&lt;/em&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', ''),
(18, 1, 'Đường Cộng Hòa kẹt cứng 2 giờ sau tai nạn trên cầu vượt Hoàng Hoa Thám', 'Đường Cộng Hòa kẹt cứng 2 giờ sau tai nạn trên cầu vượt Hoàng Hoa Thám', '', '', 'Ôtô 4 chỗ va chạm với xe khách trên cầu vượt Hoàng Hoa Thám (TP.HCM). Công an phong tỏa 2 đầu cầu để giải quyết tai nạn khiến xe cộ kẹt cứng khoảng 2 giờ.', '&lt;p&gt;Chiều muộn 30/5, nam tài xế khoảng 35 tuổi lái ôtô 4 chỗ mang biển kiểm soát TP.HCM chạy trên đường Cộng Hòa hướng từ đường Trường Chinh đi công viên Hoàng Văn Thụ.&lt;/p&gt;\r\n\r\n&lt;table align=&quot;center&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;img alt=&quot;Duong Cong Hoa ket cung 2 gio sau tai nan tren cau vuot Hoang Hoa Tham hinh anh 1&quot; src=&quot;http://znews-photo-td.zadn.vn/w660/Uploaded/zxgorz/2017_05_30/ket_xe_bia.jpg&quot; style=&quot;height:564px; width:789px&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Công an đang xử lý hiện trường vụ tai nạn. Ảnh:&amp;nbsp;&lt;em&gt;Thái Linh.&lt;/em&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;Khi ôtô lên giữa cầu vượt Hoàng Hoa Thám thì bất ngờ xảy ra va chạm với xe khách chạy hướng ngược lại. Tai nạn khiến 2 xe hư hỏng phần đầu, may mắn cả 2 tài xế không bị thương.&lt;/p&gt;\r\n\r\n&lt;p&gt;Nhận tin báo, lực lượng chức năng quận Tân Bình đã có mặt phong tỏa 2 đầu cầu vượt để xử lý tai nạn.&lt;/p&gt;\r\n\r\n&lt;table align=&quot;center&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;img alt=&quot;Duong Cong Hoa ket cung 2 gio sau tai nan tren cau vuot Hoang Hoa Tham hinh anh 2&quot; src=&quot;http://znews-photo-td.zadn.vn/w660/Uploaded/zxgorz/2017_05_30/ket_xe_3.jpg&quot; style=&quot;height:642px; width:981px&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Đường Cộng Hòa kẹt xe nghiêm trọng. Ảnh:&lt;em&gt;&amp;nbsp;Thái Linh.&lt;/em&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;Do sự cố xảy ra vào giờ cao điểm khiến xe cộ qua khu vực kẹt hơn khoảng 2 giờ. Dòng xe nối đuôi nhích từng chút qua giao lộ Cộng Hòa - Hoàng Hoa Thám.&lt;/p&gt;\r\n\r\n&lt;p&gt;Cũng trong chiều cùng ngày, một số tuyến đường gần sân bay như Trường Sơn, Trần Quốc Hoàn, Nguyễn Văn Trỗi, cũng xuất hiện tình trạng kẹt xe. Các ôtô xếp hàng dài ra vào sân bay. Nhiều người phải xuống xe, xách hành lý chạy bộ để kịp giờ làm thủ tục.&lt;/p&gt;\r\n', ''),
(18, 2, 'Đường Cộng Hòa kẹt cứng 2 giờ sau tai nạn trên cầu vượt Hoàng Hoa Thám', 'Đường Cộng Hòa kẹt cứng 2 giờ sau tai nạn trên cầu vượt Hoàng Hoa Thám', '', '', 'Ôtô 4 chỗ va chạm với xe khách trên cầu vượt Hoàng Hoa Thám (TP.HCM). Công an phong tỏa 2 đầu cầu để giải quyết tai nạn khiến xe cộ kẹt cứng khoảng 2 giờ.', '&lt;p&gt;Chiều muộn 30/5, nam tài xế khoảng 35 tuổi lái ôtô 4 chỗ mang biển kiểm soát TP.HCM chạy trên đường Cộng Hòa hướng từ đường Trường Chinh đi công viên Hoàng Văn Thụ.&lt;/p&gt;\r\n\r\n&lt;table align=&quot;center&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;img alt=&quot;Duong Cong Hoa ket cung 2 gio sau tai nan tren cau vuot Hoang Hoa Tham hinh anh 1&quot; src=&quot;http://znews-photo-td.zadn.vn/w660/Uploaded/zxgorz/2017_05_30/ket_xe_bia.jpg&quot; style=&quot;height:564px; width:789px&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Công an đang xử lý hiện trường vụ tai nạn. Ảnh:&amp;nbsp;&lt;em&gt;Thái Linh.&lt;/em&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;Khi ôtô lên giữa cầu vượt Hoàng Hoa Thám thì bất ngờ xảy ra va chạm với xe khách chạy hướng ngược lại. Tai nạn khiến 2 xe hư hỏng phần đầu, may mắn cả 2 tài xế không bị thương.&lt;/p&gt;\r\n\r\n&lt;p&gt;Nhận tin báo, lực lượng chức năng quận Tân Bình đã có mặt phong tỏa 2 đầu cầu vượt để xử lý tai nạn.&lt;/p&gt;\r\n\r\n&lt;table align=&quot;center&quot;&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;&lt;img alt=&quot;Duong Cong Hoa ket cung 2 gio sau tai nan tren cau vuot Hoang Hoa Tham hinh anh 2&quot; src=&quot;http://znews-photo-td.zadn.vn/w660/Uploaded/zxgorz/2017_05_30/ket_xe_3.jpg&quot; style=&quot;height:642px; width:981px&quot; /&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;Đường Cộng Hòa kẹt xe nghiêm trọng. Ảnh:&lt;em&gt;&amp;nbsp;Thái Linh.&lt;/em&gt;&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt;Do sự cố xảy ra vào giờ cao điểm khiến xe cộ qua khu vực kẹt hơn khoảng 2 giờ. Dòng xe nối đuôi nhích từng chút qua giao lộ Cộng Hòa - Hoàng Hoa Thám.&lt;/p&gt;\r\n\r\n&lt;p&gt;Cũng trong chiều cùng ngày, một số tuyến đường gần sân bay như Trường Sơn, Trần Quốc Hoàn, Nguyễn Văn Trỗi, cũng xuất hiện tình trạng kẹt xe. Các ôtô xếp hàng dài ra vào sân bay. Nhiều người phải xuống xe, xách hành lý chạy bộ để kịp giờ làm thủ tục.&lt;/p&gt;\r\n', '');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_blog_related`
--

CREATE TABLE `wbc_blog_related` (
  `parent_blog_id` int(11) NOT NULL DEFAULT '0',
  `child_blog_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wbc_blog_related`
--

INSERT INTO `wbc_blog_related` (`parent_blog_id`, `child_blog_id`) VALUES
(17, 17),
(17, 16),
(17, 18);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_blog_to_category`
--

CREATE TABLE `wbc_blog_to_category` (
  `blog_id` int(11) NOT NULL,
  `blog_category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `wbc_blog_to_category`
--

INSERT INTO `wbc_blog_to_category` (`blog_id`, `blog_category_id`) VALUES
(16, 49),
(16, 50),
(17, 49),
(17, 50),
(18, 49),
(18, 50);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_blog_to_layout`
--

CREATE TABLE `wbc_blog_to_layout` (
  `blog_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_blog_to_store`
--

CREATE TABLE `wbc_blog_to_store` (
  `blog_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wbc_blog_to_store`
--

INSERT INTO `wbc_blog_to_store` (`blog_id`, `store_id`) VALUES
(16, 0),
(17, 0),
(18, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_cart`
--

CREATE TABLE `wbc_cart` (
  `cart_id` int(11) UNSIGNED NOT NULL,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_category`
--

CREATE TABLE `wbc_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_category`
--

INSERT INTO `wbc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2017-06-01 19:42:13'),
(20, 'catalog/demo/compaq_presario.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2017-06-01 19:42:13'),
(18, 'catalog/demo/hp_2.jpg', 0, 1, 0, 2, 1, '2009-01-05 21:49:15', '2017-06-01 19:42:13'),
(17, '', 0, 1, 1, 4, 1, '2009-01-03 21:08:57', '2017-06-01 19:42:13'),
(33, 'catalog/categories/1.jpg', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2017-06-01 19:42:13');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_category_description`
--

CREATE TABLE `wbc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_keyword` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  `seo_h2` varchar(255) NOT NULL,
  `seo_h3` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_category_description`
--

INSERT INTO `wbc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`, `seo_keyword`, `seo_h1`, `seo_h2`, `seo_h3`) VALUES
(18, 1, 'Bôi ngoài da', '&lt;p&gt;Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Laptops &amp; Notebooks', 'Bôi ngoài da - Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carpho', 'Bôi ngoài da, Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carpho', 'laptop-notebook', '', '', ''),
(25, 1, 'Chữa trị sẹo', '', 'Components', 'Chữa trị sẹo -', 'Chữa trị sẹo,', 'component', '', '', ''),
(18, 2, 'Bôi ngoài da', '&lt;p&gt;Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Laptops &amp; Notebooks', 'Bôi ngoài da - Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carpho', 'Bôi ngoài da, Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carpho', 'laptop-notebook', '', '', ''),
(20, 1, 'Thẩm mỹ', '&lt;p&gt;Example of category description text&lt;/p&gt;\r\n', 'Desktops', 'Example of category description', 'Thẩm mỹ, Example of category description text', 'desktops', '', '', ''),
(17, 1, 'Tiêm trẻ hóa', '', 'Software', 'Tiêm trẻ hóa -', 'Tiêm trẻ hóa,', 'software', '', '', ''),
(33, 2, 'Thiết bị laser thẩm mỹ ', '', 'Cameras', 'Thiết bị laser thẩm mỹ -', 'Thiết bị laser thẩm mỹ,', 'camera', '', '', ''),
(33, 1, 'Thiết bị laser thẩm mỹ ', '', 'Thiết bị laser thẩm mỹ', 'Thiết bị laser thẩm mỹ -', 'thiết bị laser thẩm mỹ,', 'thiết-bị-laser-thẩm-mỹ', 'Thiết bị laser thẩm mỹ', 'Thiết bị laser thẩm mỹ', 'Thiết bị laser thẩm mỹ'),
(25, 2, 'Chữa trị sẹo', '', 'Components', 'Chữa trị sẹo -', 'Chữa trị sẹo,', 'component', '', '', ''),
(20, 2, 'Thẩm mỹ', '&lt;p&gt;Example of category description text&lt;/p&gt;\r\n', 'Desktops', 'Example of category description', 'Thẩm mỹ, Example of category description text', 'desktops', '', '', ''),
(17, 2, 'Tiêm trẻ hóa', '', 'Software', 'Tiêm trẻ hóa -', 'Tiêm trẻ hóa,', 'software', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_category_filter`
--

CREATE TABLE `wbc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_category_path`
--

CREATE TABLE `wbc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_category_path`
--

INSERT INTO `wbc_category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(20, 20, 0),
(18, 18, 0),
(17, 17, 0),
(33, 33, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_category_to_layout`
--

CREATE TABLE `wbc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_category_to_layout`
--

INSERT INTO `wbc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(33, 0, 0),
(18, 0, 0),
(25, 0, 0),
(20, 0, 0),
(17, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_category_to_store`
--

CREATE TABLE `wbc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_category_to_store`
--

INSERT INTO `wbc_category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(18, 0),
(20, 0),
(25, 0),
(33, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_country`
--

CREATE TABLE `wbc_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(160) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_country`
--

INSERT INTO `wbc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Thành Phố Hà Nội', '', '', '', 0, 1),
(2, 'Tỉnh Hà Giang', '', '', '', 0, 1),
(4, 'Tỉnh Cao Bằng', '', '', '', 0, 1),
(6, 'Tỉnh Bắc Kạn', '', '', '', 0, 1),
(8, 'Tỉnh Tuyên Quang', '', '', '', 0, 1),
(10, 'Tỉnh Lào Cai', '', '', '', 0, 1),
(11, 'Tỉnh Điện Biên', '', '', '', 0, 1),
(12, 'Tỉnh Lai Châu', '', '', '', 0, 1),
(14, 'Tỉnh Sơn La', '', '', '', 0, 1),
(15, 'Tỉnh Yên Bái', '', '', '', 0, 1),
(17, 'Tỉnh Hòa Bình', '', '', '', 0, 1),
(19, 'Tỉnh Thái Nguyên', '', '', '', 0, 1),
(20, 'Tỉnh Lạng Sơn', '', '', '', 0, 1),
(22, 'Tỉnh Quảng Ninh', '', '', '', 0, 1),
(24, 'Tỉnh Bắc Giang', '', '', '', 0, 1),
(25, 'Tỉnh Phú Thọ', '', '', '', 0, 1),
(26, 'Tỉnh Vĩnh Phúc', '', '', '', 0, 1),
(27, 'Tỉnh Bắc Ninh', '', '', '', 0, 1),
(30, 'Tỉnh Hải Dương', '', '', '', 0, 1),
(31, 'Thành Phố Hải Phòng', '', '', '', 0, 1),
(33, 'Tỉnh Hưng Yên', '', '', '', 0, 1),
(34, 'Tỉnh Thái Bình', '', '', '', 0, 1),
(35, 'Tỉnh Hà Nam', '', '', '', 0, 1),
(36, 'Tỉnh Nam Định', '', '', '', 0, 1),
(37, 'Tỉnh Ninh Bình', '', '', '', 0, 1),
(38, 'Tỉnh Thanh Hóa', '', '', '', 0, 1),
(40, 'Tỉnh Nghệ An', '', '', '', 0, 1),
(42, 'Tỉnh Hà Tĩnh', '', '', '', 0, 1),
(44, 'Tỉnh Quảng Bình', '', '', '', 0, 1),
(45, 'Tỉnh Quảng Trị', '', '', '', 0, 1),
(46, 'Tỉnh Thừa Thiên Huế', '', '', '', 0, 1),
(48, 'Thành Phố Đà Nẵng', '', '', '', 0, 1),
(49, 'Tỉnh Quảng Nam', '', '', '', 0, 1),
(51, 'Tỉnh Quảng Ngãi', '', '', '', 0, 1),
(52, 'Tỉnh Bình Định', '', '', '', 0, 1),
(54, 'Tỉnh Phú Yên', '', '', '', 0, 1),
(56, 'Tỉnh Khánh Hòa', '', '', '', 0, 1),
(58, 'Tỉnh Ninh Thuận', '', '', '', 0, 1),
(60, 'Tỉnh Bình Thuận', '', '', '', 0, 1),
(62, 'Tỉnh Kon Tum', '', '', '', 0, 1),
(64, 'Tỉnh Gia Lai', '', '', '', 0, 1),
(66, 'Tỉnh Đắk Lắk', '', '', '', 0, 1),
(67, 'Tỉnh Đắk Nông', '', '', '', 0, 1),
(68, 'Tỉnh Lâm Đồng', '', '', '', 0, 1),
(70, 'Tỉnh Bình Phước', '', '', '', 0, 1),
(72, 'Tỉnh Tây Ninh', '', '', '', 0, 1),
(74, 'Tỉnh Bình Dương', '', '', '', 0, 1),
(75, 'Tỉnh Đồng Nai', '', '', '', 0, 1),
(77, 'Tỉnh Bà Rịa - Vũng Tàu', '', '', '', 0, 1),
(79, 'Thành Phố Hồ Chí Minh', '', '', '', 0, 1),
(80, 'Tỉnh Long An', '', '', '', 0, 1),
(82, 'Tỉnh Tiền Giang', '', '', '', 0, 1),
(83, 'Tỉnh Bến Tre', '', '', '', 0, 1),
(84, 'Tỉnh Trà Vinh', '', '', '', 0, 1),
(86, 'Tỉnh Vĩnh Long', '', '', '', 0, 1),
(87, 'Tỉnh Đồng Tháp', '', '', '', 0, 1),
(89, 'Tỉnh An Giang', '', '', '', 0, 1),
(91, 'Tỉnh Kiên Giang', '', '', '', 0, 1),
(92, 'Thành Phố Cần Thơ', '', '', '', 0, 1),
(93, 'Tỉnh Hậu Giang', '', '', '', 0, 1),
(94, 'Tỉnh Sóc Trăng', '', '', '', 0, 1),
(95, 'Tỉnh Bạc Liêu', '', '', '', 0, 1),
(96, 'Tỉnh Cà Mau', '', '', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_coupon`
--

CREATE TABLE `wbc_coupon` (
  `coupon_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_coupon`
--

INSERT INTO `wbc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_coupon_category`
--

CREATE TABLE `wbc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_coupon_history`
--

CREATE TABLE `wbc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_coupon_product`
--

CREATE TABLE `wbc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_currency`
--

CREATE TABLE `wbc_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_currency`
--

INSERT INTO `wbc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£', '', '2', 0.77660000, 1, '2017-06-02 10:07:45'),
(2, 'US Dollar', 'USD', '$', '', '2', 1.00000000, 1, '2017-06-02 14:15:43'),
(3, 'Euro', 'EUR', '', '€', '2', 0.89130002, 1, '2017-06-02 10:07:45');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_customer`
--

CREATE TABLE `wbc_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_customer_activity`
--

CREATE TABLE `wbc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_customer_group`
--

CREATE TABLE `wbc_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_customer_group`
--

INSERT INTO `wbc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_customer_group_description`
--

CREATE TABLE `wbc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_customer_group_description`
--

INSERT INTO `wbc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test'),
(1, 2, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_customer_history`
--

CREATE TABLE `wbc_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_customer_ip`
--

CREATE TABLE `wbc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_customer_login`
--

CREATE TABLE `wbc_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_customer_online`
--

CREATE TABLE `wbc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_customer_reward`
--

CREATE TABLE `wbc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_customer_search`
--

CREATE TABLE `wbc_customer_search` (
  `customer_search_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_customer_transaction`
--

CREATE TABLE `wbc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_customer_wishlist`
--

CREATE TABLE `wbc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_custom_field`
--

CREATE TABLE `wbc_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_custom_field_customer_group`
--

CREATE TABLE `wbc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_custom_field_description`
--

CREATE TABLE `wbc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_custom_field_value`
--

CREATE TABLE `wbc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_custom_field_value_description`
--

CREATE TABLE `wbc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_dieutri`
--

CREATE TABLE `wbc_dieutri` (
  `dieutri_id` int(11) NOT NULL,
  `allow_comment` int(1) NOT NULL DEFAULT '1',
  `count_read` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `image_before` varchar(255) NOT NULL,
  `image_after` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wbc_dieutri`
--

INSERT INTO `wbc_dieutri` (`dieutri_id`, `allow_comment`, `count_read`, `sort_order`, `status`, `author`, `date_added`, `image`, `image_before`, `image_after`) VALUES
(16, 1, 1, 0, 1, 'John', '2017-05-29 15:33:39', 'catalog/dieutri/1.jpg', 'catalog/home/p.png', 'catalog/home/p2.png'),
(17, 1, 18, 0, 1, 'John', '2017-05-29 16:15:19', 'catalog/dieutri/2.jpg', '', ''),
(18, 1, 4, 0, 1, 'John', '2017-05-29 16:15:33', 'catalog/dieutri/3.jpg', '', ''),
(19, 1, 138, 0, 1, 'John', '2017-05-29 16:17:31', 'catalog/dieutri/2.jpg', 'catalog/dieutri/2.jpg', 'catalog/dieutri/1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_dieutri_category`
--

CREATE TABLE `wbc_dieutri_category` (
  `dieutri_category_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `wbc_dieutri_category`
--

INSERT INTO `wbc_dieutri_category` (`dieutri_category_id`, `parent_id`, `sort_order`, `date_added`, `status`) VALUES
(49, 0, 0, '2017-05-29 15:34:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_dieutri_category_description`
--

CREATE TABLE `wbc_dieutri_category_description` (
  `dieutri_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `meta_keywords` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `wbc_dieutri_category_description`
--

INSERT INTO `wbc_dieutri_category_description` (`dieutri_category_id`, `language_id`, `name`, `page_title`, `meta_keywords`, `meta_description`, `description`) VALUES
(49, 2, 'Làm đẹp và phuc hồi', '', '', '', ''),
(49, 1, 'Làm đẹp và phuc hồi', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_dieutri_category_to_layout`
--

CREATE TABLE `wbc_dieutri_category_to_layout` (
  `dieutri_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_dieutri_category_to_store`
--

CREATE TABLE `wbc_dieutri_category_to_store` (
  `dieutri_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `wbc_dieutri_category_to_store`
--

INSERT INTO `wbc_dieutri_category_to_store` (`dieutri_category_id`, `store_id`) VALUES
(49, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_dieutri_comment`
--

CREATE TABLE `wbc_dieutri_comment` (
  `dieutri_comment_id` int(11) NOT NULL,
  `dieutri_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date_added` datetime DEFAULT '0000-00-00 00:00:00',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_dieutri_description`
--

CREATE TABLE `wbc_dieutri_description` (
  `dieutri_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  `page_title` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `short_description` text COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `tags` varchar(255) COLLATE utf8_bin NOT NULL,
  `beforeafter` text COLLATE utf8_bin NOT NULL,
  `faq` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `wbc_dieutri_description`
--

INSERT INTO `wbc_dieutri_description` (`dieutri_id`, `language_id`, `title`, `page_title`, `meta_keyword`, `meta_description`, `short_description`, `description`, `tags`, `beforeafter`, `faq`) VALUES
(16, 2, 'Điều trị sẹo rỗ', 'Điều trị sẹo rỗ', '', '', '', '', '', '', '&lt;p&gt;FAQs&lt;/p&gt;\r\n'),
(16, 1, 'Điều trị sẹo rỗ', 'Điều trị sẹo rỗ', '', '', '', '', '', '', ''),
(17, 2, 'Điều trị sẹo vết thương hở', 'Điều trị sẹo vết thương hở', '', '', '', '', '', '', ''),
(17, 1, 'Điều trị sẹo vết thương hở', 'Điều trị sẹo vết thương hở', '', '', '', '', '', '', ''),
(18, 2, 'Căng da mặt', 'Căng da mặt', '', '', '', '', '', '', ''),
(18, 1, 'Căng da mặt', 'Căng da mặt', '', '', '', '', '', '', ''),
(19, 2, 'Điều trị sẹo vết thương hở', 'Điều trị sẹo vết thương hở', '', '', '&lt;p&gt;Sự kết hợp 2 công nghệ điều trị sẹo rỗ, tái tạo da tiên tiến bậc nhất hiện nay: Laser CO2 Fractional và Tế bào tự thân PRP sẽ mang đến hiệu quả điều trị vượt trội, làm căng phẳng vùng da sẹo rỗ nhanh chóng, giúp làn da trở nên mịn màng, sáng khỏe như mong ước.&lt;/p&gt;\r\n', '&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://grassroots.dev/image/catalog/dieutri/img1.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sự kết hợp 2 công nghệ điều trị sẹo rỗ, tái tạo da tiên tiến bậc nhất hiện nay: Laser CO2 Fractional và Tế bào tự thân PRP sẽ mang đến hiệu quả điều trị vượt trội, làm căng phẳng vùng da sẹo rỗ nhanh chóng, giúp làn da trở nên mịn màng, sáng khỏe như mong ước.&lt;/p&gt;\r\n', '', '', '&lt;p&gt;Sự kết hợp 2 công nghệ điều trị sẹo rỗ, tái tạo da tiên tiến bậc nhất hiện nay: Laser CO2 Fractional và Tế bào tự thân PRP sẽ mang đến hiệu quả điều trị vượt trội, làm căng phẳng vùng da sẹo rỗ nhanh chóng, giúp làn da trở nên mịn màng, sáng khỏe như mong ước.&lt;/p&gt;\r\n'),
(19, 1, 'Điều trị sẹo vết thương hở', 'Điều trị sẹo vết thương hở', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_dieutri_product`
--

CREATE TABLE `wbc_dieutri_product` (
  `dieutri_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_dieutri_product`
--

INSERT INTO `wbc_dieutri_product` (`dieutri_id`, `product_id`) VALUES
(19, 28),
(19, 41);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_dieutri_related`
--

CREATE TABLE `wbc_dieutri_related` (
  `parent_dieutri_id` int(11) NOT NULL DEFAULT '0',
  `child_dieutri_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wbc_dieutri_related`
--

INSERT INTO `wbc_dieutri_related` (`parent_dieutri_id`, `child_dieutri_id`) VALUES
(19, 16),
(19, 18),
(19, 19),
(19, 17);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_dieutri_to_category`
--

CREATE TABLE `wbc_dieutri_to_category` (
  `dieutri_id` int(11) NOT NULL,
  `dieutri_category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `wbc_dieutri_to_category`
--

INSERT INTO `wbc_dieutri_to_category` (`dieutri_id`, `dieutri_category_id`) VALUES
(16, 49),
(17, 49),
(18, 49),
(19, 49);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_dieutri_to_layout`
--

CREATE TABLE `wbc_dieutri_to_layout` (
  `dieutri_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `wbc_dieutri_to_layout`
--

INSERT INTO `wbc_dieutri_to_layout` (`dieutri_id`, `store_id`, `layout_id`) VALUES
(17, 0, 0),
(18, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_dieutri_to_store`
--

CREATE TABLE `wbc_dieutri_to_store` (
  `dieutri_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wbc_dieutri_to_store`
--

INSERT INTO `wbc_dieutri_to_store` (`dieutri_id`, `store_id`) VALUES
(16, 0),
(17, 0),
(18, 0),
(19, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_download`
--

CREATE TABLE `wbc_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_download_description`
--

CREATE TABLE `wbc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_event`
--

CREATE TABLE `wbc_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_event`
--

INSERT INTO `wbc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `date_added`) VALUES
(1, 'voucher', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/total/voucher/send', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_extension`
--

CREATE TABLE `wbc_extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_extension`
--

INSERT INTO `wbc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(123, 'module', 'dieutri_latest'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(122, 'module', 'complete_seo'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(86, 'module', 'so_page_builder'),
(20, 'theme', 'theme_default'),
(21, 'dashboard', 'activity'),
(22, 'dashboard', 'sale'),
(23, 'dashboard', 'recent'),
(24, 'dashboard', 'order'),
(25, 'dashboard', 'online'),
(26, 'dashboard', 'map'),
(27, 'dashboard', 'customer'),
(28, 'dashboard', 'chart'),
(119, 'module', 'pim'),
(100, 'module', 'so_instagram_gallery'),
(101, 'module', 'so_html_content'),
(102, 'module', 'so_extra_slider'),
(103, 'module', 'so_deals'),
(104, 'module', 'so_category_slider'),
(105, 'module', 'so_basic_products'),
(107, 'module', 'so_newletter_custom_popup'),
(108, 'module', 'so_popular_tags'),
(109, 'module', 'so_quickview'),
(110, 'module', 'so_searchpro'),
(98, 'module', 'so_listing_tabs'),
(99, 'module', 'so_latest_blog'),
(97, 'module', 'so_megamenu'),
(70, 'module', 'soconfig'),
(118, 'module', 'revslideropencart'),
(111, 'module', 'so_sociallogin'),
(115, 'module', 'currency_switch'),
(112, 'module', 'so_super_category'),
(64, 'module', 'banner'),
(121, 'module', 'ckeditorfull'),
(120, 'module', 'revslideroutput'),
(114, 'module', 'bestseller'),
(116, 'module', 'language_switch'),
(117, 'module', 'content_info'),
(124, 'module', 'soconfig_mobile'),
(125, 'module', 'blog_latest'),
(126, 'module', 'admin_quick_edit'),
(127, 'module', 'category'),
(128, 'module', 'manufacturer'),
(133, 'module', 'pageform'),
(132, 'module', 'so_filter_shop_by'),
(134, 'module', 'recruit_category');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_filter`
--

CREATE TABLE `wbc_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_filter_description`
--

CREATE TABLE `wbc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_filter_group`
--

CREATE TABLE `wbc_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_filter_group_description`
--

CREATE TABLE `wbc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_geo_zone`
--

CREATE TABLE `wbc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_geo_zone`
--

INSERT INTO `wbc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_information`
--

CREATE TABLE `wbc_information` (
  `information_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_information`
--

INSERT INTO `wbc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_information_description`
--

CREATE TABLE `wbc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_keyword` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  `seo_h2` varchar(255) NOT NULL,
  `seo_h3` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_information_description`
--

INSERT INTO `wbc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`, `seo_keyword`, `seo_h1`, `seo_h2`, `seo_h3`) VALUES
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions', '', '', 'terms', '', '', ''),
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Privacy Policy', '', '', 'privacy', '', '', ''),
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information', '', '', 'delivery', '', '', ''),
(5, 2, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions', '', '', 'terms', '', '', ''),
(3, 2, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Privacy Policy', '', '', 'privacy', '', '', ''),
(6, 2, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information', '', '', 'delivery', '', '', ''),
(4, 2, 'Giới thiệu', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'Giới thiệu', 'Giới thiệu - [module_pagebuilder id=&quot;328&quot; /]', 'giới thiệu [module_pagebuilder id=&quot;328&quot; /]', 'gioi-thieu', 'Giới thiệu', 'Giới thiệu', 'Giới thiệu'),
(4, 1, 'About Us', '&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', 'About Us', 'About Us - About Us', 'About Us About Us', 'about_us', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_information_to_layout`
--

CREATE TABLE `wbc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_information_to_layout`
--

INSERT INTO `wbc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(4, 0, 35);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_information_to_store`
--

CREATE TABLE `wbc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_information_to_store`
--

INSERT INTO `wbc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_language`
--

CREATE TABLE `wbc_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_language`
--

INSERT INTO `wbc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'English', 'en-gb', 'en-US,en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 2, 1),
(2, 'Vietnamese', 'vi-vn', 'vi_VN.UTF-8,vi_VN,vietnamese', '', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_layout`
--

CREATE TABLE `wbc_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_layout`
--

INSERT INTO `wbc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(36, 'Mega Filter PRO'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search'),
(32, 'Mobile - Home 1 '),
(33, 'Blog'),
(34, 'Dieutri'),
(35, 'abouts'),
(38, 'Hệ thống đại lý'),
(39, 'Recruit');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_layout_module`
--

CREATE TABLE `wbc_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_layout_module`
--

INSERT INTO `wbc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(6188, 4, 'so_searchpro.329', 'header_block2', 2),
(6189, 4, 'so_megamenu.325', 'header_block2', 3),
(6190, 4, 'so_megamenu.326', 'content_menu', 0),
(6191, 4, 'so_page_builder.327', 'footerbottom', 0),
(6192, 1, 'so_page_builder.328', 'content_top', 0),
(6193, 32, 'so_page_builder.24', 'content_mobile', 1),
(6197, 35, 'so_page_builder.339', 'content_top', 0),
(6220, 3, 'category', 'column_left', 0),
(6221, 3, 'manufacturer', 'column_left', 1),
(6230, 33, 'blog_latest.344', 'column_right', 0),
(6227, 38, 'pageform.341', 'content_top', 0),
(6228, 38, 'pageform.342', 'content_bottom', 0),
(6229, 34, 'pageform.343', 'content_bottom', 0),
(6187, 4, 'language_switch', 'header_block2', 1),
(6186, 4, 'content_info.330', 'header_block1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_layout_route`
--

CREATE TABLE `wbc_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_layout_route`
--

INSERT INTO `wbc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(77, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(76, 4, 0, ''),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search'),
(80, 32, 0, 'mobile/home'),
(108, 33, 0, 'blog/blog'),
(97, 3, 0, 'product/category'),
(96, 3, 0, 'product/manufacturer/info'),
(88, 36, 0, 'module/mega_filter/results'),
(105, 38, 0, 'information/location'),
(107, 34, 0, 'dieutri/dieutri'),
(111, 39, 0, 'recruit/%');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_length_class`
--

CREATE TABLE `wbc_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_length_class`
--

INSERT INTO `wbc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_length_class_description`
--

CREATE TABLE `wbc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_length_class_description`
--

INSERT INTO `wbc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in'),
(1, 2, 'Centimeter', 'cm'),
(2, 2, 'Millimeter', 'mm'),
(3, 2, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_location`
--

CREATE TABLE `wbc_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_location`
--

INSERT INTO `wbc_location` (`location_id`, `name`, `address`, `telephone`, `fax`, `geocode`, `image`, `open`, `comment`, `country_id`, `zone_id`, `manufacturer_id`) VALUES
(1, 'Công ty TNHH Webico', '196/3 Cộng Hòa Phường 12, Tân Bình, Hồ Chí Minh, Việt Nam', '0987654321', '1234567890', '10.80231133915796, 106.650880239', 'catalog/logo.png', '8h30 - 17h00', 'Ghi chúGhi chúGhi chúGhi chú', 79, 783, 1),
(2, 'Công ty TNHH ABC', 'Hẻm 638/26 Lê Trọng Tấn Bình Hưng Hòa, Bình Tân, Hồ Chí Minh', '0987654321', '1234567890', '10.814076629049849, 106.60801857', 'catalog/logo-toto.png', '10H sáng – 10H tối hàng ngày', 'sa dsadsa', 79, 777, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_manufacturer`
--

CREATE TABLE `wbc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_manufacturer`
--

INSERT INTO `wbc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/manufacturer/brand-4.png', 0),
(6, 'Palm', 'catalog/demo/manufacturer/brand-6.png', 0),
(7, 'Hewlett-Packard', 'catalog/demo/manufacturer/brand-3.png', 0),
(8, 'Apple', 'catalog/demo/manufacturer/brand-4.png', 0),
(9, 'Canon', 'catalog/demo/manufacturer/brand-2.png', 0),
(10, 'Sony', 'catalog/demo/manufacturer/brand-5.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_manufacturer_description`
--

CREATE TABLE `wbc_manufacturer_description` (
  `manufacturer_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_manufacturer_description`
--

INSERT INTO `wbc_manufacturer_description` (`manufacturer_id`, `language_id`, `description`) VALUES
(8, 2, 'Cùng với sự chăm sóc thẩm mỹ nhẹ nhàng, cùng với khả năng, kinh nghiệm và sự thành công về mặt lâm sàng của một công ty thẩm mỹ y khoa, Alma Beauty là về việc quảng bá và duy trì vẻ đẹp tự nhiên thật sự.'),
(8, 1, 'Cùng với sự chăm sóc thẩm mỹ nhẹ nhàng, cùng với khả năng, kinh nghiệm và sự thành công về mặt lâm sàng của một công ty thẩm mỹ y khoa, Alma Beauty là về việc quảng bá và duy trì vẻ đẹp tự nhiên thật sự.'),
(9, 2, ''),
(9, 1, ''),
(7, 2, ''),
(7, 1, ''),
(5, 2, ''),
(5, 1, ''),
(6, 2, ''),
(6, 1, ''),
(10, 2, ''),
(10, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_manufacturer_to_store`
--

CREATE TABLE `wbc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_manufacturer_to_store`
--

INSERT INTO `wbc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_marketing`
--

CREATE TABLE `wbc_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_mega_menu`
--

CREATE TABLE `wbc_mega_menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL,
  `rang` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL DEFAULT '',
  `name` text,
  `type_link` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `link` text,
  `description` text,
  `new_window` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `submenu_width` text,
  `submenu_type` int(11) NOT NULL DEFAULT '0',
  `content_width` int(11) NOT NULL DEFAULT '12',
  `content_type` int(11) NOT NULL DEFAULT '0',
  `content` text,
  `label_item` varchar(255) NOT NULL DEFAULT '',
  `icon_font` varchar(255) NOT NULL DEFAULT '',
  `class_menu` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_mega_menu`
--

INSERT INTO `wbc_mega_menu` (`id`, `parent_id`, `rang`, `icon`, `name`, `type_link`, `module_id`, `link`, `description`, `new_window`, `status`, `position`, `submenu_width`, `submenu_type`, `content_width`, `content_type`, `content`, `label_item`, `icon_font`, `class_menu`) VALUES
(90, 89, 1, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:16:\"Responsive theme\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:183:\"&lt;b&gt;Notice&lt;/b&gt;: Undefined index: url in &lt;b&gt;F:xampphtdocsytc_extensionsopencartadminview	emplatemoduleso_megamenu.tpl&lt;/b&gt; on line &lt;b&gt;123&lt;/b&gt;\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 3, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:690:\"&lt;h3 style=&quot;margin: 10px 0px; font-family: \'Open Sans\'; font-weight: 600; line-height: 24px; color: rgb(78, 205, 196); text-rendering: optimizelegibility; font-size: 24px;&quot;&gt;Responsive Theme for you!&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;margin: 0px 0px 10px; color: rgb(102, 114, 128); font-family: \'Open Sans\'; font-size: 13px; line-height: 20px; padding: 15px 0px 0px 0px;&quot;&gt;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries&lt;/p&gt;\r\n\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', 'hot', 'fa fa-camera-retro', NULL),
(91, 89, 2, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:16:\"Categories hover\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:183:\"&lt;b&gt;Notice&lt;/b&gt;: Undefined index: url in &lt;b&gt;F:xampphtdocsytc_extensionsopencartadminview	emplatemoduleso_megamenu.tpl&lt;/b&gt; on line &lt;b&gt;123&lt;/b&gt;\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 3, 2, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:16:{i:0;a:2:{s:4:\"name\";s:10:\"Components\";s:2:\"id\";i:25;}i:1;a:2:{s:4:\"name\";s:14:\"Desktops > Mac\";s:2:\"id\";i:27;}i:2;a:2:{s:4:\"name\";s:26:\"Laptops & Notebooks > Macs\";s:2:\"id\";i:46;}i:3;a:2:{s:4:\"name\";s:11:\"MP3 Players\";s:2:\"id\";i:34;}i:4;a:2:{s:4:\"name\";s:21:\"Components > Printers\";s:2:\"id\";i:30;}i:5;a:2:{s:4:\"name\";s:21:\"Components > Scanners\";s:2:\"id\";i:31;}i:6;a:2:{s:4:\"name\";s:24:\"Components > Web Cameras\";s:2:\"id\";i:32;}i:7;a:2:{s:4:\"name\";s:8:\"Software\";s:2:\"id\";i:17;}i:8;a:2:{s:4:\"name\";s:7:\"Cameras\";s:2:\"id\";i:33;}i:9;a:2:{s:4:\"name\";s:13:\"Desktops > PC\";s:2:\"id\";i:26;}i:10;a:2:{s:4:\"name\";s:13:\"Phones & PDAs\";s:2:\"id\";i:24;}i:11;a:2:{s:4:\"name\";s:19:\"Laptops & Notebooks\";s:2:\"id\";i:18;}i:12;a:2:{s:4:\"name\";s:21:\"Components > Monitors\";s:2:\"id\";i:28;}i:13;a:2:{s:4:\"name\";s:8:\"Desktops\";s:2:\"id\";i:20;}i:14;a:2:{s:4:\"name\";s:42:\"Components  >  Monitors  >  test 1\";s:2:\"id\";i:35;}i:15;a:2:{s:4:\"name\";s:8:\"Software\";s:2:\"id\";i:17;}}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', 'hot', 'fa fa-camera-retro', NULL),
(92, 89, 3, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:18:\"Categories visible\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 6, 2, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:4:{i:0;a:3:{s:4:\"name\";s:14:\"Desktops > Mac\";s:2:\"id\";i:27;s:8:\"children\";a:5:{i:0;a:2:{s:4:\"name\";s:26:\"Laptops & Notebooks > Macs\";s:2:\"id\";i:46;}i:1;a:2:{s:4:\"name\";s:21:\"Components > Printers\";s:2:\"id\";i:30;}i:2;a:2:{s:4:\"name\";s:13:\"Phones & PDAs\";s:2:\"id\";i:24;}i:3;a:2:{s:4:\"name\";s:30:\"Components > Monitors > test 2\";s:2:\"id\";i:36;}i:4;a:2:{s:4:\"name\";s:21:\"MP3 Players > test 17\";s:2:\"id\";i:49;}}}i:1;a:3:{s:4:\"name\";s:30:\"Components > Monitors > test 1\";s:2:\"id\";i:35;s:8:\"children\";a:5:{i:0;a:2:{s:4:\"name\";s:21:\"MP3 Players > test 11\";s:2:\"id\";i:43;}i:1;a:2:{s:4:\"name\";s:21:\"MP3 Players > test 12\";s:2:\"id\";i:44;}i:2;a:2:{s:4:\"name\";s:21:\"MP3 Players > test 20\";s:2:\"id\";i:52;}i:3;a:2:{s:4:\"name\";s:19:\"Laptops & Notebooks\";s:2:\"id\";i:18;}i:4;a:2:{s:4:\"name\";s:21:\"Components > Scanners\";s:2:\"id\";i:31;}}}i:2;a:3:{s:4:\"name\";s:8:\"Software\";s:2:\"id\";i:17;s:8:\"children\";a:5:{i:0;a:2:{s:4:\"name\";s:26:\"Laptops & Notebooks > Macs\";s:2:\"id\";i:46;}i:1;a:2:{s:4:\"name\";s:11:\"MP3 Players\";s:2:\"id\";i:34;}i:2;a:2:{s:4:\"name\";s:14:\"Desktops > Mac\";s:2:\"id\";i:27;}i:3;a:2:{s:4:\"name\";s:32:\"Components > Mice and Trackballs\";s:2:\"id\";i:29;}i:4;a:2:{s:4:\"name\";s:21:\"Components > Monitors\";s:2:\"id\";i:28;}}}i:3;a:3:{s:4:\"name\";s:13:\"Phones & PDAs\";s:2:\"id\";i:24;s:8:\"children\";a:5:{i:0;a:2:{s:4:\"name\";s:21:\"Components > Printers\";s:2:\"id\";i:30;}i:1;a:2:{s:4:\"name\";s:13:\"Desktops > PC\";s:2:\"id\";i:26;}i:2;a:2:{s:4:\"name\";s:20:\"MP3 Players > test 8\";s:2:\"id\";i:41;}i:3;a:2:{s:4:\"name\";s:20:\"MP3 Players > test 7\";s:2:\"id\";i:40;}i:4;a:2:{s:4:\"name\";s:20:\"MP3 Players > test 6\";s:2:\"id\";i:39;}}}}s:7:\"columns\";s:1:\"2\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}', 'hot', 'fa fa-camera-retro', NULL),
(94, 0, 4, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:7:\"Product\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 3, 1, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:2:\"42\";s:4:\"name\";s:21:\"Apple Cinema 30&quot;\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', 'hot', 'fa fa-car', NULL),
(95, 94, 6, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:7:\"Product\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 3, 1, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:2:\"44\";s:4:\"name\";s:11:\"MacBook Air\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', 'hot', 'fa fa-camera-retro', NULL),
(96, 94, 8, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:7:\"Product\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 3, 1, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:2:\"46\";s:4:\"name\";s:9:\"Sony VAIO\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', 'hot', 'fa fa-camera-retro', NULL),
(97, 94, 5, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:7:\"Product\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 3, 1, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:2:\"29\";s:4:\"name\";s:13:\"Palm Treo Pro\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', 'hot', 'fa fa-camera-retro', NULL),
(98, 94, 9, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:12:\"Manufacturer\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 3, 3, 'a:7:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:11:\"manufacture\";a:2:{s:4:\"name\";a:2:{i:0;s:15:\"Hewlett-Packard\";i:1;s:4:\"Palm\";}s:2:\"id\";a:2:{i:0;s:1:\"7\";i:1;s:1:\"6\";}}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', 'hot', 'fa fa-camera-retro', NULL),
(100, 0, 12, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:10:\"Categories\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 4, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', 'fa fa-taxi', NULL),
(102, 0, 17, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:4:\"Blog\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 4, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', 'fa fa-camera-retro', NULL),
(103, 100, 16, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:12:\"Manufacturer\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 12, 3, 'a:7:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:11:\"manufacture\";a:2:{s:4:\"name\";a:5:{i:0;s:5:\"Apple\";i:1;s:5:\"Canon\";i:2;s:3:\"HTC\";i:3;s:4:\"Palm\";i:4;s:15:\"Hewlett-Packard\";}s:2:\"id\";a:5:{i:0;s:1:\"8\";i:1;s:1:\"9\";i:2;s:1:\"5\";i:3;s:1:\"6\";i:4;s:1:\"7\";}}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', 'hot', 'fa fa-camera-retro', NULL),
(115, 114, 25, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:7:\"Macbook\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 3, 4, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:21:\"catalog/demo/hp_1.jpg\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', NULL),
(84, 0, 18, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:14:\"Buy this theme\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 1, '80%', 1, 4, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:5:\"adfdf\";i:3;s:8:\"ádfasdf\";i:4;s:8:\"ádfadsf\";i:2;s:11:\"adfdasfadsf\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', 'fa fa-camera-retro', NULL),
(85, 84, 19, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:6:\"Item 1\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 3, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:955:\"&lt;h3 style=&quot;margin: 10px 0px; font-family: \'Open Sans\'; font-weight: 600; line-height: 24px; color: rgb(78, 205, 196); text-rendering: optimizelegibility; font-size: 24px;&quot;&gt;Responsive Theme for you!&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;margin: 0px 0px 10px; color: rgb(102, 114, 128); font-family: \'Open Sans\'; font-size: 13px; line-height: 20px; padding: 15px 0px 27px;&quot;&gt;Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a href=&quot;http://localhost:8888/HTML/vitalia/#&quot; style=&quot;text-decoration: none; color: rgb(255, 102, 102); line-height: 1.6; font-family: \'Open Sans\'; font-size: 14px; font-weight: 600;&quot;&gt;Buy this Open Cart theme&lt;/a&gt;&lt;/p&gt;\r\n\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', 'hot', 'fa fa-camera-retro', NULL),
(86, 84, 20, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:6:\"Item 2\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 3, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:1048:\"&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;image/no_image.png&quot; style=&quot;height: 119px;width:253px; max-width: 100%; vertical-align: middle; border: 0px; color: rgb(102, 114, 128); font-family: \'Open Sans\'; font-size: 13px; line-height: 20px;&quot;&gt;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px; font-family: \'Open Sans\'; font-weight: 600; line-height: 30px; color: rgb(102, 114, 128); text-rendering: optimizelegibility; font-size: 20px; padding: 17px 0px 7px;&quot;&gt;50+ CMS blocks&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;margin: 0px 0px 10px; color: rgb(102, 114, 128); font-family: \'Open Sans\'; font-size: 13px; line-height: 20px; padding-bottom: 10px;&quot;&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a href=&quot;#&quot; style=&quot;text-decoration: none; color: rgb(102, 114, 128); line-height: 20px; font-family: \'Open Sans\'; font-size: 13px; font-weight: 600;&quot;&gt;See all features&lt;/a&gt;&lt;/p&gt;\r\n\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', 'hot', 'fa fa-camera-retro', NULL),
(87, 84, 21, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:6:\"Item 3\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 3, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:1053:\"&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;image/no_image.png&quot; style=&quot;height: 119px;width:253px; max-width: 100%; vertical-align: middle; border: 0px; color: rgb(102, 114, 128); font-family: \'Open Sans\'; font-size: 13px; line-height: 20px;&quot;&gt;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px; font-family: \'Open Sans\'; font-weight: 600; line-height: 30px; color: rgb(102, 114, 128); text-rendering: optimizelegibility; font-size: 20px; padding: 17px 0px 7px;&quot;&gt;Super documentation&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;margin: 0px 0px 10px; color: rgb(102, 114, 128); font-family: \'Open Sans\'; font-size: 13px; line-height: 20px; padding-bottom: 10px;&quot;&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a href=&quot;#&quot; style=&quot;text-decoration: none; color: rgb(102, 114, 128); line-height: 20px; font-family: \'Open Sans\'; font-size: 13px; font-weight: 600;&quot;&gt;See all features&lt;/a&gt;&lt;/p&gt;\r\n\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', 'hot', 'fa fa-camera-retro', NULL),
(88, 84, 22, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:6:\"Item 4\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 3, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:1051:\"&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;image/no_image.png&quot; style=&quot;height: 119px;width:253px; max-width: 100%; vertical-align: middle; border: 0px; color: rgb(102, 114, 128); font-family: \'Open Sans\'; font-size: 13px; line-height: 20px;&quot;&gt;&lt;/p&gt;\r\n\r\n&lt;h3 style=&quot;margin: 0px; font-family: \'Open Sans\'; font-weight: 600; line-height: 30px; color: rgb(102, 114, 128); text-rendering: optimizelegibility; font-size: 20px; padding: 17px 0px 7px;&quot;&gt;Easy to customize&lt;/h3&gt;\r\n\r\n&lt;p style=&quot;margin: 0px 0px 10px; color: rgb(102, 114, 128); font-family: \'Open Sans\'; font-size: 13px; line-height: 20px; padding-bottom: 10px;&quot;&gt;Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a href=&quot;#&quot; style=&quot;text-decoration: none; color: rgb(102, 114, 128); line-height: 20px; font-family: \'Open Sans\'; font-size: 13px; font-weight: 600;&quot;&gt;See all features&lt;/a&gt;&lt;/p&gt;\r\n\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', 'hot', 'fa fa-camera-retro', NULL),
(99, 0, 10, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:5:\"Women\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '25%', 0, 4, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', 'fa fa-rocket', NULL),
(89, 0, 0, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:3:\"Men\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 4, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', 'fa fa-camera-retro', NULL),
(104, 100, 15, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:7:\"Product\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 3, 1, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:2:\"45\";s:4:\"name\";s:11:\"MacBook Pro\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', 'hot', 'fa fa-camera-retro', NULL),
(105, 100, 14, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:18:\"Categories visible\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 3, 2, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:2:{i:0;a:3:{s:4:\"name\";s:13:\"Phones & PDAs\";s:2:\"id\";i:24;s:8:\"children\";a:6:{i:0;a:2:{s:4:\"name\";s:13:\"Desktops > PC\";s:2:\"id\";i:26;}i:1;a:2:{s:4:\"name\";s:13:\"Phones & PDAs\";s:2:\"id\";i:24;}i:2;a:2:{s:4:\"name\";s:11:\"MP3 Players\";s:2:\"id\";i:34;}i:3;a:2:{s:4:\"name\";s:26:\"Laptops & Notebooks > Macs\";s:2:\"id\";i:46;}i:4;a:2:{s:4:\"name\";s:14:\"Desktops > Mac\";s:2:\"id\";i:27;}i:5;a:2:{s:4:\"name\";s:13:\"Phones & PDAs\";s:2:\"id\";i:24;}}}i:1;a:3:{s:4:\"name\";s:32:\"Components > Mice and Trackballs\";s:2:\"id\";i:29;s:8:\"children\";a:5:{i:0;a:2:{s:4:\"name\";s:21:\"Components > Monitors\";s:2:\"id\";i:28;}i:1;a:2:{s:4:\"name\";s:30:\"Components > Monitors > test 1\";s:2:\"id\";i:35;}i:2;a:2:{s:4:\"name\";s:8:\"Software\";s:2:\"id\";i:17;}i:3;a:2:{s:4:\"name\";s:21:\"Components > Scanners\";s:2:\"id\";i:31;}i:4;a:2:{s:4:\"name\";s:10:\"Components\";s:2:\"id\";i:25;}}}}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"1\";}}', 'hot', 'fa fa-camera-retro', NULL),
(106, 100, 13, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:18:\"Categories visible\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 6, 2, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:2:{i:0;a:3:{s:4:\"name\";s:32:\"Components > Mice and Trackballs\";s:2:\"id\";i:29;s:8:\"children\";a:15:{i:0;a:2:{s:4:\"name\";s:21:\"Components > Monitors\";s:2:\"id\";i:28;}i:1;a:2:{s:4:\"name\";s:14:\"Desktops > Mac\";s:2:\"id\";i:27;}i:2;a:2:{s:4:\"name\";s:26:\"Laptops & Notebooks > Macs\";s:2:\"id\";i:46;}i:3;a:2:{s:4:\"name\";s:11:\"MP3 Players\";s:2:\"id\";i:34;}i:4;a:2:{s:4:\"name\";s:30:\"Components > Monitors > test 1\";s:2:\"id\";i:35;}i:5;a:2:{s:4:\"name\";s:30:\"Components > Monitors > test 2\";s:2:\"id\";i:36;}i:6;a:2:{s:4:\"name\";s:20:\"MP3 Players > test 8\";s:2:\"id\";i:41;}i:7;a:2:{s:4:\"name\";s:20:\"MP3 Players > test 6\";s:2:\"id\";i:39;}i:8;a:2:{s:4:\"name\";s:20:\"MP3 Players > test 5\";s:2:\"id\";i:37;}i:9;a:2:{s:4:\"name\";s:20:\"MP3 Players > test 4\";s:2:\"id\";i:38;}i:10;a:2:{s:4:\"name\";s:21:\"MP3 Players > test 24\";s:2:\"id\";i:56;}i:11;a:2:{s:4:\"name\";s:21:\"MP3 Players > test 23\";s:2:\"id\";i:55;}i:12;a:2:{s:4:\"name\";s:21:\"MP3 Players > test 21\";s:2:\"id\";i:53;}i:13;a:2:{s:4:\"name\";s:10:\"Components\";s:2:\"id\";i:25;}i:14;a:2:{s:4:\"name\";s:7:\"Cameras\";s:2:\"id\";i:33;}}}i:1;a:3:{s:4:\"name\";s:21:\"Components > Printers\";s:2:\"id\";i:30;s:8:\"children\";a:15:{i:0;a:2:{s:4:\"name\";s:13:\"Phones & PDAs\";s:2:\"id\";i:24;}i:1;a:2:{s:4:\"name\";s:13:\"Desktops > PC\";s:2:\"id\";i:26;}i:2;a:2:{s:4:\"name\";s:8:\"Software\";s:2:\"id\";i:17;}i:3;a:2:{s:4:\"name\";s:21:\"Components > Scanners\";s:2:\"id\";i:31;}i:4;a:2:{s:4:\"name\";s:8:\"Desktops\";s:2:\"id\";i:20;}i:5;a:2:{s:4:\"name\";s:19:\"Laptops & Notebooks\";s:2:\"id\";i:18;}i:6;a:2:{s:4:\"name\";s:26:\"Laptops & Notebooks > Macs\";s:2:\"id\";i:46;}i:7;a:2:{s:4:\"name\";s:11:\"MP3 Players\";s:2:\"id\";i:34;}i:8;a:2:{s:4:\"name\";s:32:\"Components > Mice and Trackballs\";s:2:\"id\";i:29;}i:9;a:2:{s:4:\"name\";s:21:\"Components > Monitors\";s:2:\"id\";i:28;}i:10;a:2:{s:4:\"name\";s:14:\"Desktops > Mac\";s:2:\"id\";i:27;}i:11;a:2:{s:4:\"name\";s:8:\"Software\";s:2:\"id\";i:17;}i:12;a:2:{s:4:\"name\";s:21:\"Components > Scanners\";s:2:\"id\";i:31;}i:13;a:2:{s:4:\"name\";s:10:\"Components\";s:2:\"id\";i:25;}i:14;a:2:{s:4:\"name\";s:7:\"Cameras\";s:2:\"id\";i:33;}}}}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"2\";s:15:\"submenu_columns\";s:1:\"3\";}}', 'hot', 'fa fa-camera-retro', NULL),
(107, 99, 11, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:11:\"categories1\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '50%', 0, 12, 2, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:1:{i:0;a:3:{s:4:\"name\";s:10:\"Components\";s:2:\"id\";i:25;s:8:\"children\";a:2:{i:0;a:3:{s:4:\"name\";s:27:\"Components  >  Monitors\";s:2:\"id\";i:28;s:8:\"children\";a:1:{i:0;a:2:{s:4:\"name\";s:10:\"Components\";s:2:\"id\";i:25;}}}i:1;a:3:{s:4:\"name\";s:38:\"Components  >  Mice and Trackballs\";s:2:\"id\";i:29;s:8:\"children\";a:1:{i:0;a:2:{s:4:\"name\";s:27:\"Components  >  Monitors\";s:2:\"id\";i:28;}}}}}}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', NULL),
(116, 114, 26, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:10:\"Television\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 3, 4, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:21:\"catalog/demo/hp_2.jpg\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', NULL),
(117, 114, 27, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:4:\"Ipad\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 3, 4, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:21:\"catalog/demo/hp_3.jpg\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', NULL),
(114, 0, 23, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:5:\"Image\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 4, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', 'fa fa-picture-o', NULL),
(111, 94, 7, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:7:\"Product\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 3, 1, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:2:\"46\";s:4:\"name\";s:9:\"Sony VAIO\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', NULL),
(119, 114, 24, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:6:\"Laptop\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 2, 3, 4, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:21:\"catalog/demo/hp_2.jpg\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', NULL),
(120, 121, 29, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:12:\"Product List\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 12, 6, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:1:\"4\";s:4:\"type\";s:7:\"popular\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"4\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', NULL),
(121, 0, 28, 'http://localhost/ytc_extensions/opencart/image/cache/no_image-100x100.png', 'a:4:{i:1;s:12:\"Product List\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 323, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:4:{i:1;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:2;s:0:\"\";}', 0, 0, 0, '100%', 0, 4, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:4:{i:1;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:3;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:4;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";i:2;s:29:\"&lt;p&gt;&lt;br&gt;&lt;/p&gt;\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:8:{s:8:\"category\";s:0:\"\";s:13:\"limit_level_1\";s:0:\"\";s:13:\"limit_level_2\";s:0:\"\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:0:\"\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', NULL);
INSERT INTO `wbc_mega_menu` (`id`, `parent_id`, `rang`, `icon`, `name`, `type_link`, `module_id`, `link`, `description`, `new_window`, `status`, `position`, `submenu_width`, `submenu_type`, `content_width`, `content_type`, `content`, `label_item`, `icon_font`, `class_menu`) VALUES
(122, 0, 0, 'no_image.png', 'a:2:{i:2;s:9:\"Tin tức\";i:1;s:4:\"News\";}', 0, 325, 'a:2:{s:3:\"url\";s:8:\"/tin-tuc\";s:8:\"category\";s:0:\"\";}', 'a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}', 0, 0, 0, '100%', 0, 4, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', ''),
(123, 0, 1, 'no_image.png', 'a:2:{i:2;s:4:\"Blog\";i:1;s:4:\"Blog\";}', 0, 325, 'a:2:{s:3:\"url\";s:5:\"/blog\";s:8:\"category\";s:0:\"\";}', 'a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}', 0, 0, 0, '100%', 0, 4, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', ''),
(124, 0, 2, 'no_image.png', 'a:2:{i:2;s:14:\"Tuyển dụng\";i:1;s:14:\"Tuyển dụng\";}', 0, 325, 'a:2:{s:3:\"url\";s:11:\"/tuyen-dung\";s:8:\"category\";s:0:\"\";}', 'a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}', 0, 0, 0, '100%', 0, 4, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', ''),
(125, 0, 0, 'no_image.png', 'a:2:{i:2;s:13:\"Điều trị\";i:1;s:13:\"Điều trị\";}', 0, 326, 'a:2:{s:3:\"url\";s:28:\"index.php?route=dieutri/home\";s:8:\"category\";s:0:\"\";}', 'a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}', 0, 0, 0, '100%', 0, 4, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', ''),
(126, 0, 1, 'no_image.png', 'a:2:{i:2;s:12:\"Sản phẩm\";i:1;s:12:\"Sản phẩm\";}', 1, 326, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:2:\"33\";}', 'a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}', 0, 0, 0, '250px', 0, 4, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', ''),
(127, 0, 3, 'no_image.png', 'a:2:{i:2;s:14:\"Giới thiệu\";i:1;s:14:\"Giới thiệu\";}', 0, 326, 'a:2:{s:3:\"url\";s:60:\"index.php?route=information/information&amp;information_id=4\";s:8:\"category\";s:0:\"\";}', 'a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}', 0, 0, 0, '100%', 0, 4, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', ''),
(128, 0, 4, 'no_image.png', 'a:2:{i:2;s:15:\"Thương hiệu\";i:1;s:15:\"Thương hiệu\";}', 0, 326, 'a:2:{s:3:\"url\";s:37:\"/index.php?route=product/manufacturer\";s:8:\"category\";s:0:\"\";}', 'a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}', 0, 0, 0, '100%', 0, 4, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', ''),
(129, 0, 5, 'no_image.png', 'a:2:{i:2;s:18:\"Kênh phân phối\";i:1;s:18:\"Kênh phân phối\";}', 0, 326, 'a:2:{s:3:\"url\";s:16:\"/he-thong-dai-ly\";s:8:\"category\";s:0:\"\";}', 'a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}', 0, 0, 0, '100%', 0, 4, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";s:8:\"category\";s:0:\"\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', ''),
(130, 0, 6, 'no_image.png', 'a:2:{i:2;s:10:\"Liên hệ\";i:1;s:0:\"\";}', 0, 326, 'a:2:{s:3:\"url\";s:35:\"index.php?route=information/contact\";s:8:\"category\";s:0:\"\";}', 'a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}', 0, 0, 0, '100%', 0, 4, 0, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"0\";}s:11:\"subcategory\";a:8:{s:13:\"limit_level_1\";s:1:\"4\";s:13:\"limit_level_2\";s:1:\"4\";s:13:\"limit_level_3\";s:1:\"4\";s:10:\"show_title\";s:1:\"1\";s:10:\"show_image\";s:1:\"1\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', NULL),
(131, 126, 2, 'no_image.png', 'a:2:{i:2;s:3:\"sub\";i:1;s:0:\"\";}', 0, 326, 'a:2:{s:3:\"url\";s:0:\"\";s:8:\"category\";s:0:\"\";}', 'a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}', 0, 0, 0, '100%', 0, 12, 5, 'a:6:{s:4:\"html\";a:1:{s:4:\"text\";a:2:{i:2;s:0:\"\";i:1;s:0:\"\";}}s:7:\"product\";a:2:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:0:\"\";}s:5:\"image\";a:2:{s:4:\"link\";s:12:\"no_image.png\";s:10:\"show_title\";s:1:\"1\";}s:11:\"subcategory\";a:9:{s:8:\"category\";s:17:\"a:1:{i:0;s:0:\"\";}\";s:13:\"limit_level_1\";s:2:\"10\";s:13:\"limit_level_2\";s:2:\"10\";s:13:\"limit_level_3\";s:2:\"10\";s:10:\"show_title\";s:1:\"0\";s:10:\"show_image\";s:1:\"0\";s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}s:11:\"productlist\";a:4:{s:5:\"limit\";s:0:\"\";s:4:\"type\";s:3:\"new\";s:10:\"show_title\";s:1:\"1\";s:3:\"col\";s:1:\"1\";}s:10:\"categories\";a:4:{s:10:\"categories\";a:0:{}s:7:\"columns\";s:1:\"1\";s:7:\"submenu\";s:1:\"1\";s:15:\"submenu_columns\";s:1:\"1\";}}', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_menu`
--

CREATE TABLE `wbc_menu` (
  `menu_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `type` varchar(6) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_menu_description`
--

CREATE TABLE `wbc_menu_description` (
  `menu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_menu_module`
--

CREATE TABLE `wbc_menu_module` (
  `menu_module_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_mfilter_tags`
--

CREATE TABLE `wbc_mfilter_tags` (
  `mfilter_tag_id` int(11) UNSIGNED NOT NULL,
  `tag` char(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_modification`
--

CREATE TABLE `wbc_modification` (
  `modification_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_modification`
--

INSERT INTO `wbc_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(5, 'Installation without FTP settings', 'no_ftp', 'karapuz (support@ka-station.com)', '1.2.0', 'http://www.opencart.com/index.php?route=extension/extension/info&extension_id=19862', '<modification> \n <id></id> \n <name>Installation without FTP settings</name> \n <code>no_ftp</code> \n <version>1.2.0</version> \n <author>karapuz (support@ka-station.com)</author> \n <link>http://www.opencart.com/index.php?route=extension/extension/info&amp;extension_id=19862</link> \n <file path=\"admin/controller/extension/installer.php\">\n <operation>\n <search index=\"0\"><![CDATA[$data[\'button_continue\'] =]]></search>\n <add position=\"after\"><![CDATA[//karapuz (no_ftp.ocmod.xml) \n $data[\'text_upload_without_ftp\'] = $this->language->get(\'text_upload_without_ftp\');\n $data[\'help_upload_without_ftp\'] = $this->language->get(\'help_upload_without_ftp\');\n $data[\'upload_without_ftp\'] = false;\n///karapuz (no_ftp.ocmod.xml) ]]></add>\n </operation>\n <operation>\n <search index=\"0\"><![CDATA[\'extension/installer/ftp\']]></search>\n <add position=\"replace\"><![CDATA[\'extension/installer/file_tp_wrapper\']]></add>\n </operation>\n <operation>\n <search index=\"0\"><![CDATA[function ftp(]]></search>\n <add position=\"before\"><![CDATA[//karapuz (no_ftp.ocmod.xml) \n static public function cpy($source, $dest) {\n if(is_dir($source)) {\n $dir_handle = opendir($source);\n while ($file = readdir($dir_handle)) {\n if ($file != \".\" && $file != \"..\") {\n if (is_dir($source . \"/\" . $file)) {\n if (!is_dir($dest . \"/\" . $file)) {\n mkdir($dest . \"/\" . $file);\n }\n self::cpy($source . \"/\" . $file, $dest . \"/\" . $file);\n } else {\n copy($source . \"/\" . $file, $dest . \"/\" . $file);\n }\n }\n }\n closedir($dir_handle);\n } else {\n copy($source, $dest);\n }\n }\n \n protected function copyUpload() {\n $json = array();\n \n $directory = DIR_UPLOAD . str_replace(array(\'../\', \'..\\\\\', \'..\'), \'\', $this->request->post[\'path\']) . \'/upload/\';\n\n if (!is_dir($directory)) {\n $json[\'error\'] = $this->language->get(\'error_directory\');\n return $json;\n }\n\n self::cpy($directory, dirname(DIR_APPLICATION));\n \n return $json;\n }\n \n /*\n This wrapper is used because some hostings block calls to URLs containing \'/ftp\'. It\n brokes installation process.\n */\n public function file_tp_wrapper() {\n return $this->ftp();\n }\n///karapuz (no_ftp.ocmod.xml) ]]></add>\n </operation>\n <operation>\n <search index=\"0\"><![CDATA[if (!$this->config->get(\'config_ftp_status\')]]></search>\n <add position=\"before\"><![CDATA[//karapuz (no_ftp.ocmod.xml) \n if (!empty($this->request->post[\'upload_without_ftp\'])) {\n $json = $this->copyUpload();\n $this->response->addHeader(\'Content-Type: application/json\');\n $this->response->setOutput(json_encode($json));\n return; \n }\n///karapuz (no_ftp.ocmod.xml) ]]></add>\n </operation>\n </file>\n <file path=\"admin/language/en-gb/extension/installer.php\">\n <operation>\n <search index=\"0\"><![CDATA[$_[\'text_clear\']]]></search>\n <add position=\"after\"><![CDATA[//karapuz (no_ftp.ocmod.xml) \n$_[\'text_upload_without_ftp\'] = \'Upload Without FTP\'; \n$_[\'help_upload_without_ftp\'] = \'When the checkbox is set, files from the archive will be unpacked to the store directory directly without connecting to it through FTP\';\n///karapuz (no_ftp.ocmod.xml) ]]></add>\n </operation>\n </file>\n <file path=\"admin/language/english/extension/installer.php\">\n <operation>\n <search index=\"0\"><![CDATA[$_[\'text_clear\']]]></search>\n <add position=\"after\"><![CDATA[//karapuz (no_ftp.ocmod.xml) \n$_[\'text_upload_without_ftp\'] = \'Upload Without FTP\';\n$_[\'help_upload_without_ftp\'] = \'When the checkbox is set, files from the archive will be unpacked to the store directory directly without connecting to it through FTP\';\n///karapuz (no_ftp.ocmod.xml) ]]></add>\n </operation>\n </file>\n <file path=\"admin/view/template/extension/installer.tpl\">\n <operation>\n <search index=\"0\"><![CDATA[<form class=\"form]]></search>\n <add position=\"after\"><![CDATA[<?php /* //karapuz (no_ftp.ocmod.xml) */?>\n <div class=\"form-group\">\n <label class=\"col-sm-2 control-label\" for=\"input-upload_without_ftp\"><span data-toggle=\"tooltip\" title=\"<?php echo $help_upload_without_ftp; ?>\"><?php echo $text_upload_without_ftp; ?></span></label>\n <div class=\"col-sm-10\">\n <div class=\"checkbox\">\n <label>\n <?php if ($upload_without_ftp) { ?>\n <input type=\"checkbox\" name=\"upload_without_ftp\" value=\"1\" checked=\"checked\" id=\"input-upload_without_ftp\" />\n <?php } else { ?>\n <input type=\"checkbox\" name=\"upload_without_ftp\" value=\"1\" id=\"input-upload_without_ftp\" />\n <?php } ?>\n &nbsp; </label>\n </div>\n </div>\n </div>\n<?php /* ///karapuz (no_ftp.ocmod.xml) */?>]]></add>\n </operation>\n <operation>\n <search index=\"0\"><![CDATA[timer = setInterval(]]></search>\n <add position=\"before\"><![CDATA[<?php /* //karapuz (no_ftp.ocmod.xml) */?>\n if (typeof(timer) != \'undefined\' && timer) {\n clearInterval(timer); \n }\n<?php /* ///karapuz (no_ftp.ocmod.xml) */?>]]></add>\n </operation>\n <operation>\n <search index=\"0\"><![CDATA[n next()]]></search>\n <add position=\"after\"><![CDATA[<?php /* //karapuz (no_ftp.ocmod.xml) */?>\n var custom_params = \'\';\n if ($(\'#input-upload_without_ftp\').prop(\'checked\')) {\n custom_params = \'&upload_without_ftp=1\';\n }\n<?php /* ///karapuz (no_ftp.ocmod.xml) */?>]]></add>\n </operation>\n <operation>\n <search index=\"0\"><![CDATA[\'path=\' + data.path]]></search>\n <add position=\"replace\"><![CDATA[\'path=\' + data.path + custom_params]]></add>\n </operation>\n </file>\n</modification>', 1, '2017-04-12 09:34:18'),
(2, 'So Social Login', 'So-Social-Login', 'Smartaddons', '1.0', 'http://www.smartaddons.com/', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<modification>\n <name>So Social Login</name>\n <code>So-Social-Login</code>\n <version>1.0</version>\n <author>Smartaddons</author>\n <link>http://www.smartaddons.com/</link>\n \n <file path=\"catalog/view/theme/*/template/account/login.tpl\">\n <operation error=\"log\">\n <search ><![CDATA[<div class=\"well\">]]></search>\n <add position=\"replace\"><![CDATA[\n <div class=\"well col-sm-12\"> \n ]]></add>\n </operation>\n \n <operation error=\"log\">\n <search ><![CDATA[<input type=\"submit\" value=\"<?php echo $button_login; ?>\" class=\"btn btn-primary\" />]]></search>\n <add position=\"replace\"><![CDATA[\n <input type=\"submit\" value=\"<?php echo $button_login; ?>\" class=\"btn btn-primary pull-left\" /> \n ]]></add>\n </operation>\n \n <operation error=\"log\">\n <search ><![CDATA[</form>]]></search>\n <add position=\"after\"><![CDATA[\n <?php //echo $column_login; ?>\n <?php if ($setting[\'so_sociallogin_status\']) {?>\n <column id=\"column-login\" class=\"col-sm-8 pull-right\">\n <div class=\"row\">\n <?php if (isset($this->session->data[\'warning\'])) { ?>\n <div class=\"alert alert-warning\"><i class=\"fa fa-check-circle\"></i> <?php echo $this->session->data[\'warning\']; ?></div>\n <?php } ?>\n \n <div class=\"social_login pull-right\" id=\"so_sociallogin\">\n <?php if($setting[\'so_sociallogin_fbstatus\']){?>\n <?php if ($setting[\'so_sociallogin_button\'] == \'image\') {?>\n <a class=\"social-icon\" href=\"<?php echo $fblink; ?>\">\n <img class=\"img-responsive\" src=\"<?php echo $fbimage; ?>\" \n data-toggle=\"tooltip\" alt=\"<?php echo $setting[\'so_sociallogin_fbtitle\']; ?>\" \n title=\"<?php echo $setting[\'so_sociallogin_fbtitle\']; ?>\"\n />\n </a>\n <?php }else {?>\n <a href=\"<?php echo $fblink?>\" class=\"btn btn-social-icon btn-sm btn-facebook\"><i class=\"fa fa-facebook fa-fw\" aria-hidden=\"true\"></i></a>\n <?php } ?>\n <?php } ?>\n \n <?php if($setting[\'so_sociallogin_twitstatus\']){?>\n <?php if ($setting[\'so_sociallogin_button\'] == \'image\') {?>\n <a class=\"social-icon\" href=\"<?php echo $twitlink; ?>\">\n <img class=\"img-responsive\" src=\"<?php echo $twitimage; ?>\" \n data-toggle=\"tooltip\" alt=\"<?php echo $setting[\'so_sociallogin_twittertitle\']; ?>\" \n title=\"<?php echo $setting[\'so_sociallogin_twittertitle\']; ?>\"\n />\n </a>\n <?php }else {?>\n <a href=\"<?php echo $twitlink?>\" class=\"btn btn-social-icon btn-sm btn-twitter\"><i class=\"fa fa-twitter fa-fw\" aria-hidden=\"true\"></i></a>\n <?php }?>\n <?php } ?>\n \n <?php if($setting[\'so_sociallogin_googlestatus\']){?>\n <?php if ($setting[\'so_sociallogin_button\'] == \'image\') {?>\n <a class=\"social-icon\" href=\"<?php echo $googlelink; ?>\">\n <img class=\"img-responsive\" src=\"<?php echo $googleimage; ?>\" \n data-toggle=\"tooltip\" alt=\"<?php echo $setting[\'so_sociallogin_googletitle\']; ?>\" \n title=\"<?php echo $setting[\'so_sociallogin_googletitle\']; ?>\" \n />\n </a>\n <?php }else {?>\n <a href=\"<?php echo $googlelink?>\" class=\"btn btn-social-icon btn-sm btn-google-plus\"><i class=\"fa fa-google fa-fw\" aria-hidden=\"true\"></i></a>\n <?php }?>\n <?php } ?>\n \n <?php if($setting[\'so_sociallogin_linkstatus\']){?>\n <?php if ($setting[\'so_sociallogin_button\'] == \'image\') {?>\n <a class=\"social-icon\" href=\"<?php echo $linkdinlink; ?>\">\n <img class=\"img-responsive\" src=\"<?php echo $linkdinimage; ?>\" \n data-toggle=\"tooltip\" alt=\"<?php echo $setting[\'so_sociallogin_linkedintitle\']; ?>\" \n title=\"<?php echo $setting[\'so_sociallogin_linkedintitle\']; ?>\"\n />\n </a>\n <?php }else {?>\n <a href=\"<?php echo $linkdinlink?>\" class=\"btn btn-social-icon btn-sm btn-linkdin\"><i class=\"fa fa-linkedin fa-fw\" aria-hidden=\"true\"></i></a>\n <?php }?>\n <?php } ?>\n </div>\n </div>\n </column>\n <?php }?>\n ]]></add>\n </operation>\n \n <operation error=\"log\">\n <search ><![CDATA[<?php echo $footer; ?>]]></search>\n <add position=\"before\"><![CDATA[\n <style>\n @media(max-width:991px){\n #column-login,.social_login,.socalicon{\n float:none !important;\n width:100%;\n }\n .account-login .btn-primary{\n float:none !important;\n }\n .social_login {\n padding:0 10px;\n }\n }\n </style>\n ]]></add>\n </operation>\n </file>\n \n <file path=\"catalog/view/theme/*/template/checkout/login.tpl\">\n <operation error=\"log\">\n <search ><![CDATA[<input type=\"button\" value=\"<?php echo $button_login; ?>\" id=\"button-login\" data-loading-text=\"<?php echo $text_loading; ?>\" class=\"btn btn-primary\" />]]></search>\n <add position=\"replace\"><![CDATA[\n <input type=\"button\" value=\"<?php echo $button_login; ?>\" id=\"button-login\" data-loading-text=\"<?php echo $text_loading; ?>\" class=\"btn btn-primary\" />\n <?php echo $column_login; ?>\n \n ]]></add>\n </operation>\n \n </file>\n \n <file path=\"catalog/controller/checkout/login.php\">\n <operation error=\"log\">\n <search ><![CDATA[$data[\'forgotten\'] = $this->url->link(\'account/forgotten\', \'\', true);]]></search>\n <add position=\"after\"><![CDATA[\n \n /* xml */\n $data[\'column_login\'] = $this->load->controller(\'common/column_login\');\n /* xml */\n ]]></add>\n </operation>\n </file>\n <file path=\"catalog/controller/checkout/checkout.php\">\n <operation error=\"log\">\n <search ><![CDATA[$data[\'forgotten\'] = $this->url->link(\'account/forgotten\', \'\', true);]]></search>\n <add position=\"before\"><![CDATA[\n \n /* xml */\n $data[\'column_login\'] = $this->load->controller(\'common/column_login\');\n /* xml */\n ]]></add>\n </operation>\n </file>\n \n <file path=\"catalog/controller/account/login.php\">\n <operation error=\"log\">\n <search ><![CDATA[$data[\'column_left\'] = $this->load->controller(\'common/column_left\');]]></search>\n <add position=\"after\"><![CDATA[\n /* xml */\n $data[\'column_login\'] = $this->load->controller(\'common/column_login\');\n /* xml */\n ]]></add>\n </operation>\n \n <operation error=\"log\">\n <search ><![CDATA[$data[\'header\'] = $this->load->controller(\'common/header\');]]></search>\n <add position=\"after\"><![CDATA[\n /* xml */\n $this->load->model(\'setting/setting\');\n $this->load->model(\'tool/image\');\n $setting = $this->model_setting_setting->getSetting(\'so_sociallogin\');\n if ($setting) {\n if(isset($this->session->data[\'route\']))\n {\n $location = $this->url->link($this->session->data[\'route\'], \"\", \'SSL\');\n }\n else\n {\n $location = $this->url->link(\"account/account\", \"\", \'SSL\');\n }\n \n /* Facebook Library */\n require_once(DIR_SYSTEM . \'library/so_social/fb/facebook.php\');\n \n /* Facebook Login link code */\n $fbconnect = new Facebook(array(\n \'appId\' => $setting[\'so_sociallogin_fbapikey\'],\n \'secret\' => $setting[\'so_sociallogin_fbsecretapi\'],\n ));\n \n $data[\'fblink\'] = $fbconnect->getLoginUrl(\n array(\n \'scope\' => \'email,user_birthday,user_location,user_hometown\',\n \'redirect_uri\' => $this->url->link(\'extension/module/so_sociallogin/FacebookLogin\', \'\', \'SSL\')\n )\n );\n /* Facebook Login link code */\n \n /* Google Libery file inculde */\n require_once DIR_SYSTEM.\'library/so_social/src/Google_Client.php\';\n require_once DIR_SYSTEM.\'library/so_social/src/contrib/Google_Oauth2Service.php\';\n \n /* Google Login link code */\n $gClient = new Google_Client();\n $gClient->setApplicationName($setting[\'so_sociallogin_googletitle\']);\n $gClient->setClientId($setting[\'so_sociallogin_googleapikey\']);\n $gClient->setClientSecret($setting[\'so_sociallogin_googlesecretapi\']);\n $gClient->setRedirectUri($this->url->link(\'extension/module/so_sociallogin/GoogleLogin\', \'\', \'SSL\'));\n $google_oauthV2 = new Google_Oauth2Service($gClient);\n $data[\'googlelink\'] = $gClient->createAuthUrl();\n \n /* Twitter Login */ \n $data[\'twitlink\'] = $this->url->link(\'extension/module/so_sociallogin/TwitterLogin\', \'\', \'SSL\');\n \n /* Linkedin Login */\n $data[\'linkdinlink\'] = $this->url->link(\'extension/module/so_sociallogin/LinkedinLogin\', \'\', \'SSL\');\n \n /* Get Image */\n $sociallogin_width = 130;\n $sociallogin_height = 35;\n if (isset($setting[\'so_sociallogin_width\']) && is_numeric($setting[\'so_sociallogin_width\'])) {\n $sociallogin_width = $setting[\'so_sociallogin_width\'];\n }\n if (isset($setting[\'so_sociallogin_height\']) && is_numeric($setting[\'so_sociallogin_height\'])) {\n $sociallogin_height = $setting[\'so_sociallogin_height\'];\n }\n if ($setting[\'so_sociallogin_fbimage\']) {\n $fbicon = $this->model_tool_image->resize($setting[\'so_sociallogin_fbimage\'], $sociallogin_width, $sociallogin_height);\n } else {\n $fbicon = $this->model_tool_image->resize(\'placeholder.png\', $sociallogin_width, $sociallogin_height);\n }\n \n if ($setting[\'so_sociallogin_twitimage\']) {\n $twiticon = $this->model_tool_image->resize($setting[\'so_sociallogin_twitimage\'], $sociallogin_width, $sociallogin_height);\n } else {\n $twiticon = $this->model_tool_image->resize(\'placeholder.png\', $sociallogin_width, $sociallogin_height);\n }\n \n if ($setting[\'so_sociallogin_googleimage\']) {\n $googleicon = $this->model_tool_image->resize($setting[\'so_sociallogin_googleimage\'], $sociallogin_width, $sociallogin_height);\n } else {\n $googleicon = $this->model_tool_image->resize(\'placeholder.png\', $sociallogin_width, $sociallogin_height);\n }\n \n if ($setting[\'so_sociallogin_linkdinimage\']) {\n $linkdinicon = $this->model_tool_image->resize($setting[\'so_sociallogin_linkdinimage\'], $sociallogin_width, $sociallogin_height);\n } else {\n $linkdinicon = $this->model_tool_image->resize(\'placeholder.png\', $sociallogin_width, $sociallogin_height);\n }\n \n $data[\'iconwidth\'] = $sociallogin_width;\n $data[\'iconheight\'] = $sociallogin_height;\n $data[\'status\'] = $setting[\'so_sociallogin_status\'];\n $data[\'fbimage\'] = $fbicon;\n $data[\'twitimage\'] = $twiticon;\n $data[\'googleimage\'] = $googleicon;\n $data[\'linkdinimage\'] = $linkdinicon;\n \n $data[\'setting\'] = $setting;\n }\n /* xml */ \n ]]></add>\n </operation>\n </file>\n \n <file path=\"admin/view/template/design/layout_form.tpl\">\n <operation error=\"log\">\n <search ><![CDATA[<table id=\"module-column-right\" class=\"table table-striped table-bordered table-hover\">]]></search>\n <add position=\"before\" offset=\"2\"><![CDATA[\n <!--xml-->\n <table id=\"module-column-login\" class=\"table table-striped table-bordered table-hover\">\n <thead>\n <tr>\n <td class=\"text-center\"><?php echo $text_column_loginpage; ?></td>\n </tr>\n </thead>\n <tbody>\n <?php foreach ($layout_modules as $layout_module) { ?>\n <?php if ($layout_module[\'position\'] == \'column_login\') { ?>\n <tr id=\"module-row<?php echo $module_row; ?>\">\n <td class=\"text-left\"><div class=\"input-group\">\n <select name=\"layout_module[<?php echo $module_row; ?>][code]\" class=\"form-control input-sm\">\n <?php foreach ($extensions as $extension) { ?>\n <optgroup label=\"<?php echo $extension[\'name\']; ?>\">\n <?php if (!$extension[\'module\']) { ?>\n <?php if ($extension[\'code\'] == $layout_module[\'code\']) { ?>\n <option value=\"<?php echo $extension[\'code\']; ?>\" selected=\"selected\"><?php echo $extension[\'name\']; ?></option>\n <?php } else { ?>\n <option value=\"<?php echo $extension[\'code\']; ?>\"><?php echo $extension[\'name\']; ?></option>\n <?php } ?>\n <?php } else { ?>\n <?php foreach ($extension[\'module\'] as $module) { ?>\n <?php if ($module[\'code\'] == $layout_module[\'code\']) { ?>\n <option value=\"<?php echo $module[\'code\']; ?>\" selected=\"selected\"><?php echo $module[\'name\']; ?></option>\n <?php } else { ?>\n <option value=\"<?php echo $module[\'code\']; ?>\"><?php echo $module[\'name\']; ?></option>\n <?php } ?>\n <?php } ?>\n <?php } ?>\n </optgroup>\n <?php } ?>\n </select>\n <input type=\"hidden\" name=\"layout_module[<?php echo $module_row; ?>][position]\" value=\"<?php echo $layout_module[\'position\']; ?>\" />\n <input type=\"hidden\" name=\"layout_module[<?php echo $module_row; ?>][sort_order]\" value=\"<?php echo $layout_module[\'sort_order\']; ?>\" />\n <div class=\"input-group-btn\"><a href=\"<?php echo $layout_module[\'edit\']; ?>\" type=\"button\" data-toggle=\"tooltip\" title=\"<?php echo $button_edit; ?>\" target=\"_blank\" class=\"btn btn-primary btn-sm\"><i class=\"fa fa-pencil\"></i></a>\n <button type=\"button\" onclick=\"$(\'#module-row<?php echo $module_row; ?>\').remove();\" data-toggle=\"tooltip\" title=\"<?php echo $button_remove; ?>\" class=\"btn btn-danger btn-sm\"><i class=\"fa fa fa-minus-circle\"></i></button>\n </div>\n </div></td>\n </tr>\n <?php $module_row++; ?>\n <?php } ?>\n <?php } ?>\n </tbody>\n <tfoot>\n <tr>\n <td class=\"text-left\"><div class=\"input-group\">\n <select class=\"form-control input-sm\">\n <?php foreach ($extensions as $extension) { ?>\n <optgroup label=\"<?php echo $extension[\'name\']; ?>\">\n <?php if (!$extension[\'module\']) { ?>\n <option value=\"<?php echo $extension[\'code\']; ?>\"><?php echo $extension[\'name\']; ?></option>\n <?php } else { ?>\n <?php foreach ($extension[\'module\'] as $module) { ?>\n <option value=\"<?php echo $module[\'code\']; ?>\"><?php echo $module[\'name\']; ?></option>\n <?php } ?>\n <?php } ?>\n </optgroup>\n <?php } ?>\n </select>\n <div class=\"input-group-btn\">\n <button type=\"button\" onclick=\"addModule(\'column-login\');\" data-toggle=\"tooltip\" title=\"<?php echo $button_module_add; ?>\" class=\"btn btn-primary btn-sm\"><i class=\"fa fa-plus-circle\"></i></button>\n </div>\n </div></td>\n </tr>\n </tfoot>\n </table>\n <!--xml-->\n ]]></add>\n </operation>\n \n <operation error=\"log\">\n <search ><![CDATA[$(\'#module-column-left, #module-column-right, #module-content-top, #module-content-bottom\').delegate(\'select[name*=\\\'code\\\']\', \'change\', function() {]]></search>\n <add position=\"replace\"><![CDATA[\n $(\'#module-column-left, #module-column-right, #module-content-top, #module-content-bottom, #module-column-login\').delegate(\'select[name*=\\\'code\\\']\', \'change\', function() {\n ]]></add>\n </operation>\n <operation error=\"log\">\n <search ><![CDATA[$(\'#module-column-left, #module-column-right, #module-content-top, #module-content-bottom\').trigger(\'change\');]]></search>\n <add position=\"replace\"><![CDATA[\n $(\'#module-column-left, #module-column-right, #module-content-top, #module-content-bottom, #module-column-login\').trigger(\'change\');\n ]]></add>\n </operation>\n </file>\n \n <file path=\"admin/language/*/design/layout.php\">\n <operation error=\"log\">\n <search ><![CDATA[// Text]]></search>\n <add position=\"after\"><![CDATA[\n /* xml */\n \n $_[\'text_column_loginpage\'] = \'Login Page\';\n $_[\'text_column_checkoutpage\'] = \'Checkout Page\';\n /* xml */ \n ]]></add>\n </operation>\n </file>\n \n <file path=\"admin/controller/design/layout.php\">\n <operation error=\"log\">\n <search ><![CDATA[protected function getForm() {]]></search>\n <add position=\"after\"><![CDATA[\n /* xml */\n $data[\'text_column_loginpage\'] = $this->language->get(\'text_column_loginpage\');\n $data[\'text_column_checkoutpage\'] = $this->language->get(\'text_column_checkoutpage\'); \n /* xml */ \n ]]></add>\n </operation>\n </file>\n \n <file path=\"catalog/model/account/customer.php\">\n <operation error=\"log\">\n <search ><![CDATA[$customer_id = $this->db->getLastId();]]></search>\n <add position=\"after\"><![CDATA[\n /* xml */\n if(!empty($data[\'address_1\']))\n {\n /* xml */ \n ]]></add>\n </operation>\n <operation error=\"log\">\n <search ><![CDATA[$this->load->language(\'mail/customer\');]]></search>\n <add position=\"before\"><![CDATA[\n /* xml */\n }\n /* xml */ \n ]]></add>\n </operation>\n </file>\n \n <file path=\"catalog/controller/common/header.php\">\n <operation error=\"log\">\n <search ><![CDATA[$data[\'title\'] = $this->document->getTitle();]]></search>\n <add position=\"after\"><![CDATA[\n $this->document->addStyle(\'catalog/view/javascript/so_sociallogin/css/so_sociallogin.css\');\n $this->load->model(\'setting/setting\');\n $this->load->model(\'tool/image\');\n $setting = $this->model_setting_setting->getSetting(\'so_sociallogin\');\n \n if ($setting) {\n if(isset($this->session->data[\'route\']))\n {\n $location = $this->url->link($this->session->data[\'route\'], \"\", \'SSL\');\n }\n else\n {\n $location = $this->url->link(\"account/account\", \"\", \'SSL\');\n }\n \n /* Facebook Library */\n require_once(DIR_SYSTEM . \'library/so_social/fb/facebook.php\');\n \n /* Facebook Login link code */\n $fbconnect = new Facebook(array(\n \'appId\' => $setting[\'so_sociallogin_fbapikey\'],\n \'secret\' => $setting[\'so_sociallogin_fbsecretapi\'],\n ));\n \n $data[\'fblink\'] = $fbconnect->getLoginUrl(\n array(\n \'scope\' => \'email,user_birthday,user_location,user_hometown\',\n \'redirect_uri\' => $this->url->link(\'extension/module/so_sociallogin/FacebookLogin\', \'\', \'SSL\')\n )\n );\n /* Facebook Login link code */\n \n /* Google Libery file inculde */\n require_once DIR_SYSTEM.\'library/so_social/src/Google_Client.php\';\n require_once DIR_SYSTEM.\'library/so_social/src/contrib/Google_Oauth2Service.php\';\n \n /* Google Login link code */\n $gClient = new Google_Client();\n $gClient->setApplicationName($setting[\'so_sociallogin_googletitle\']);\n $gClient->setClientId($setting[\'so_sociallogin_googleapikey\']);\n $gClient->setClientSecret($setting[\'so_sociallogin_googlesecretapi\']);\n $gClient->setRedirectUri($this->url->link(\'extension/module/so_sociallogin/GoogleLogin\', \'\', \'SSL\'));\n $google_oauthV2 = new Google_Oauth2Service($gClient);\n $data[\'googlelink\'] = $gClient->createAuthUrl();\n \n /* Twitter Login */ \n $data[\'twitlink\'] = $this->url->link(\'extension/module/so_sociallogin/TwitterLogin\', \'\', \'SSL\');\n \n /* Linkedin Login */\n $data[\'linkdinlink\'] = $this->url->link(\'extension/module/so_sociallogin/LinkedinLogin\', \'\', \'SSL\');\n \n /* Get Image */\n $sociallogin_width = 130;\n $sociallogin_height = 35;\n if (isset($setting[\'so_sociallogin_width\']) && is_numeric($setting[\'so_sociallogin_width\'])) {\n $sociallogin_width = $setting[\'so_sociallogin_width\'];\n }\n if (isset($setting[\'so_sociallogin_height\']) && is_numeric($setting[\'so_sociallogin_height\'])) {\n $sociallogin_height = $setting[\'so_sociallogin_height\'];\n }\n if ($setting[\'so_sociallogin_fbimage\']) {\n $fbicon = $this->model_tool_image->resize($setting[\'so_sociallogin_fbimage\'], $sociallogin_width, $sociallogin_height);\n } else {\n $fbicon = $this->model_tool_image->resize(\'placeholder.png\', $sociallogin_width, $sociallogin_height);\n }\n \n if ($setting[\'so_sociallogin_twitimage\']) {\n $twiticon = $this->model_tool_image->resize($setting[\'so_sociallogin_twitimage\'], $sociallogin_width, $sociallogin_height);\n } else {\n $twiticon = $this->model_tool_image->resize(\'placeholder.png\', $sociallogin_width, $sociallogin_height);\n }\n \n if ($setting[\'so_sociallogin_googleimage\']) {\n $googleicon = $this->model_tool_image->resize($setting[\'so_sociallogin_googleimage\'], $sociallogin_width, $sociallogin_height);\n } else {\n $googleicon = $this->model_tool_image->resize(\'placeholder.png\', $sociallogin_width, $sociallogin_height);\n }\n \n if ($setting[\'so_sociallogin_linkdinimage\']) {\n $linkdinicon = $this->model_tool_image->resize($setting[\'so_sociallogin_linkdinimage\'], $sociallogin_width, $sociallogin_height);\n } else {\n $linkdinicon = $this->model_tool_image->resize(\'placeholder.png\', $sociallogin_width, $sociallogin_height);\n }\n \n $data[\'iconwidth\'] = $sociallogin_width;\n $data[\'iconheight\'] = $sociallogin_height;\n $data[\'status\'] = $setting[\'so_sociallogin_status\'];\n $data[\'fbimage\'] = $fbicon;\n $data[\'twitimage\'] = $twiticon;\n $data[\'googleimage\'] = $googleicon;\n $data[\'linkdinimage\'] = $linkdinicon;\n \n $data[\'setting\'] = $setting;\n \n $this->load->language(\'extension/module/so_sociallogin\');\n $data[\'text_colregister\'] = $this->language->get(\'text_colregister\');\n $data[\'text_create_account\'] = $this->language->get(\'text_create_account\');\n $data[\'text_forgot_password\'] = $this->language->get(\'text_forgot_password\');\n $data[\'text_title_popuplogin\'] = $this->language->get(\'text_title_popuplogin\');\n $data[\'text_title_login_with_social\'] = $this->language->get(\'text_title_login_with_social\');\n }\n ]]></add>\n </operation>\n </file>\n \n <file path=\"catalog/view/theme/*/template/common/header.tpl\">\n <operation error=\"log\">\n <search><![CDATA[<div id=\"socialLogin\"></div>]]></search>\n <add position=\"after\"><![CDATA[\n <?php if (isset($setting) && $setting[\'so_sociallogin_status\'] && $setting[\'so_sociallogin_popuplogin\']) {?>\n <div class=\"modal fade in\" id=\"so_sociallogin\" tabindex=\"-1\" role=\"dialog\" aria-hidden=\"true\">\n <div class=\"modal-dialog block-popup-login\">\n <a href=\"javascript:void(0)\" title=\"Close\" class=\"close close-login fa fa-times-circle\" data-dismiss=\"modal\"></a>\n <div class=\"tt_popup_login\"><strong><?php echo $text_title_popuplogin?></strong></div>\n <div class=\"block-content\">\n <div class=\" col-reg registered-account\">\n <div class=\"block-content\">\n <form class=\"form form-login\" action=\"<?php echo $login?>\" method=\"post\" id=\"login-form\">\n <fieldset class=\"fieldset login\" data-hasrequired=\"* Required Fields\">\n <div class=\"field email required email-input\">\n <div class=\"control\">\n <input name=\"email\" value=\"\" autocomplete=\"off\" id=\"email\" type=\"email\" class=\"input-text\" title=\"Email\" placeholder=\"E-mail Address\" />\n </div>\n </div>\n <div class=\"field password required pass-input\">\n <div class=\"control\">\n <input name=\"password\" type=\"password\" autocomplete=\"off\" class=\"input-text\" id=\"pass\" title=\"Password\" placeholder=\"Password\" />\n </div>\n </div>\n <?php if ($setting[\'so_sociallogin_status\']) {?>\n <div class=\" form-group\">\n <label class=\"control-label\"><?php echo $text_title_login_with_social?></label>\n <div>\n <?php if ($setting[\'so_sociallogin_googlestatus\']) {?>\n <?php if ($setting[\'so_sociallogin_button\'] == \'icon\') {?>\n <a href=\"<?php echo $googlelink?>\" class=\"btn btn-social-icon btn-sm btn-google-plus\"><i class=\"fa fa-google fa-fw\" aria-hidden=\"true\"></i></a>\n <?php }else {?>\n <a class=\"social-icon\" href=\"<?php echo $googlelink?>\">\n <img class=\"img-responsive\" src=\"<?php echo $googleimage; ?>\" \n data-toggle=\"tooltip\" alt=\"<?php echo $setting[\'so_sociallogin_googletitle\']; ?>\" \n title=\"<?php echo $setting[\'so_sociallogin_googletitle\']; ?>\" \n />\n </a>\n <?php }?>\n <?php }?>\n <?php if ($setting[\'so_sociallogin_fbstatus\']) {?>\n <?php if ($setting[\'so_sociallogin_button\'] == \'icon\') {?>\n <a href=\"<?php echo $fblink?>\" class=\"btn btn-social-icon btn-sm btn-facebook\"><i class=\"fa fa-facebook fa-fw\" aria-hidden=\"true\"></i></a>\n <?php }else {?>\n <a href=\"<?php echo $fblink?>\" class=\"social-icon\">\n <img class=\"img-responsive\" src=\"<?php echo $fbimage; ?>\" \n data-toggle=\"tooltip\" alt=\"<?php echo $setting[\'so_sociallogin_fbtitle\']; ?>\" \n title=\"<?php echo $setting[\'so_sociallogin_fbtitle\']; ?>\"\n />\n </a>\n <?php }?>\n <?php }?>\n <?php if ($setting[\'so_sociallogin_twitstatus\']) {?>\n <?php if ($setting[\'so_sociallogin_button\'] == \'icon\') {?>\n <a href=\"<?php echo $twitlink?>\" class=\"btn btn-social-icon btn-sm btn-twitter\"><i class=\"fa fa-twitter fa-fw\" aria-hidden=\"true\"></i></a>\n <?php }else {?>\n <a class=\"social-icon\" href=\"<?php echo $twitlink; ?>\">\n <img class=\"img-responsive\" src=\"<?php echo $twitimage; ?>\" \n data-toggle=\"tooltip\" alt=\"<?php echo $setting[\'so_sociallogin_twittertitle\']; ?>\" \n title=\"<?php echo $setting[\'so_sociallogin_twittertitle\']; ?>\"\n />\n </a>\n <?php }?>\n <?php }?>\n <?php if ($setting[\'so_sociallogin_linkstatus\']) {?>\n <?php if ($setting[\'so_sociallogin_button\'] == \'icon\') {?>\n <a href=\"<?php echo $linkdinlink?>\" class=\"btn btn-social-icon btn-sm btn-linkdin\"><i class=\"fa fa-linkedin fa-fw\" aria-hidden=\"true\"></i></a>\n <?php }else {?>\n <a class=\"social-icon\" href=\"<?php echo $linkdinlink; ?>\">\n <img class=\"img-responsive\" src=\"<?php echo $linkdinimage; ?>\" \n data-toggle=\"tooltip\" alt=\"<?php echo $setting[\'so_sociallogin_linkedintitle\']; ?>\" \n title=\"<?php echo $setting[\'so_sociallogin_linkedintitle\']; ?>\"\n />\n </a>\n <?php }?>\n <?php }?>\n </div>\n </div>\n <?php }?>\n <div class=\"secondary ft-link-p\"><a class=\"action remind\" href=\"<?php echo $forgotten?>\"><span><?php echo $text_forgot_password?></span></a></div>\n <div class=\"actions-toolbar\">\n <div class=\"primary\"><button type=\"submit\" class=\"action login primary\" name=\"send\" id=\"send2\"><span><?php echo $text_login?></span></button></div>\n </div>\n </fieldset>\n </form>\n </div>\n </div> \n <div class=\"col-reg login-customer\">\n <?php echo $text_colregister?>\n <a class=\"btn-reg-popup\" title=\"<?php echo $text_register?>\" href=\"<?php echo $register; ?>\"><?php echo $text_create_account?></a>\n </div>\n <div style=\"clear:both;\"></div>\n </div>\n </div>\n </div>\n <script type=\"text/javascript\">\n jQuery(document).ready(function($) {\n var $window = $(window);\n function checkWidth() {\n var windowsize = $window.width();\n if (windowsize > 767) {\n $(\'a[href*=\"account/login\"]\').click(function (e) {\n e.preventDefault();\n $(\"#so_sociallogin\").modal(\'show\');\n });\n }\n }\n checkWidth();\n $(window).resize(checkWidth);\n });\n </script>\n <?php }?>\n ]]></add>\n </operation>\n </file>\n</modification>', 1, '2017-02-16 17:27:40'),
(3, 'OCMod Editor', 'ocmod-editor', 'OpenCart Brasil', '1.6', 'http://www.opencartbrasil.com.br', '<?xml version=\"1.0\" encoding=\"utf-8\"?> \n<modification> \n <name>OCMod Editor</name> \n <code>ocmod-editor</code> \n <version>1.6</version> \n <author>OpenCart Brasil</author> \n <link>http://www.opencartbrasil.com.br</link> \n <file path=\"admin/controller/extension/modification.php\"> \n <operation> \n <search> \n <![CDATA[$data[\'refresh\'] = $this->url->link(\'extension/modification/refresh\', \'token=\' . $this->session->data[\'token\'] . $url, true);]]> \n </search> \n <add position=\"before\"> \n <![CDATA[$data[\'new\'] = $this->url->link(\'extension/modification_editor\', \'token=\' . $this->session->data[\'token\'] . $url, true);]]> \n </add> \n </operation> \n <operation> \n <search> \n <![CDATA[$data[\'modifications\'][] = array(]]> \n </search> \n <add position=\"after\"> \n <![CDATA[ \n \'edit\' => $this->url->link(\'extension/modification_editor\', \'token=\' . $this->session->data[\'token\'] . \'&modification_id=\' . $result[\'modification_id\'], true), \n \'download\' => $this->url->link(\'extension/modification_editor/download\', \'token=\' . $this->session->data[\'token\'] . \'&modification_id=\' . $result[\'modification_id\'], true), \n ]]> \n </add> \n </operation> \n <operation> \n <search> \n <![CDATA[$data[\'tab_log\'] = $this->language->get(\'tab_log\');]]> \n </search> \n <add position=\"after\"> \n <![CDATA[ \n $this->load->language(\'extension/modification_editor\'); \n $data[\'button_new\'] = $this->language->get(\'button_new\'); \n $data[\'button_edit\'] = $this->language->get(\'button_edit\'); \n $data[\'button_download\'] = $this->language->get(\'button_download\'); \n ]]> \n </add> \n </operation> \n <operation> \n <search index=\"1\"> \n <![CDATA[$this->response->redirect($this->url->link(\'extension/modification\', \'token=\' . $this->session->data[\'token\'] . $url, true));]]> \n </search> \n <add position=\"replace\"> \n <![CDATA[ \n if (isset($this->request->get[\'modification_editor\'])) { \n echo $this->session->data[\'success\']; \n exit; \n } else { \n $this->response->redirect($this->url->link(\'extension/modification\', \'token=\' . $this->session->data[\'token\'] . $url, true)); \n } \n ]]> \n </add> \n </operation> \n </file> \n \n <file path=\"admin/view/template/extension/modification.tpl\"> \n <operation> \n <search> \n <![CDATA[<div class=\"pull-right\">]]> \n </search> \n <add position=\"after\"> \n <![CDATA[<a href=\"<?php echo $new; ?>\" data-toggle=\"tooltip\" title=\"<?php echo $button_new; ?>\" class=\"btn btn-primary\"><i class=\"fa fa-plus\"></i></a>]]> \n </add> \n </operation> \n <operation> \n <search> \n <![CDATA[<?php if (!$modification[\'enabled\']) { ?>]]> \n </search> \n <add position=\"before\"> \n <![CDATA[ \n <a href=\"<?php echo $modification[\'edit\']; ?>\" data-toggle=\"tooltip\" title=\"<?php echo $button_edit; ?>\" class=\"btn btn-primary\"><i class=\"fa fa-pencil\"></i></a> \n <a href=\"<?php echo $modification[\'download\']; ?>\" data-toggle=\"tooltip\" title=\"<?php echo $button_download; ?>\" class=\"btn btn-success\"><i class=\"fa fa-cloud-download\"></i></a> \n ]]> \n </add> \n </operation> \n </file> \n</modification>', 1, '2017-02-16 17:36:36');
INSERT INTO `wbc_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(7, 'So OnePage Checkout', 'so-onepage-checkout', 'OpenCartWorks', '1.0.1', 'http://www.opencartworks.com/', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<modification>\n <name>So OnePage Checkout</name>\n <code>so-onepage-checkout</code>\n <version>1.0.1</version>\n <author>OpenCartWorks</author>\n <link>http://www.opencartworks.com/</link>\n\n <file path=\"catalog/controller/checkout/checkout.php\">\n <operation error=\"log\">\n <search ><![CDATA[class ControllerCheckoutCheckout extends Controller {]]></search>\n <add position=\"after\"><![CDATA[\n public function __construct($registry) {\n parent::__construct($registry);\n $this->load->language(\'checkout/cart\');\n $this->load->language(\'checkout/checkout\');\n \n $this->load->language(\'checkout/coupon\');\n $this->load->language(\'checkout/voucher\');\n $this->load->language(\'extension/module/so_onepagecheckout\');\n \n $this->load->model(\'account/activity\');\n $this->load->model(\'account/custom_field\');\n $this->load->model(\'tool/upload\');\n \n $this->load->model(\'account/address\');\n $this->load->model(\'account/customer\');\n $this->load->model(\'account/customer_group\');\n $this->load->model(\'localisation/country\');\n $this->load->model(\'localisation/zone\');\n $this->load->model(\'extension/module/so_onepagecheckout\');\n }\n \n public function getProperty($array, $property, $default_value = null) {\n $properties = explode(\'.\', $property);\n foreach ($properties as $prop) {\n if (!is_array($array) || !isset($array[$prop])) {\n return $default_value;\n }\n $array = $array[$prop];\n }\n if (is_array($array)) {\n return $array;\n }\n $array = trim($array);\n return $array !== \'\' ? $array : $default_value;\n }\n \n private function isShippingRequired() {\n return $this->cart->hasShipping();\n }\n \n private function isLoggedIn() {\n return $this->customer->isLogged();\n }\n \n private function allowGuestCheckout() {\n return $this->config->get(\'config_checkout_guest\') && !$this->config->get(\'config_customer_price\') && !$this->cart->hasDownload();\n }\n\n private function renderRegisterForm() {\n $this->load->model(\'setting/setting\');\n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\');\n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\'];\n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\'];\n $data[\'setting_so_onepagecheckout\'] = $setting_so_onepagecheckout;\n $data[\'setting_so_onepagecheckout_general\'] = $setting_so_onepagecheckout_general;\n $data[\'setting_so_onepagecheckout_layout_setting\'] = $setting_so_onepagecheckout_layout_setting;\n\n $data[\'text_register\'] = $this->language->get(\'text_register\');\n $data[\'text_guest\'] = $this->language->get(\'text_guest\');\n $data[\'entry_email\'] = $this->language->get(\'entry_email\');\n $data[\'entry_password\'] = $this->language->get(\'entry_password\');\n $data[\'text_forgotten\'] = $this->language->get(\'text_forgotten\');\n $data[\'text_loading\'] = $this->language->get(\'text_loading\');\n $data[\'button_login\'] = $this->language->get(\'button_login\');\n $data[\'text_i_am_returning_customer\'] = $this->language->get(\'text_i_am_returning_customer\');\n $data[\'text_returning_customer\'] = $this->language->get(\'text_returning_customer\');\n\n $data[\'text_your_details\'] = $this->language->get(\'text_your_details\');\n $data[\'entry_customer_group\'] = $this->language->get(\'entry_customer_group\');\n $data[\'entry_firstname\'] = $this->language->get(\'entry_firstname\');\n $data[\'entry_lastname\'] = $this->language->get(\'entry_lastname\');\n $data[\'entry_telephone\'] = $this->language->get(\'entry_telephone\');\n $data[\'entry_fax\'] = $this->language->get(\'entry_fax\');\n $data[\'text_your_password\'] = $this->language->get(\'text_your_password\');\n $data[\'entry_confirm\'] = $this->language->get(\'entry_confirm\');\n $data[\'text_your_address\'] = $this->language->get(\'text_your_address\');\n $data[\'entry_shipping\'] = $this->language->get(\'entry_shipping\');\n $data[\'text_shipping_address\'] = $this->language->get(\'text_shipping_address\');\n\n $data[\'customer_groups\'] = array();\n $data[\'customer_group_id\'] = $this->model_extension_module_so_onepagecheckout->getCustomerGroupId();\n if (is_array($this->config->get(\'config_customer_group_display\'))) {\n $this->load->model(\'account/customer_group\');\n\n $customer_groups = $this->model_account_customer_group->getCustomerGroups();\n\n foreach ($customer_groups as $customer_group) {\n if (in_array($customer_group[\'customer_group_id\'], $this->config->get(\'config_customer_group_display\'))) {\n $data[\'customer_groups\'][] = $customer_group;\n }\n }\n }\n\n $data[\'payment_address_form\'] = $this->renderAddressForm(\'payment\', false);\n $data[\'shipping_address_form\'] = $this->renderAddressForm(\'shipping\');\n $data[\'shipping_address\'] = $this->getProperty($this->session->data, \'so_checkout_shipping_address\', \'1\');\n $data[\'is_shipping_required\'] = $this->isShippingRequired();\n\n $data[\'forgotten\'] = $this->url->link(\'account/forgotten\', \'\', true);\n\n $data[\'custom_fields\'] = $this->model_extension_module_so_onepagecheckout->getCustomFields();\n $data[\'order_data\'] = $this->model_extension_module_so_onepagecheckout->getOrder();\n\n return $this->load->view(\'extension/module/so_onepagecheckout/checkout/register\', $data);\n }\n\n private function renderAddressForm($type, $name = true) {\n $this->load->model(\'setting/setting\');\n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\');\n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\'];\n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\'];\n \n $data[\'type\'] = $type;\n $data[\'name\'] = $name;\n\n $data[\'button_upload\'] = $this->language->get(\'button_upload\');\n $data[\'text_address_existing\'] = $this->language->get(\'text_address_existing\');\n $data[\'text_address_new\'] = $this->language->get(\'text_address_new\');\n $data[\'text_select\'] = $this->language->get(\'text_select\');\n $data[\'text_none\'] = $this->language->get(\'text_none\');\n\n $data[\'entry_firstname\'] = $this->language->get(\'entry_firstname\');\n $data[\'entry_lastname\'] = $this->language->get(\'entry_lastname\');\n $data[\'entry_company\'] = $this->language->get(\'entry_company\');\n $data[\'entry_company_id\'] = $this->language->get(\'entry_company_id\');\n $data[\'entry_tax_id\'] = $this->language->get(\'entry_tax_id\');\n $data[\'entry_address_1\'] = $this->language->get(\'entry_address_1\');\n $data[\'entry_address_2\'] = $this->language->get(\'entry_address_2\');\n $data[\'entry_postcode\'] = $this->language->get(\'entry_postcode\');\n $data[\'entry_city\'] = $this->language->get(\'entry_city\');\n $data[\'entry_country\'] = $this->language->get(\'entry_country\');\n $data[\'entry_zone\'] = $this->language->get(\'entry_zone\');\n\n $data[\'custom_fields\'] = $this->model_extension_module_so_onepagecheckout->getCustomFields($type);\n $data[\'order_data\'] = $this->model_extension_module_so_onepagecheckout->getOrder();\n\n $data[\'addresses\'] = $this->model_account_address->getAddresses();\n $data[\'countries\'] = $this->model_localisation_country->getCountries();\n\n $address = $this->model_extension_module_so_onepagecheckout->getAddress($type);\n foreach ($address as $key => $value) {\n $data[$key] = $value;\n }\n\n if ($this->isLoggedIn()) {\n $data[\'is_logged_in\'] = true;\n } else {\n $data[\'is_logged_in\'] = false;\n }\n\n if (isset($setting_so_onepagecheckout_general[\'so_onepagecheckout_country_id\']) && $setting_so_onepagecheckout_general[\'so_onepagecheckout_country_id\']) {\n $data[\'country_id\'] = $setting_so_onepagecheckout_general[\'so_onepagecheckout_country_id\'];\n }\n\n if (isset($setting_so_onepagecheckout_general[\'so_onepagecheckout_zone_id\']) && $setting_so_onepagecheckout_general[\'so_onepagecheckout_zone_id\']) {\n $data[\'zone_id\'] = $setting_so_onepagecheckout_general[\'so_onepagecheckout_zone_id\'];\n }\n\n return $this->load->view(\'extension/module/so_onepagecheckout/checkout/address_form\', $data);\n }\n\n public function shipping($load = false) {\n $this->load->model(\'setting/setting\');\n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\');\n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\'];\n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\'];\n $data[\'setting_so_onepagecheckout\'] = $setting_so_onepagecheckout;\n $data[\'setting_so_onepagecheckout_general\'] = $setting_so_onepagecheckout_general;\n $data[\'setting_so_onepagecheckout_layout_setting\'] = $setting_so_onepagecheckout_layout_setting;\n \n $data[\'text_shipping_method\'] = $this->language->get(\'text_shipping_method\');\n $data[\'text_title_shipping_method\'] = $this->language->get(\'text_title_shipping_method\');\n $data[\'error_shipping_method\'] = $this->language->get(\'error_shipping_method\');\n\n $data[\'shipping_methods\'] = $this->model_extension_module_so_onepagecheckout->getShippingMethods();\n $shipping_methods = array();\n if (count($data[\'shipping_methods\'])>0) {\n foreach ($data[\'shipping_methods\'] as $key=>$shipping_method) {\n if (@$setting_so_onepagecheckout_layout_setting[$key.\'_status\'] == 1) {\n $shipping_methods[] = $shipping_method;\n }\n }\n }\n $data[\'shipping_methods\'] = $shipping_methods;\n $data[\'code\'] = $this->model_extension_module_so_onepagecheckout->getShippingMethodCode();\n\n if (!$data[\'shipping_methods\']) {\n $data[\'error_warning\'] = sprintf($this->language->get(\'error_no_shipping\'), $this->url->link(\'information/contact\', \'\', true));\n } else {\n $data[\'error_warning\'] = \'\';\n }\n\n if ($load)\n return $this->load->view(\'extension/module/so_onepagecheckout/checkout/shipping_methods\', $data);\n else\n return $this->response->setOutput($this->load->view(\'extension/module/so_onepagecheckout/checkout/shipping_methods\', $data));\n\n }\n\n public function payment($load = false) {\n $this->load->model(\'setting/setting\');\n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\');\n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\'];\n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\'];\n $data[\'setting_so_onepagecheckout\'] = $setting_so_onepagecheckout;\n $data[\'setting_so_onepagecheckout_general\'] = $setting_so_onepagecheckout_general;\n $data[\'setting_so_onepagecheckout_layout_setting\'] = $setting_so_onepagecheckout_layout_setting;\n\n $data[\'text_payment_method\'] = $this->language->get(\'text_payment_method\');\n $data[\'text_title_payment_method\'] = $this->language->get(\'text_title_payment_method\');\n\n $data[\'payment_methods\'] = $this->model_extension_module_so_onepagecheckout->getPaymentMethods();\n $payment_methods = array();\n if (count($data[\'payment_methods\'])>0) {\n foreach ($data[\'payment_methods\'] as $key=>$payment_method) {\n if (@$setting_so_onepagecheckout_layout_setting[$key.\'_status\'] == 1) {\n $payment_methods[] = $payment_method;\n }\n }\n }\n $data[\'payment_methods\'] = $payment_methods;\n $data[\'code\'] = $this->model_extension_module_so_onepagecheckout->getPaymentMethodCode();\n\n if (!$data[\'payment_methods\']) {\n $data[\'error_warning\'] = sprintf($this->language->get(\'error_no_payment\'), $this->url->link(\'information/contact\', \'\', true));\n } else {\n $data[\'error_warning\'] = \'\';\n }\n\n if ($load)\n return $this->load->view(\'extension/module/so_onepagecheckout/checkout/payment_methods\', $data);\n else\n return $this->response->setOutput($this->load->view(\'extension/module/so_onepagecheckout/checkout/payment_methods\', $data));\n }\n\n public function change_coupon_voucher_reward() {\n $this->load->model(\'setting/setting\');\n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\');\n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\'];\n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\'];\n $data[\'setting_so_onepagecheckout\'] = $setting_so_onepagecheckout;\n $data[\'setting_so_onepagecheckout_general\'] = $setting_so_onepagecheckout_general;\n $data[\'setting_so_onepagecheckout_layout_setting\'] = $setting_so_onepagecheckout_layout_setting;\n\n $data[\'text_loading\'] = $this->language->get(\'text_loading\');\n $data[\'text_coupon_voucher\'] = $this->language->get(\'text_coupon_voucher\');\n $data[\'text_enter_coupon_code\'] = $this->language->get(\'text_enter_coupon_code\');\n $data[\'text_enter_voucher_code\'] = $this->language->get(\'text_enter_voucher_code\');\n $data[\'text_apply_voucher\'] = $this->language->get(\'text_apply_voucher\');\n $data[\'text_enter_reward_points\'] = $this->language->get(\'text_enter_reward_points\');\n $data[\'text_apply_points\'] = $this->language->get(\'text_apply_points\');\n\n $_data = $this->request->post;\n\n if (@$_data[\'so_checkout_account\'] == \'login\') {\n $data[\'coupon_status\'] = $this->config->get(\'coupon_status\') && $setting_so_onepagecheckout_layout_setting[\'coupon_login_status\'];\n }else if (@$_data[\'so_checkout_account\'] == \'register\') {\n $data[\'coupon_status\'] = $this->config->get(\'coupon_status\') && $setting_so_onepagecheckout_layout_setting[\'coupon_register_status\'];\n }else if (@$_data[\'so_checkout_account\'] == \'guest\') {\n $data[\'coupon_status\'] = $this->config->get(\'coupon_status\') && $setting_so_onepagecheckout_layout_setting[\'coupon_guest_status\'];\n }else {\n $data[\'coupon_status\'] = $this->config->get(\'coupon_status\');\n }\n $data[\'entry_coupon\'] = $this->language->get(\'entry_coupon\');\n $data[\'button_coupon\'] = $this->language->get(\'button_coupon\');\n $data[\'coupon\'] = $this->getProperty($this->session->data, \'coupon\');\n\n if (@$_data[\'so_checkout_account\'] == \'login\') {\n $data[\'voucher_status\'] = $this->config->get(\'voucher_status\') && $setting_so_onepagecheckout_layout_setting[\'voucher_login_status\'];\n }else if (@$_data[\'so_checkout_account\'] == \'register\') {\n $data[\'voucher_status\'] = $this->config->get(\'voucher_status\') && $setting_so_onepagecheckout_layout_setting[\'voucher_register_status\'];\n }else if (@$_data[\'so_checkout_account\'] == \'guest\') {\n $data[\'voucher_status\'] = $this->config->get(\'voucher_status\') && $setting_so_onepagecheckout_layout_setting[\'voucher_guest_status\'];\n }else {\n $data[\'voucher_status\'] = $this->config->get(\'voucher_status\');\n }\n $data[\'entry_voucher\'] = $this->language->get(\'entry_voucher\');\n $data[\'button_voucher\'] = $this->language->get(\'button_voucher\');\n $data[\'voucher\'] = $this->getProperty($this->session->data, \'voucher\');\n\n $points = $this->customer->getRewardPoints();\n\n $points_total = 0;\n\n foreach ($this->cart->getProducts() as $product) {\n if ($product[\'points\']) {\n $points_total += $product[\'points\'];\n }\n }\n\n if (@$_data[\'so_checkout_account\'] == \'login\') {\n $data[\'reward_status\'] = $points && $points_total && $this->config->get(\'reward_status\') && $setting_so_onepagecheckout_layout_setting[\'reward_login_status\'];\n }else if (@$_data[\'so_checkout_account\'] == \'register\') {\n $data[\'reward_status\'] = $points && $points_total && $this->config->get(\'reward_status\') && $setting_so_onepagecheckout_layout_setting[\'reward_register_status\'];\n }else if (@$_data[\'so_checkout_account\'] == \'guest\') {\n $data[\'reward_status\'] = $points && $points_total && $this->config->get(\'reward_status\') && $setting_so_onepagecheckout_layout_setting[\'reward_guest_status\'];\n }\n else {\n $data[\'reward_status\'] = $points && $points_total && $this->config->get(\'reward_status\');\n }\n $data[\'entry_reward\'] = $this->language->get(\'entry_reward\');\n $data[\'button_reward\'] = $this->language->get(\'button_reward\');\n $data[\'reward\'] = $this->getProperty($this->session->data, \'reward\');\n\n echo $this->load->view(\'extension/module/so_onepagecheckout/checkout/coupon_voucher_reward\', $data);\n exit();\n }\n\n public function save() {\n if ($value = $this->getProperty($this->request->post, \'shipping_address_id\')) {\n $this->session->data[\'shipping_address\'] = $this->model_account_address->getAddress($value);\n $this->model_extension_module_so_onepagecheckout->setAddress(\'shipping\', $this->session->data[\'shipping_address\']);\n }\n\n if ($value = $this->getProperty($this->request->post, \'shipping_country_id\')) {\n $this->model_extension_module_so_onepagecheckout->setAddress(\'shipping\', array(\n \'country_id\' => $value,\n \'zone_id\' => $this->getProperty($this->request->post, \'shipping_zone_id\'),\n \'postcode\' => $this->getProperty($this->request->post, \'shipping_postcode\'),\n ));\n }\n\n if ($value = $this->getProperty($this->request->post, \'shipping_method\')) {\n $shipping = explode(\'.\', $value);\n $this->session->data[\'shipping_method\'] = $this->session->data[\'shipping_methods\'][$shipping[0]][\'quote\'][$shipping[1]];\n }\n\n if ($value = $this->getProperty($this->request->post, \'payment_address_id\')) {\n $this->session->data[\'payment_address\'] = $this->model_account_address->getAddress($value);\n $this->model_extension_module_so_onepagecheckout->setAddress(\'payment\', $this->session->data[\'payment_address\']);\n }\n\n if ($value = $this->getProperty($this->request->post, \'payment_country_id\')) {\n $this->model_extension_module_so_onepagecheckout->setAddress(\'payment\', array(\n \'country_id\' => $value,\n \'zone_id\' => $this->getProperty($this->request->post, \'payment_zone_id\'),\n \'postcode\' => $this->getProperty($this->request->post, \'payment_postcode\'),\n ));\n }\n\n if ($value = $this->getProperty($this->request->post, \'payment_method\')) {\n $this->session->data[\'payment_method\'] = $this->session->data[\'payment_methods\'][$value];\n }\n\n $this->model_extension_module_so_onepagecheckout->save();\n\n header(\'Content-Type: application/json\');\n echo \'{}\';\n\n exit;\n }\n\n private function renderCouponVoucherReward() {\n $this->load->model(\'setting/setting\');\n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\');\n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\'];\n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\'];\n $data[\'setting_so_onepagecheckout\'] = $setting_so_onepagecheckout;\n $data[\'setting_so_onepagecheckout_general\'] = $setting_so_onepagecheckout_general;\n $data[\'setting_so_onepagecheckout_layout_setting\'] = $setting_so_onepagecheckout_layout_setting;\n\n $data[\'text_loading\'] = $this->language->get(\'text_loading\');\n $data[\'text_coupon_voucher\'] = $this->language->get(\'text_coupon_voucher\');\n $data[\'text_enter_coupon_code\'] = $this->language->get(\'text_enter_coupon_code\');\n $data[\'text_enter_voucher_code\'] = $this->language->get(\'text_enter_voucher_code\');\n $data[\'text_apply_voucher\'] = $this->language->get(\'text_apply_voucher\');\n $data[\'text_enter_reward_points\'] = $this->language->get(\'text_enter_reward_points\');\n $data[\'text_apply_points\'] = $this->language->get(\'text_apply_points\');\n\n $_data = $this->session->data;\n\n if (@$_data[\'so_checkout_account\'] == \'login\') {\n $data[\'coupon_status\'] = $this->config->get(\'coupon_status\') && $setting_so_onepagecheckout_layout_setting[\'coupon_login_status\'];\n }else if (@$_data[\'so_checkout_account\'] == \'register\') {\n $data[\'coupon_status\'] = $this->config->get(\'coupon_status\') && $setting_so_onepagecheckout_layout_setting[\'coupon_register_status\'];\n }else if (@$_data[\'so_checkout_account\'] == \'guest\') {\n $data[\'coupon_status\'] = $this->config->get(\'coupon_status\') && $setting_so_onepagecheckout_layout_setting[\'coupon_guest_status\'];\n }else {\n $data[\'coupon_status\'] = $this->config->get(\'coupon_status\');\n }\n $data[\'entry_coupon\'] = $this->language->get(\'entry_coupon\');\n $data[\'button_coupon\'] = $this->language->get(\'button_coupon\');\n $data[\'coupon\'] = $this->getProperty($this->session->data, \'coupon\');\n\n if (@$_data[\'so_checkout_account\'] == \'login\') {\n $data[\'voucher_status\'] = $this->config->get(\'voucher_status\') && $setting_so_onepagecheckout_layout_setting[\'voucher_login_status\'];\n }else if (@$_data[\'so_checkout_account\'] == \'register\') {\n $data[\'voucher_status\'] = $this->config->get(\'voucher_status\') && $setting_so_onepagecheckout_layout_setting[\'voucher_register_status\'];\n }else if (@$_data[\'so_checkout_account\'] == \'guest\') {\n $data[\'voucher_status\'] = $this->config->get(\'voucher_status\') && $setting_so_onepagecheckout_layout_setting[\'voucher_guest_status\'];\n }else {\n $data[\'voucher_status\'] = $this->config->get(\'voucher_status\');\n }\n $data[\'entry_voucher\'] = $this->language->get(\'entry_voucher\');\n $data[\'button_voucher\'] = $this->language->get(\'button_voucher\');\n $data[\'voucher\'] = $this->getProperty($this->session->data, \'voucher\');\n\n $points = $this->customer->getRewardPoints();\n\n $points_total = 0;\n\n foreach ($this->cart->getProducts() as $product) {\n if ($product[\'points\']) {\n $points_total += $product[\'points\'];\n }\n }\n\n if (@$_data[\'so_checkout_account\'] == \'login\') {\n $data[\'reward_status\'] = $points && $points_total && $this->config->get(\'reward_status\') && $setting_so_onepagecheckout_layout_setting[\'reward_login_status\'];\n }else if (@$_data[\'so_checkout_account\'] == \'register\') {\n $data[\'reward_status\'] = $points && $points_total && $this->config->get(\'reward_status\') && $setting_so_onepagecheckout_layout_setting[\'reward_register_status\'];\n }else if (@$_data[\'so_checkout_account\'] == \'guest\') {\n $data[\'reward_status\'] = $points && $points_total && $this->config->get(\'reward_status\') && $setting_so_onepagecheckout_layout_setting[\'reward_guest_status\'];\n }\n else {\n $data[\'reward_status\'] = $points && $points_total && $this->config->get(\'reward_status\');\n }\n $data[\'entry_reward\'] = $this->language->get(\'entry_reward\');\n $data[\'button_reward\'] = $this->language->get(\'button_reward\');\n $data[\'reward\'] = $this->getProperty($this->session->data, \'reward\');\n\n return $this->load->view(\'extension/module/so_onepagecheckout/checkout/coupon_voucher_reward\', $data);\n }\n\n public function cart($load = false) {\n $this->load->model(\'setting/setting\');\n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\');\n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\'];\n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\'];\n \n $data[\'text_recurring_item\'] = $this->language->get(\'text_recurring_item\');\n $data[\'text_payment_recurring\'] = $this->language->get(\'text_payment_recurring\');\n $data[\'text_shopping_cart\'] = $this->language->get(\'text_shopping_cart\');\n $data[\'text_payment_detail\'] = $this->language->get(\'text_payment_detail\');\n\n $data[\'button_update\'] = $this->language->get(\'button_update\');\n $data[\'button_remove\'] = $this->language->get(\'button_remove\');\n\n $data[\'column_image\'] = $this->language->get(\'column_image\');\n $data[\'column_name\'] = $this->language->get(\'column_name\');\n $data[\'column_model\'] = $this->language->get(\'column_model\');\n $data[\'column_quantity\'] = $this->language->get(\'column_quantity\');\n $data[\'column_price\'] = $this->language->get(\'column_price\');\n $data[\'column_total\'] = $this->language->get(\'column_total\');\n\n $data[\'products\'] = $this->model_extension_module_so_onepagecheckout->getProducts();\n $data[\'vouchers\'] = $this->model_extension_module_so_onepagecheckout->getVouchers();\n $data[\'totals\'] = $this->model_extension_module_so_onepagecheckout->getTotals();\n\n if ($value = $this->getProperty($this->session->data, \'payment_method.code\')) {\n if (version_compare(VERSION, \'2.3\', \'<\')) {\n $data[\'payment\'] = $this->load->controller(\'payment/\' . $value);\n } else {\n $data[\'payment\'] = $this->load->controller(\'extension/payment/\' . $value);\n }\n } else {\n $data[\'payment\'] = \'\';\n }\n\n $data[\'session_data\'] = $this->session->data;\n\n if ($this->config->get(\'config_cart_weight\') && (isset($setting_so_onepagecheckout_layout_setting[\'show_product_weight\']) && $setting_so_onepagecheckout_layout_setting[\'show_product_weight\'])) {\n $data[\'weight\'] = $this->weight->format($this->cart->getWeight(), $this->config->get(\'config_weight_class_id\'), $this->language->get(\'decimal_point\'), $this->language->get(\'thousand_point\'));\n } else {\n $data[\'weight\'] = \'\';\n }\n\n $data[\'setting_so_onepagecheckout_layout_setting\'] = $setting_so_onepagecheckout_layout_setting;\n\n if ($load)\n return $this->load->view(\'extension/module/so_onepagecheckout/checkout/cart\', $data);\n else\n return $this->response->setOutput($this->load->view(\'extension/module/so_onepagecheckout/checkout/cart\', $data));\n }\n\n public function cart_update() {\n $session_update = $this->getProperty($this->request->post, \'key\');\n $qty = $this->getProperty($this->request->post, \'quantity\');\n $this->cart->update($session_update, $qty);\n\n $json = array();\n\n if (!$this->checkCart()) {\n $json[\'redirect\'] = $this->url->link(\'checkout/cart\', \'\', true);\n } else {\n $json[\'total\'] = sprintf($this->language->get(\'text_items\'), $this->cart->countProducts() + (isset($this->session->data[\'vouchers\']) ? count($this->session->data[\'vouchers\']) : 0), $this->registry->get(\'currency\')->format($this->model_extension_module_so_onepagecheckout->getTotal(), $this->session->data[\'currency\']));\n }\n\n echo json_encode($json);\n exit;\n }\n\n public function cart_delete() {\n $session_delete = $this->getProperty($this->request->post, \'key\');\n\n $this->cart->remove($session_delete);\n\n unset($this->session->data[\'vouchers\'][$session_delete]);\n\n $json = array();\n\n if (!$this->checkCart()) {\n $json[\'redirect\'] = $this->url->link(\'checkout/cart\', \'\', true);\n } else {\n $json[\'total\'] = sprintf($this->language->get(\'text_items\'), $this->cart->countProducts() + (isset($this->session->data[\'vouchers\']) ? count($this->session->data[\'vouchers\']) : 0), $this->registry->get(\'currency\')->format($this->model_extension_module_so_onepagecheckout->getTotal(), $this->session->data[\'currency\']));\n }\n\n echo json_encode($json);\n exit;\n }\n\n private function checkCart() {\n // Validate cart has products and has stock.\n if ((!$this->cart->hasProducts() && empty($this->session->data[\'vouchers\'])) || (!$this->cart->hasStock() && !$this->config->get(\'config_stock_checkout\'))) {\n return false;\n }\n\n // Validate minimum quantity requirements.\n $products = $this->cart->getProducts();\n\n foreach ($products as $product) {\n $product_total = 0;\n\n foreach ($products as $product_2) {\n if ($product_2[\'product_id\'] == $product[\'product_id\']) {\n $product_total += $product_2[\'quantity\'];\n }\n }\n\n if ($product[\'minimum\'] > $product_total) {\n return false;\n }\n }\n\n return true;\n }\n\n public function confirm() {\n /* exit if page is accessed via get method */\n if ($this->request->server[\'REQUEST_METHOD\'] != \'POST\') {\n return;\n }\n $this->load->model(\'setting/setting\');\n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\');\n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\'];\n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\'];\n\n $order_data = $this->model_extension_module_so_onepagecheckout->getOrder();\n\n $new_payment_address = null;\n $new_shipping_address = null;\n\n $register_account = $this->getProperty($this->request->post, \'account\', \'register\');\n\n $errors = array();\n $redirect_cart = \'\';\n\n if (!$this->checkCart()) {\n $errors[\'cart\'] = \'\';\n $redirect_cart = $this->url->link(\'checkout/cart\', \'\', true);\n }\n\n if ($this->isLoggedIn()) {\n // payment data\n if ($this->getProperty($this->request->post, \'payment_address\') === \'existing\') {\n $address_info = $this->model_account_address->getAddress($this->getProperty($this->request->post, \'payment_address_id\'));\n $order_data = array_replace($order_data, $this->getAddressData($address_info, \'\', \'payment_\'));\n } else {\n $new_payment_address = $this->getAddressData($this->request->post, \'payment_\', \'payment_\');\n $order_data = array_replace($order_data, $new_payment_address);\n $errors = array_merge($errors, $this->validateAddressData($new_payment_address, \'payment_\'));\n }\n\n // shipping data\n if ($this->isShippingRequired()) {\n if ($this->getProperty($this->request->post, \'shipping_address\') === \'existing\') {\n $address_info = $this->model_account_address->getAddress($this->getProperty($this->request->post, \'shipping_address_id\'));\n $order_data = array_replace($order_data, $this->getAddressData($address_info, \'\', \'shipping_\'));\n } else {\n $new_shipping_address = $this->getAddressData($this->request->post, \'shipping_\', \'shipping_\');\n $order_data = array_replace($order_data, $new_shipping_address);\n $errors = array_merge($errors, $this->validateAddressData($new_shipping_address, \'shipping_\'));\n }\n }\n\n // customer data\n if (!$errors) {\n $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());\n\n $order_data[\'customer_id\'] = $this->customer->getId();\n $order_data[\'customer_group_id\'] = $customer_info[\'customer_group_id\'];\n $order_data[\'firstname\'] = $customer_info[\'firstname\'];\n $order_data[\'lastname\'] = $customer_info[\'lastname\'];\n $order_data[\'email\'] = $customer_info[\'email\'];\n $order_data[\'telephone\'] = $customer_info[\'telephone\'];\n $order_data[\'fax\'] = $customer_info[\'fax\'];\n $order_data[\'custom_field\'] = version_compare(VERSION, \'2.1\', \'>=\') ? json_decode($customer_info[\'custom_field\'], true) : unserialize($customer_info[\'custom_field\']);\n }\n } else {\n // check firstname, lastname\n $errors = array_merge($errors, $this->validateUserData($this->request->post, $register_account));\n\n // check customer group id\n if (isset($this->request->post[\'customer_group_id\']) && is_array($this->config->get(\'config_customer_group_display\')) && in_array($this->request->post[\'customer_group_id\'], $this->config->get(\'config_customer_group_display\'))) {\n $order_data[\'customer_group_id\'] = $this->request->post[\'customer_group_id\'];\n } else {\n $order_data[\'customer_group_id\'] = $this->config->get(\'config_customer_group_id\');\n }\n\n if (!isset($this->request->post[\'account\'])) {\n $errors[\'account\'] = array_merge($errors, array(\'Does not account exists! Please check configuration\'));\n }\n\n // check passwords if register\n if (($register_account == \'register\') && isset($this->request->post[\'account\'])) {\n $errors = array_merge($errors, $this->validatePassword($this->request->post));\n }\n\n // check payment address\n $new_payment_address = $this->getAddressData($this->request->post, \'payment_\', \'payment_\');\n $order_data = array_replace($order_data, $new_payment_address);\n $errors = array_merge($errors, $this->validateAddressData($new_payment_address, \'payment_\', false));\n\n // add payment firstname and lastname\n $order_data[\'firstname\'] = $this->request->post[\'firstname\'];\n $order_data[\'lastname\'] = $this->request->post[\'lastname\'];\n $order_data[\'email\'] = $this->request->post[\'email\'];\n $order_data[\'telephone\'] = $this->request->post[\'telephone\'];\n $order_data[\'fax\'] = $this->request->post[\'fax\'];\n $order_data[\'custom_field\'] = $this->getProperty($this->request->post, \'custom_field\', array());\n $order_data[\'payment_firstname\'] = $order_data[\'firstname\'];\n $order_data[\'payment_lastname\'] = $order_data[\'lastname\'];\n\n // check delivery address\n if ($this->isShippingRequired()) {\n if (!$this->getProperty($this->request->post, \'shipping_address\')) {\n $new_shipping_address = $this->getAddressData($this->request->post, \'shipping_\', \'shipping_\');\n $order_data = array_replace($order_data, $new_shipping_address);\n $errors = array_merge($errors, $this->validateAddressData($new_shipping_address, \'shipping_\'));\n } else {\n $order_data = array_replace($order_data, $this->getAddressData($order_data, \'payment_\', \'shipping_\'));\n }\n }\n }\n\n // payment method\n if ($payment_method = $this->getProperty($this->session->data, \'payment_methods.\' . $this->getProperty($this->request->post, \'payment_method\') . \'.title\')) {\n $order_data[\'payment_method\'] = $payment_method;\n $order_data[\'payment_code\'] = $this->getProperty($this->request->post, \'payment_method\');\n } else {\n $errors[\'payment_method\'] = str_replace(\'&nbsp;\', \'\', strip_tags($this->language->get(\'error_no_payment\')));\n }\n\n // shipping method\n if ($this->isShippingRequired()) {\n $shipping = explode(\'.\', $this->getProperty($this->request->post, \'shipping_method\'));\n if (is_array($shipping) && count($shipping) > 1) {\n $shipping_method = $this->session->data[\'shipping_methods\'][$shipping[0]][\'quote\'][$shipping[1]];\n if ($shipping_method) {\n $order_data[\'shipping_method\'] = $shipping_method[\'title\'];\n $order_data[\'shipping_code\'] = $this->getProperty($this->request->post, \'shipping_method\');\n } else {\n $order_data[\'shipping_method\'] = \'no shipping method\';\n $errors[\'shipping_method\'] = str_replace(\'&nbsp;\', \'\', strip_tags($this->language->get(\'error_no_shipping\')));\n }\n } else {\n $order_data[\'shipping_method\'] = \'no shipping method\';\n $errors[\'shipping_method\'] = str_replace(\'&nbsp;\', \'\', strip_tags($this->language->get(\'error_no_shipping\')));\n }\n }\n\n // order totals\n $totals = array();\n $taxes = $this->cart->getTaxes();\n $total = 0;\n\n // Because __call can not keep var references so we put them into an array.\n $total_data = array(\n \'totals\' => &$totals,\n \'taxes\' => &$taxes,\n \'total\' => &$total\n );\n\n $this->load->model(\'extension/extension\');\n $results = $this->model_extension_extension->getExtensions(\'total\');\n \n $sort_order = array();\n\n foreach ($results as $key => $value) {\n $sort_order[$key] = $this->config->get($value[\'code\'] . \'_sort_order\');\n }\n\n array_multisort($sort_order, SORT_ASC, $results);\n\n foreach ($results as $result) {\n if ($this->config->get($result[\'code\'] . \'_status\')) {\n if (version_compare(VERSION, \'2.3\', \'<\')) {\n $this->load->model(\'total/\' . $result[\'code\']);\n } else {\n $this->load->model(\'extension/total/\' . $result[\'code\']);\n }\n\n if (version_compare(VERSION, \'2.2\', \'<\')) {\n $this->{\'model_total_\' . $result[\'code\']}->getTotal($totals, $total, $taxes);\n } else if (version_compare(VERSION, \'2.3\', \'<\')) {\n // We have to put the totals in an array so that they pass by reference.\n $this->{\'model_total_\' . $result[\'code\']}->getTotal($total_data);\n } else {\n // We have to put the totals in an array so that they pass by reference.\n $this->{\'model_extension_total_\' . $result[\'code\']}->getTotal($total_data);\n }\n }\n }\n\n $sort_order = array();\n\n foreach ($totals as $key => $value) {\n $sort_order[$key] = $value[\'sort_order\'];\n }\n\n array_multisort($sort_order, SORT_ASC, $totals);\n\n $order_data[\'totals\'] = $totals;\n $order_data[\'total\'] = $total;\n\n // order products\n $order_data[\'products\'] = array();\n\n foreach ($this->cart->getProducts() as $product) {\n $option_data = array();\n\n foreach ($product[\'option\'] as $option) {\n $option_data[] = array(\n \'product_option_id\' => $option[\'product_option_id\'],\n \'product_option_value_id\' => $option[\'product_option_value_id\'],\n \'option_id\' => $option[\'option_id\'],\n \'option_value_id\' => $option[\'option_value_id\'],\n \'name\' => $option[\'name\'],\n \'value\' => $option[\'value\'],\n \'type\' => $option[\'type\']\n );\n }\n\n $order_data[\'products\'][] = array(\n \'product_id\' => $product[\'product_id\'],\n \'name\' => $product[\'name\'],\n \'model\' => $product[\'model\'],\n \'option\' => $option_data,\n \'download\' => $product[\'download\'],\n \'quantity\' => $product[\'quantity\'],\n \'subtract\' => $product[\'subtract\'],\n \'price\' => $product[\'price\'],\n \'total\' => $product[\'total\'],\n \'tax\' => $this->tax->getTax($product[\'price\'], $product[\'tax_class_id\']),\n \'reward\' => $product[\'reward\']\n );\n }\n\n // Gift Voucher\n $order_data[\'vouchers\'] = array();\n\n if (!empty($this->session->data[\'vouchers\'])) {\n foreach ($this->session->data[\'vouchers\'] as $voucher) {\n $order_data[\'vouchers\'][] = array(\n \'description\' => $voucher[\'description\'],\n \'code\' => substr(md5(mt_rand()), 0, 10),\n \'to_name\' => $voucher[\'to_name\'],\n \'to_email\' => $voucher[\'to_email\'],\n \'from_name\' => $voucher[\'from_name\'],\n \'from_email\' => $voucher[\'from_email\'],\n \'voucher_theme_id\' => $voucher[\'voucher_theme_id\'],\n \'message\' => $voucher[\'message\'],\n \'amount\' => $voucher[\'amount\']\n );\n }\n }\n\n // comment + checkboxes\n $order_data[\'comment\'] = $this->getProperty($this->request->post, \'comment\');\n if ($setting_so_onepagecheckout_layout_setting[\'require_comment_status\'] == 1 && empty($order_data[\'comment\'])) {\n $errors[\'comment\'] = $this->language->get(\'error_comment\');\n }\n\n if (!$this->isLoggedIn() && $this->config->get(\'config_account_id\')) {\n $this->load->model(\'catalog/information\');\n\n $information_info = $this->model_catalog_information->getInformation($this->config->get(\'config_account_id\'));\n\n if ($information_info && !isset($this->request->post[\'privacy\'])) {\n $errors[\'privacy\'] = sprintf($this->language->get(\'error_agree\'), $information_info[\'title\']);\n }\n }\n\n if ($this->config->get(\'config_checkout_id\')) {\n $this->load->model(\'catalog/information\');\n\n $information_info = $this->model_catalog_information->getInformation($this->config->get(\'config_checkout_id\'));\n\n if ($information_info && !isset($this->request->post[\'agree\'])) {\n $errors[\'agree\'] = sprintf($this->language->get(\'error_agree\'), $information_info[\'title\']);\n }\n }\n\n if (isset($errors[\'agree\']) && empty($setting_so_onepagecheckout_layout_setting[\'show_term\'])) {\n unset($errors[\'agree\']);\n }\n\n if ($this->config->get(\'config_account_id\') == $this->config->get(\'config_checkout_id\')) {\n unset($errors[\'privacy\']);\n }\n\n $redirect = \'\';\n\n // update order\n $this->model_extension_module_so_onepagecheckout->setOrderData($order_data);\n\n if ($this->getProperty($this->request->get, \'saveOnly\') === \'true\') {\n header(\'Content-Type: application/json\');\n echo json_encode(array(\n \'order_data\'=> $order_data\n ));\n exit;\n }\n\n if (!$errors) {\n if ($this->isLoggedIn()) {\n // save new payment address\n if ($new_payment_address) {\n $this->model_account_address->addAddress($this->getAddressData($new_payment_address, \'payment_\'));\n }\n\n // save new shipping address\n if ($new_shipping_address && $new_shipping_address !== $new_payment_address) {\n $this->model_account_address->addAddress($this->getAddressData($new_shipping_address, \'shipping_\'));\n }\n\n $this->model_extension_module_so_onepagecheckout->updateCustomer();\n } else if ($register_account == \'register\') {\n $redirect = $this->registerAccount();\n $sql = \"UPDATE `\" . DB_PREFIX . \"order` SET customer_id = \'\" . (int)($this->customer->getId()) . \"\', customer_group_id = \'\" . (int)($this->customer->getGroupId()) . \"\' WHERE order_id = \'\" . (int)($this->session->data[\'order_id\']) . \"\'\";\n $this->db->query($sql);\n } else {\n $this->session->data[\'guest\'] = $this->getAddressData($order_data, \'payment_\');\n }\n }\n\n $this->session->data[\'so_checkout_account\'] = $this->getProperty($this->request->post, \'account\');\n $this->session->data[\'so_checkout_shipping_address\'] = $this->getProperty($this->request->post, \'shipping_address\', \'0\');\n\n // send response\n header(\'Content-Type: application/json\');\n echo json_encode(array(\n \'errors\' => $errors ? $errors : null,\n \'account_status\' => $this->isLoggedIn() ? 1 : 0,\n \'redirect\' => $redirect,\n \'redirect_cart\' => $redirect_cart,\n \'order_data\'=> $order_data\n ));\n exit;\n }\n\n private function validateAddressData($data, $key, $name = true) {\n $errors = array();\n\n if ($name) {\n // firstname\n if ((utf8_strlen(trim($data[$key . \'firstname\'])) < 1) || (utf8_strlen(trim($data[$key . \'firstname\'])) > 32)) {\n $errors[$key . \'firstname\'] = $this->language->get(\'error_firstname\');\n }\n\n // lastname\n if ((utf8_strlen(trim($data[$key . \'lastname\'])) < 1) || (utf8_strlen(trim($data[$key . \'lastname\'])) > 32)) {\n $errors[$key . \'lastname\'] = $this->language->get(\'error_lastname\');\n }\n }\n\n if ((utf8_strlen(trim($data[$key . \'address_1\'])) < 3) || (utf8_strlen(trim($data[$key . \'address_1\'])) > 128)) {\n $errors[$key . \'address_1\'] = $this->language->get(\'error_address_1\');\n }\n\n if ((utf8_strlen($data[$key . \'city\']) < 2) || (utf8_strlen($data[$key . \'city\']) > 32)) {\n $errors[$key . \'city\'] = $this->language->get(\'error_city\');\n }\n\n $country_info = $this->model_localisation_country->getCountry($data[$key . \'country_id\']);\n\n if ($country_info && $country_info[\'postcode_required\'] && (utf8_strlen(trim($data[$key . \'postcode\'])) < 2 || utf8_strlen(trim($data[$key . \'postcode\'])) > 10)) {\n $errors[$key . \'postcode\'] = $this->language->get(\'error_postcode\');\n }\n\n if ($data[$key . \'country_id\'] == \'\') {\n $errors[$key . \'country\'] = $this->language->get(\'error_country\');\n }\n\n if (!isset($data[$key . \'zone_id\']) || $data[$key . \'zone_id\'] == \'\' || !is_numeric($data[$key . \'zone_id\'])) {\n $errors[$key . \'zone\'] = $this->language->get(\'error_zone\');\n }\n\n // Custom field validation\n $custom_fields = $this->model_extension_module_so_onepagecheckout->getCustomFields();\n foreach ($custom_fields as $custom_field) {\n if (($custom_field[\'location\'] == \'address\') && $custom_field[\'required\'] && empty($data[$key . \'custom_field\'][$custom_field[\'custom_field_id\']])) {\n $errors[$key . \'custom_field\' . $custom_field[\'custom_field_id\']] = sprintf($this->language->get(\'error_custom_field\'), $custom_field[\'name\']);\n }\n }\n \n return $errors;\n }\n\n private function validateUserData($data, $register) {\n $errors = array();\n\n // firstname\n if ((utf8_strlen(trim($data[\'firstname\'])) < 1) || (utf8_strlen(trim($data[\'firstname\'])) > 32)) {\n $errors[\'firstname\'] = $this->language->get(\'error_firstname\');\n }\n\n // lastname\n if ((utf8_strlen(trim($data[\'lastname\'])) < 1) || (utf8_strlen(trim($data[\'lastname\'])) > 32)) {\n $errors[\'lastname\'] = $this->language->get(\'error_lastname\');\n }\n\n // email\n if ((utf8_strlen($data[\'email\']) > 96) || !preg_match(\'/^[^\\@]+@.*.[a-z]{2,15}$/i\', $data[\'email\'])) {\n $errors[\'email\'] = $this->language->get(\'error_email\');\n } else if ($register && $this->model_account_customer->getTotalCustomersByEmail($data[\'email\'])) {\n $errors[\'email\'] = $this->language->get(\'error_exists\');\n }\n\n // telephone\n if ((utf8_strlen($data[\'telephone\']) < 3) || (utf8_strlen($data[\'telephone\']) > 32)) {\n $errors[\'telephone\'] = $this->language->get(\'error_telephone\');\n }\n\n // Custom field validation\n $custom_fields = $this->model_extension_module_so_onepagecheckout->getCustomFields();\n\n foreach ($custom_fields as $custom_field) {\n if (($custom_field[\'location\'] == \'account\') && $custom_field[\'required\'] && empty($data[\'custom_field\'][$custom_field[\'custom_field_id\']])) {\n $errors[\'custom_field\' . $custom_field[\'custom_field_id\']] = sprintf($this->language->get(\'error_custom_field\'), $custom_field[\'name\']);\n }\n }\n \n return $errors;\n }\n\n private function validatePassword($data) {\n $errors = array();\n\n if ((utf8_strlen($data[\'password\']) < 4) || (utf8_strlen($data[\'password\']) > 20)) {\n $errors[\'password\'] = $this->language->get(\'error_password\');\n }\n\n if ($data[\'confirm\'] != $data[\'password\']) {\n $errors[\'confirm\'] = $this->language->get(\'error_confirm\');\n }\n\n return $errors;\n }\n\n private function getAddressData($array, $i_address = \'\', $prefix = \'\') {\n $keys = array(\n \'address_1\',\n \'address_2\',\n \'address_id\',\n \'address_format\',\n \'city\',\n \'company\',\n \'company_id\',\n \'country\',\n \'country_id\',\n \'firstname\',\n \'lastname\',\n \'method\',\n \'postcode\',\n \'tax_id\',\n \'zone\',\n \'zone_id\'\n );\n\n $result = array();\n\n foreach ($keys as $k) {\n $result[$prefix . $k] = $this->getProperty($array, $i_address . $k, \'\');\n }\n\n if ($result[$prefix . \'country_id\']) {\n $country_info = $this->model_localisation_country->getCountry($result[$prefix . \'country_id\']);\n if ($country_info) {\n if (!$result[$prefix . \'country\']) {\n $result[$prefix . \'country\'] = $country_info[\'name\'];\n }\n $result[$prefix . \'address_format\'] = $country_info[\'address_format\'];\n }\n }\n\n if (!$result[$prefix . \'zone\'] && $result[$prefix . \'zone_id\']) {\n $zone_info = $this->model_localisation_zone->getZone($result[$prefix . \'zone_id\']);\n if ($zone_info) {\n $result[$prefix . \'zone\'] = $zone_info[\'name\'];\n }\n }\n\n $result[$prefix . \'custom_field\'] = $this->getProperty($array, $i_address . \'custom_field\', array());\n \n return $result;\n }\n\n private function registerAccount() {\n $redirect = \'\';\n\n $data = $this->getAddressData($this->request->post, \'payment_\');\n\n $data = array_merge($data, array(\n \'firstname\' => $this->getProperty($this->request->post, \'firstname\'),\n \'lastname\' => $this->getProperty($this->request->post, \'lastname\'),\n \'customer_group_id\'=> $this->getProperty($this->request->post, \'customer_group_id\', $this->config->get(\'config_customer_group_id\')),\n \'custom_field\' => array(\n \'account\' => $this->getProperty($this->request->post, \'custom_field\'),\n \'address\' => $this->getProperty($this->request->post, \'payment_custom_field\'),\n ),\n \'email\' => $this->getProperty($this->request->post, \'email\'),\n \'telephone\' => $this->getProperty($this->request->post, \'telephone\'),\n \'fax\' => $this->getProperty($this->request->post, \'fax\'),\n \'password\' => $this->getProperty($this->request->post, \'password\'),\n \'newsletter\' => $this->getProperty($this->request->post, \'newsletter\')\n ));\n\n $customer_id = $this->model_account_customer->addCustomer($data);\n\n // Clear any previous login attempts for unregistered accounts.\n $this->model_account_customer->deleteLoginAttempts($data[\'email\']);\n \n $this->session->data[\'account\'] = \'register\';\n\n $customer_group_info = $this->model_account_customer_group->getCustomerGroup($this->getProperty($this->request->post, \'customer_group_id\', $this->config->get(\'config_customer_group_id\')));\n\n if ($customer_group_info && !$customer_group_info[\'approval\']) {\n $this->customer->login($data[\'email\'], $data[\'password\']);\n\n if ($this->getProperty($this->request->post, \'shipping_address\') != \'1\') {\n $this->model_account_address->addAddress($this->getAddressData($this->request->post, \'shipping_\'));\n }\n\n // Add to activity log\n $activity_data = array(\n \'customer_id\' => $customer_id,\n \'name\' => $data[\'firstname\'] . \' \' . $data[\'lastname\']\n );\n\n $this->model_account_activity->addActivity(\'register\', $activity_data);\n }\n else {\n $redirect = $this->url->link(\'account/success\');\n }\n\n return $redirect;\n }\n\n public function login() {\n $json = array();\n\n if ($this->customer->isLogged()) {\n $json[\'redirect\'] = $this->url->link(\'checkout/checkout\', \'\', true);\n }\n\n if ((!$this->cart->hasProducts() && empty($this->session->data[\'vouchers\'])) || (!$this->cart->hasStock() && !$this->config->get(\'config_stock_checkout\'))) {\n $json[\'redirect\'] = $this->url->link(\'checkout/cart\', \'\', true);\n }\n\n if (!$json) {\n $this->load->model(\'account/customer\');\n\n // Check how many login attempts have been made.\n $login_info = $this->model_account_customer->getLoginAttempts($this->request->post[\'email\']);\n\n if ($login_info && ($login_info[\'total\'] >= $this->config->get(\'config_login_attempts\')) && strtotime(\'-1 hour\') < strtotime($login_info[\'date_modified\'])) {\n $json[\'error\'][\'warning\'] = $this->language->get(\'error_attempts\');\n }\n\n // Check if customer has been approved.\n $customer_info = $this->model_account_customer->getCustomerByEmail($this->request->post[\'email\']);\n\n if ($customer_info && !$customer_info[\'approved\']) {\n $json[\'error\'][\'warning\'] = $this->language->get(\'error_approved\');\n }\n\n if (!isset($json[\'error\'])) {\n if (!$this->customer->login($this->request->post[\'email\'], $this->request->post[\'password\'])) {\n $json[\'error\'][\'warning\'] = $this->language->get(\'error_login\');\n\n $this->model_account_customer->addLoginAttempt($this->request->post[\'email\']);\n } else {\n $this->model_account_customer->deleteLoginAttempts($this->request->post[\'email\']);\n }\n }\n }\n\n if (!$json) {\n unset($this->session->data[\'guest\']);\n\n $this->load->model(\'account/address\');\n\n $address_info = $this->model_account_address->getAddress($this->customer->getAddressId());\n\n if ($this->config->get(\'config_tax_customer\') == \'payment\') {\n $this->session->data[\'payment_address\'] = $address_info;\n }\n\n if ($this->config->get(\'config_tax_customer\') == \'shipping\') {\n $this->session->data[\'shipping_address\'] = $address_info;\n }\n\n $this->model_extension_module_so_onepagecheckout->setAddress(\'shipping\', $address_info);\n $this->model_extension_module_so_onepagecheckout->setAddress(\'payment\', $address_info);\n $this->model_extension_module_so_onepagecheckout->save();\n\n $json[\'redirect\'] = $this->url->link(\'checkout/checkout\', \'\', true);\n\n // Add to activity log\n $this->load->model(\'account/activity\');\n\n $activity_data = array(\n \'customer_id\' => $this->customer->getId(),\n \'name\' => $this->customer->getFirstName() . \' \' . $this->customer->getLastName()\n );\n\n $this->model_account_activity->addActivity(\'login\', $activity_data);\n }\n \n $this->response->addHeader(\'Content-Type: application/json\');\n $this->response->setOutput(json_encode($json));\n }\n ]]></add>\n </operation>\n \n <operation error=\"log\">\n <search ><![CDATA[$data[\'breadcrumbs\'] = array();]]></search>\n <add position=\"before\"><![CDATA[\n $this->load->model(\'setting/setting\');\n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\');\n if (isset($setting_so_onepagecheckout) && count($setting_so_onepagecheckout)>0) {\n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\']; \n if (isset($setting_so_onepagecheckout_general[\'so_onepagecheckout_enabled\']) && $setting_so_onepagecheckout_general[\'so_onepagecheckout_enabled\']) {\n $this->document->addStyle(\'catalog/view/javascript/so_onepagecheckout/css/so_onepagecheckout.css\');\n $this->document->addScript(\'catalog/view/javascript/so_onepagecheckout/js/so_onepagecheckout.js\');\n $this->load->model(\'localisation/country\');\n $data[\'countries\'] = $this->model_localisation_country->getCountries();\n }\n }\n ]]></add>\n </operation>\n \n <operation error=\"log\">\n <search ><![CDATA[$this->response->setOutput($this->load->view(\'checkout/checkout\', $data));]]></search>\n <add position=\"before\"><![CDATA[\n $this->load->model(\'setting/setting\');\n $setting_so_onepagecheckout = $this->model_setting_setting->getSetting(\'so_onepagecheckout\');\n if (isset($setting_so_onepagecheckout) && count($setting_so_onepagecheckout)>0) {\n $setting_so_onepagecheckout_general = $setting_so_onepagecheckout[\'so_onepagecheckout_general\'];\n $setting_so_onepagecheckout_layout_setting = $setting_so_onepagecheckout[\'so_onepagecheckout_layout_setting\'];\n\n if (isset($setting_so_onepagecheckout_general[\'so_onepagecheckout_enabled\']) && $setting_so_onepagecheckout_general[\'so_onepagecheckout_enabled\']) {\n if (isset($setting_so_onepagecheckout_layout_setting[\'so_onepagecheckout_account_open\']) && !empty($setting_so_onepagecheckout_layout_setting[\'so_onepagecheckout_account_open\'])) {\n $data[\'default_auth\'] = $setting_so_onepagecheckout_layout_setting[\'so_onepagecheckout_account_open\'];\n }\n else {\n $data[\'default_auth\'] = $this->getProperty($this->session->data, \'so_checkout_account\', \'register\');\n }\n\n $data[\'setting_so_onepagecheckout\'] = $setting_so_onepagecheckout;\n $data[\'setting_so_onepagecheckout_general\'] = $setting_so_onepagecheckout_general;\n $data[\'setting_so_onepagecheckout_layout_setting\'] = $setting_so_onepagecheckout_layout_setting;\n \n $data[\'text_register\'] = $this->language->get(\'text_register\');\n $data[\'text_guest\'] = $this->language->get(\'text_guest\');\n $data[\'entry_email\'] = $this->language->get(\'entry_email\');\n $data[\'entry_password\'] = $this->language->get(\'entry_password\');\n $data[\'text_forgotten\'] = $this->language->get(\'text_forgotten\');\n $data[\'text_loading\'] = $this->language->get(\'text_loading\');\n $data[\'button_login\'] = $this->language->get(\'button_login\');\n $data[\'text_i_am_returning_customer\'] = $this->language->get(\'text_i_am_returning_customer\');\n $data[\'text_returning_customer\'] = $this->language->get(\'text_returning_customer\');\n $data[\'text_checkout_create_account_login\'] = $this->language->get(\'text_checkout_create_account_login\');\n\n $data[\'text_your_details\'] = $this->language->get(\'text_your_details\');\n $data[\'entry_customer_group\'] = $this->language->get(\'entry_customer_group\');\n $data[\'entry_firstname\'] = $this->language->get(\'entry_firstname\');\n $data[\'entry_lastname\'] = $this->language->get(\'entry_lastname\');\n $data[\'entry_telephone\'] = $this->language->get(\'entry_telephone\');\n $data[\'entry_fax\'] = $this->language->get(\'entry_fax\');\n $data[\'text_your_password\'] = $this->language->get(\'text_your_password\');\n $data[\'entry_confirm\'] = $this->language->get(\'entry_confirm\');\n $data[\'text_your_address\'] = $this->language->get(\'text_your_address\');\n $data[\'entry_shipping\'] = $this->language->get(\'entry_shipping\');\n $data[\'text_confirm_order\'] = $this->language->get(\'text_confirm_order\');\n\n // address data\n if ($this->isLoggedIn()) {\n $data[\'is_logged_in\'] = true;\n $data[\'payment_address\'] = $this->renderAddressForm(\'payment\');\n $data[\'shipping_address\'] = $this->renderAddressForm(\'shipping\');\n $data[\'register_form\'] = \'\';\n } else {\n $data[\'is_logged_in\'] = false;\n $data[\'allow_guest_checkout\'] = $this->allowGuestCheckout();\n $data[\'register_form\'] = $this->renderRegisterForm();\n }\n\n // shipping\n if ($this->isShippingRequired() && $setting_so_onepagecheckout_layout_setting[\'delivery_method_status\']) {\n $data[\'is_shipping_required\'] = true;\n $data[\'shipping_methods\'] = $this->shipping(true);\n } else {\n $data[\'is_shipping_required\'] = false;\n }\n\n // payment\n $data[\'payment_methods\'] = $this->payment(true);\n\n // coupon + voucher\n $data[\'coupon_voucher_reward\'] = $this->renderCouponVoucherReward();\n\n // cart\n if (isset($setting_so_onepagecheckout_layout_setting[\'shopping_cart_status\']) && $setting_so_onepagecheckout_layout_setting[\'shopping_cart_status\']) {\n $data[\'cart\'] = $this->cart(true);\n }\n else {\n $data[\'cart\'] = \'\';\n }\n\n // checkboxes\n if (!$this->isLoggedIn() && $this->config->get(\'config_account_id\')) {\n $this->load->model(\'catalog/information\');\n\n $information_info = $this->model_catalog_information->getInformation($this->config->get(\'config_account_id\'));\n\n if ($information_info) {\n $data[\'text_privacy\'] = sprintf($this->language->get(\'text_agree\'), $this->url->link(\'information/information/agree\', \'information_id=\' . $this->config->get(\'config_account_id\'), true), $information_info[\'title\'], $information_info[\'title\']);\n } else {\n $data[\'text_privacy\'] = \'\';\n }\n } else {\n $data[\'text_privacy\'] = \'\';\n }\n\n if ($this->config->get(\'config_checkout_id\')) {\n $this->load->model(\'catalog/information\');\n\n $information_info = $this->model_catalog_information->getInformation($this->config->get(\'config_checkout_id\'));\n\n if ($information_info) {\n $data[\'text_agree\'] = sprintf($this->language->get(\'text_agree\'), $this->url->link(\'information/information/agree\', \'information_id=\' . $this->config->get(\'config_checkout_id\'), true), $information_info[\'title\'], $information_info[\'title\']);\n } else {\n $data[\'text_agree\'] = \'\';\n }\n } else {\n $data[\'text_agree\'] = \'\';\n }\n\n if ($data[\'text_privacy\'] === $data[\'text_agree\']) {\n $data[\'text_privacy\'] = \'\';\n }\n\n $data[\'text_comments\'] = $this->language->get(\'text_comments\');\n\n if ($this->isLoggedIn()) {\n $data[\'entry_newsletter\'] = false;\n } else {\n $data[\'entry_newsletter\'] = sprintf($this->language->get(\'entry_newsletter\'), $this->config->get(\'config_name\'));\n }\n\n $data[\'comment\'] = $this->model_extension_module_so_onepagecheckout->getComment();\n\n if (isset($this->session->data[\'error\'])) {\n $data[\'error_warning\'] = $this->session->data[\'error\'];\n unset($this->session->data[\'error\']);\n } else {\n $data[\'error_warning\'] = \'\';\n }\n\n $data[\'customer_groups\'] = array();\n if (is_array($this->config->get(\'config_customer_group_display\'))) {\n $this->load->model(\'account/customer_group\');\n \n $customer_groups = $this->model_account_customer_group->getCustomerGroups();\n \n foreach ($customer_groups as $customer_group) {\n if (in_array($customer_group[\'customer_group_id\'], $this->config->get(\'config_customer_group_display\'))) {\n $data[\'customer_groups\'][] = $customer_group;\n }\n }\n }\n if (isset($this->request->post[\'customer_group_id\'])) {\n $data[\'customer_group_id\'] = $this->request->post[\'customer_group_id\'];\n } else {\n $data[\'customer_group_id\'] = $this->config->get(\'config_customer_group_id\');\n }\n \n \n \n //Get cart\n $this->load->model(\'tool/image\');\n $this->load->model(\'tool/upload\');\n \n $data[\'products\'] = array();\n $products = $this->cart->getProducts();\n foreach ($products as $product) {\n $product_total = 0;\n \n foreach ($products as $product_2) {\n if ($product_2[\'product_id\'] == $product[\'product_id\']) {\n $product_total += $product_2[\'quantity\'];\n }\n }\n \n if ($product[\'minimum\'] > $product_total) {\n $data[\'error_warning\'] = sprintf($this->language->get(\'error_minimum\'), $product[\'name\'], $product[\'minimum\']);\n }\n \n if ($product[\'image\']) {\n $image = $this->model_tool_image->resize($product[\'image\'], $this->config->get($this->config->get(\'config_theme\') . \'_image_cart_width\'), $this->config->get($this->config->get(\'config_theme\') . \'_image_cart_height\'));\n } else {\n $image = \'\';\n }\n \n $option_data = array();\n \n foreach ($product[\'option\'] as $option) {\n if ($option[\'type\'] != \'file\') {\n $value = $option[\'value\'];\n } else {\n $upload_info = $this->model_tool_upload->getUploadByCode($option[\'value\']);\n \n if ($upload_info) {\n $value = $upload_info[\'name\'];\n } else {\n $value = \'\';\n }\n }\n \n $option_data[] = array(\n \'name\' => $option[\'name\'],\n \'value\' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . \'..\' : $value)\n );\n }\n \n // Display prices\n if ($this->customer->isLogged() || !$this->config->get(\'config_customer_price\')) {\n $unit_price = $this->tax->calculate($product[\'price\'], $product[\'tax_class_id\'], $this->config->get(\'config_tax\'));\n \n $price = $this->currency->format($unit_price, $this->session->data[\'currency\']);\n $total = $this->currency->format($unit_price * $product[\'quantity\'], $this->session->data[\'currency\']);\n } else {\n $price = false;\n $total = false;\n }\n \n $recurring = \'\';\n \n if ($product[\'recurring\']) {\n $frequencies = array(\n \'day\' => $this->language->get(\'text_day\'),\n \'week\' => $this->language->get(\'text_week\'),\n \'semi_month\' => $this->language->get(\'text_semi_month\'),\n \'month\' => $this->language->get(\'text_month\'),\n \'year\' => $this->language->get(\'text_year\'),\n );\n \n if ($product[\'recurring\'][\'trial\']) {\n $recurring = sprintf($this->language->get(\'text_trial_description\'), $this->currency->format($this->tax->calculate($product[\'recurring\'][\'trial_price\'] * $product[\'quantity\'], $product[\'tax_class_id\'], $this->config->get(\'config_tax\')), $this->session->data[\'currency\']), $product[\'recurring\'][\'trial_cycle\'], $frequencies[$product[\'recurring\'][\'trial_frequency\']], $product[\'recurring\'][\'trial_duration\']) . \' \';\n }\n \n if ($product[\'recurring\'][\'duration\']) {\n $recurring .= sprintf($this->language->get(\'text_payment_description\'), $this->currency->format($this->tax->calculate($product[\'recurring\'][\'price\'] * $product[\'quantity\'], $product[\'tax_class_id\'], $this->config->get(\'config_tax\')), $this->session->data[\'currency\']), $product[\'recurring\'][\'cycle\'], $frequencies[$product[\'recurring\'][\'frequency\']], $product[\'recurring\'][\'duration\']);\n } else {\n $recurring .= sprintf($this->language->get(\'text_payment_cancel\'), $this->currency->format($this->tax->calculate($product[\'recurring\'][\'price\'] * $product[\'quantity\'], $product[\'tax_class_id\'], $this->config->get(\'config_tax\')), $this->session->data[\'currency\']), $product[\'recurring\'][\'cycle\'], $frequencies[$product[\'recurring\'][\'frequency\']], $product[\'recurring\'][\'duration\']);\n }\n }\n \n $data[\'products\'][] = array(\n \'cart_id\' => $product[\'cart_id\'],\n \'thumb\' => $image,\n \'name\' => $product[\'name\'],\n \'model\' => $product[\'model\'],\n \'option\' => $option_data,\n \'recurring\' => $recurring,\n \'quantity\' => $product[\'quantity\'],\n \'stock\' => $product[\'stock\'] ? true : !(!$this->config->get(\'config_stock_checkout\') || $this->config->get(\'config_stock_warning\')),\n \'reward\' => ($product[\'reward\'] ? sprintf($this->language->get(\'text_points\'), $product[\'reward\']) : \'\'),\n \'price\' => $price,\n \'total\' => $total,\n \'href\' => $this->url->link(\'product/product\', \'product_id=\' . $product[\'product_id\'])\n );\n }\n \n // Gift Voucher\n $data[\'vouchers\'] = array();\n \n if (!empty($this->session->data[\'vouchers\'])) {\n foreach ($this->session->data[\'vouchers\'] as $key => $voucher) {\n $data[\'vouchers\'][] = array(\n \'key\' => $key,\n \'description\' => $voucher[\'description\'],\n \'amount\' => $this->currency->format($voucher[\'amount\'], $this->session->data[\'currency\']),\n \'remove\' => $this->url->link(\'checkout/cart\', \'remove=\' . $key)\n );\n }\n }\n \n // Totals\n $this->load->model(\'extension/extension\');\n \n $totals = array();\n $taxes = $this->cart->getTaxes();\n $total = 0;\n \n // Because __call can not keep var references so we put them into an array. \n $total_data = array(\n \'totals\' => &$totals,\n \'taxes\' => &$taxes,\n \'total\' => &$total\n );\n \n // Display prices\n if ($this->customer->isLogged() || !$this->config->get(\'config_customer_price\')) {\n $sort_order = array();\n \n $results = $this->model_extension_extension->getExtensions(\'total\');\n \n foreach ($results as $key => $value) {\n $sort_order[$key] = $this->config->get($value[\'code\'] . \'_sort_order\');\n }\n \n array_multisort($sort_order, SORT_ASC, $results);\n \n foreach ($results as $result) {\n if ($this->config->get($result[\'code\'] . \'_status\')) {\n $this->load->model(\'extension/total/\' . $result[\'code\']);\n \n // We have to put the totals in an array so that they pass by reference.\n $this->{\'model_extension_total_\' . $result[\'code\']}->getTotal($total_data);\n }\n }\n \n $sort_order = array();\n \n foreach ($totals as $key => $value) {\n $sort_order[$key] = $value[\'sort_order\'];\n }\n \n array_multisort($sort_order, SORT_ASC, $totals);\n }\n \n $data[\'totals\'] = array();\n \n foreach ($totals as $total) {\n $data[\'totals\'][] = array(\n \'title\' => $total[\'title\'],\n \'text\' => $this->currency->format($total[\'value\'], $this->session->data[\'currency\'])\n );\n }\n }\n }\n ]]></add>\n </operation>\n \n <operation error=\"log\">\n <search ><![CDATA[$this->response->setOutput($this->load->view(\'checkout/checkout\', $data));]]></search>\n <add position=\"replace\"><![CDATA[\n if (isset($setting_so_onepagecheckout_general[\'so_onepagecheckout_enabled\']) && $setting_so_onepagecheckout_general[\'so_onepagecheckout_enabled\']) {\n $data[\'forgotten\'] = $this->url->link(\'account/forgotten\', \'\', true);\n $this->model_extension_module_so_onepagecheckout->save();\n if ($setting_so_onepagecheckout_general[\'so_onepagecheckout_layout\'] == 1)\n $this->response->setOutput($this->load->view(\'extension/module/so_onepagecheckout/default\', $data));\n else if ($setting_so_onepagecheckout_general[\'so_onepagecheckout_layout\'] == 2)\n $this->response->setOutput($this->load->view(\'extension/module/so_onepagecheckout/default2\', $data));\n }\n else {\n $this->response->setOutput($this->load->view(\'checkout/checkout\', $data));\n }\n ]]></add>\n </operation>\n </file>\n</modification>\n', 1, '2017-04-14 09:59:16');
INSERT INTO `wbc_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(10, 'CKEditor Full v4.6.2', 'ckeditor_full_package_sk', 'Spyridon Kazanas', '1.1.2.7', 'http://www.opencart.com/index.php?route=extension/extension/info&extension_id=21311', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<modification>\n    <name>CKEditor Full v4.6.2</name>\n    <version>1.1.2.7</version>\n    <author>Spyridon Kazanas</author>\n    <link><![CDATA[http://www.opencart.com/index.php?route=extension/extension/info&extension_id=21311]]></link>\n    <code>ckeditor_full_package_sk</code>\n\n    <file path=\"admin/view/template/common/header.tpl\">\n        <operation>\n            <search><![CDATA[<title><?php echo $title; ?></title>]]></search>\n            <add position=\"before\"><![CDATA[<script>\n  var ck_settings = {\n    language : \'<?php echo $lang;?>\',\n    skin : \'<?php echo $ckeditorfull_skin;?>\',\n    height : \'<?php echo $ckeditorfull_height;?>\',\n    apikey : \'<?php echo $ckeditorfull_apikey;?>\',\n    acf : \'<?php echo $ckeditorfull_acf;?>\',\n    base : \'<?php echo $base;?>\'\n  };\n</script>]]></add>\n        </operation>\n    </file>\n\n    <file path=\"admin/controller/common/header.php\">\n        <operation>\n            <search><![CDATA[$data[\'description\'] = $this->document->getDescription();]]></search>\n            <add position=\"before\"><![CDATA[		$data[\'ckeditorfull_skin\'] = $this->config->get(\'ckeditorfull_skin\');\n		$data[\'ckeditorfull_height\'] = $this->config->get(\'ckeditorfull_height\');\n		$data[\'ckeditorfull_apikey\'] = $this->config->get(\'ckeditorfull_apikey\');\n		$data[\'ckeditorfull_acf\'] = $this->config->get(\'ckeditorfull_acf\');]]></add>\n        </operation>\n    </file>\n\n    <file path=\"admin/controller/common/filemanager.php\">\n        <operation>\n            <search><![CDATA[// Return the thumbnail for the file manager to show a thumbnail]]></search>\n            <add position=\"before\"><![CDATA[		// Return the CKEditor callback function\n		if (isset($this->request->get[\'CKEditorFuncNum\'])) {\n			$data[\'CKEditorFuncNum\'] = $this->request->get[\'CKEditorFuncNum\'];\n		} else {\n			$data[\'CKEditorFuncNum\'] = \'\';\n		}]]></add>\n        </operation>\n        <operation>\n            <search><![CDATA[{jpg,jpeg,png,gif,JPG,JPEG,PNG,GIF}]]></search>\n            <add position=\"replace\"><![CDATA[{jpg,jpeg,png,gif,pdf,mp4,webm,ogv,zip,xls,xlsx,doc,docx,ppt,pptx,odt,ods,odp,JPG,JPEG,PNG,GIF,PDF,MP4,WEBM,OGV,ZIP,XLS,DOC,PPT,ODT,ODS,ODP}]]></add>\n        </operation>\n        <operation>\n            <search><![CDATA[$this->model_tool_image->resize(utf8_substr($image, utf8_strlen(DIR_IMAGE)), 100, 100)]]></search>\n            <add position=\"replace\"><![CDATA[$thumb]]></add>\n        </operation>\n        <operation>\n            <search><![CDATA[				$data[\'images\'][] = array(]]></search>\n            <add position=\"before\"><![CDATA[				$extraextensions = array(\'xls\', \'xlsx\', \'doc\', \'docx\', \'ppt\', \'pptx\', \'odt\', \'ods\', \'odp\', \'zip\', \'pdf\', \'mp4\', \'webm\', \'ogv\');\n				$extension = strtolower(pathinfo(utf8_substr($image, utf8_strlen(DIR_IMAGE)), PATHINFO_EXTENSION));\n				if (in_array($extension, $extraextensions)) {\n					$thumb = $this->model_tool_image->resize($extension . \"icon.png\", 100, 100);\n				} else {\n					$thumb = $this->model_tool_image->resize(utf8_substr($image, utf8_strlen(DIR_IMAGE)), 100, 100);\n				}]]></add>\n        </operation>\n        <operation>\n            <search><![CDATA[\'png\']]></search>\n            <add position=\"after\"><![CDATA[,\'xls\', \'xlsx\', \'doc\', \'docx\', \'ppt\', \'pptx\', \'odt\', \'ods\', \'odp\', \'zip\', \'pdf\', \'mp4\', \'webm\', \'ogv\']]></add>\n        </operation>\n        <operation>\n            <search><![CDATA[\'image/gif\']]></search>\n            <add position=\"after\"><![CDATA[,\n						\'application/vnd.ms-excel\',\n						\'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet\',\n						\'application/msword\',\n						\'application/vnd.openxmlformats-officedocument.wordprocessingml.document\',\n						\'application/vnd.ms-powerpoint\',\n						\'application/vnd.openxmlformats-officedocument.presentationml.presentation\',\n						\'application/vnd.oasis.opendocument.text\',\n						\'application/vnd.oasis.opendocument.spreadsheet\',\n						\'application/vnd.oasis.opendocument.presentation\',\n						\'application/zip\',\n						\'application/pdf\',\n						\'video/mp4\',\n						\'video/webm\',\n						\'video/ogg\']]></add>\n        </operation>\n    </file>\n    <file path=\"admin/view/template/common/filemanager.tpl\">\n            <operation>\n            <search index=\"0\"><![CDATA[<script type=\"text/javascript\"><!--]]></search>\n            <add position=\"after\"><![CDATA[\n<?php if ($CKEditorFuncNum != \'\') { ?>\nCKEditorFuncNum=\'<?php echo $CKEditorFuncNum; ?>\';\n<?php }?>\n\n$(\'#modal-image\').on(\'hidden.bs.modal\', function () {\n	if (typeof CKEditorFuncNum === \'undefined\') {\n	} else {\n		delete CKEditorFuncNum;\n		$(\'#modal-image\').remove();\n	}\n});\n]]></add>\n        </operation>\n        <operation>\n            <search><![CDATA[$(\'a.thumbnail\').on(\'click\', function(e) {]]></search>\n            <add position=\"after\" offset=\"2\"><![CDATA[\n	if (typeof CKEditorFuncNum === \'undefined\') {\n	} else {\n		window.CKEDITOR.tools.callFunction(CKEditorFuncNum,$(this).attr(\'href\'));\n		delete CKEditorFuncNum;\n		$(\'#modal-image\').modal(\'hide\');\n		$(\'#modal-image\').remove();\n		return;\n	}]]></add>\n        </operation>\n    </file>\n</modification>\n', 1, '2017-05-25 15:37:06'),
(11, 'So Mobile', 'so-mobile', 'OpenCartWorks', '1.0.0', 'http://www.opencartworks.com/', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<modification>\r\n	<name><![CDATA[So Mobile]]></name>\r\n	<code>so-mobile</code>\r\n    <version><![CDATA[1.0.0]]></version>\r\n    <author><![CDATA[OpenCartWorks]]></author>\r\n	<link>http://www.opencartworks.com/</link>\r\n	<!--Catalog/controller/common-->\r\n	<file path=\"catalog/controller/common/home.php\">\r\n		<operation  >\r\n			<search ><![CDATA[public function index()]]></search>\r\n			<add position=\"after\"><![CDATA[$data[\'mobile\'] = $this->config->get(\'mobile_general\');\r\n				if($this->session->data[\'device\']==\'mobile\' && $data[\'mobile\'][\'platforms_mobile\']){\r\n					return $this->response->redirect($this->url->link(\'mobile/home\'));\r\n				}else{\r\n		]]></add>\r\n		</operation>\r\n		<operation  >\r\n		<search ><![CDATA[$this->response->setOutput($this->load->view(\'common/home\', $data));]]></search>\r\n			<add position=\"replace\"><![CDATA[\r\n				return $this->response->setOutput($this->load->view(\'common/home\', $data));\r\n			}\r\n			]]></add>\r\n	   </operation>\r\n	</file>\r\n	\r\n	<file path=\"catalog/controller/common/header.php\">\r\n		<operation  >\r\n			<search ><![CDATA[$data[\'language\'] = $this->load->controller(\'common/language\')]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				$this->load->language(\'extension/soconfig/mobile\');\r\n				$data[\'objlang\'] = $this->language;\r\n				$data[\'menu_search\'] = $this->url->link(\'product/search\', \'\', true);\r\n				$data[\'mobile\'] = $this->config->get(\'mobile_general\');\r\n				$data[\'text_items\'] = sprintf($this->language->get(\'text_itemcount\'), $this->cart->countProducts() + (isset($this->session->data[\'vouchers\']) ? count($this->session->data[\'vouchers\']) : 0));\r\n				if($this->session->data[\'device\']==\'mobile\'){\r\n					$data[\'home\'] = $this->url->link(\'mobile/home\');\r\n				}else{\r\n					$data[\'home\'] = $this->url->link(\'common/home\');\r\n				}\r\n				if(isset($this->request->get[\'layoutmobile\'])) $data[\'layoutmobile\'] = $this->request->get[\'layoutmobile\'];\r\n		]]></add>\r\n		</operation>\r\n	</file>\r\n	\r\n	<file path=\"catalog/controller/common/footer.php\">\r\n		<operation>\r\n			<search ><![CDATA[return $this->load->view(\'common/footer\', $data); ]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				// Menu Mobile\r\n				$this->load->model(\'catalog/category\');\r\n				$this->load->model(\'catalog/product\');\r\n				$this->load->language(\'extension/soconfig/mobile\');\r\n				$data[\'objlang\'] = $this->language;\r\n				$data[\'categories\'] = array();\r\n				$data[\'mobile\'] = $this->config->get(\'mobile_general\');\r\n				$data[\'text_account\'] = $this->language->get(\'text_account\');\r\n				$data[\'text_register\'] = $this->language->get(\'text_register\');\r\n				$data[\'text_login\'] = $this->language->get(\'text_login\');\r\n				\r\n				$categories = $this->model_catalog_category->getCategories(0);\r\n				\r\n				\r\n				foreach ($categories as $category) {\r\n					if ($category[\'top\']) {\r\n						// Level 2\r\n						$children_data = array();\r\n\r\n						$children = $this->model_catalog_category->getCategories($category[\'category_id\']);\r\n\r\n						foreach ($children as $child) {\r\n							$filter_data = array(\r\n								\'filter_category_id\'  => $child[\'category_id\'],\r\n								\'filter_sub_category\' => true\r\n							);\r\n\r\n							$children_data[] = array(\r\n								\'name\'  => $child[\'name\'] . ($this->config->get(\'config_product_count\') ? \' (\' . $this->model_catalog_product->getTotalProducts($filter_data) . \')\' : \'\'),\r\n								\'href\'  => $this->url->link(\'product/category\', \'path=\' . $category[\'category_id\'] . \'_\' . $child[\'category_id\'])\r\n							);\r\n						}\r\n\r\n						// Level 1\r\n						$data[\'categories\'][] = array(\r\n							\'name\'     => $category[\'name\'],\r\n							\'children\' => $children_data,\r\n							\'column\'   => $category[\'column\'] ? $category[\'column\'] : 1,\r\n							\'href\'     => $this->url->link(\'product/category\', \'path=\' . $category[\'category_id\'])\r\n						);\r\n					}\r\n				}\r\n\r\n				$data[\'language\'] = $this->load->controller(\'common/language\');\r\n				$data[\'currency\'] = $this->load->controller(\'common/currency\');\r\n				$data[\'search\'] = $this->load->controller(\'common/search\');\r\n				$data[\'cart\'] = $this->load->controller(\'common/cart\');\r\n				$data[\'wishlist\'] = $this->url->link(\'account/wishlist\', \'\', true);\r\n				$data[\'compare\'] = $this->url->link(\'product/compare\', \'\', \'SSL\');\r\n				$data[\'text_compare\']  = sprintf($this->language->get(\'text_compare\'),(isset($this->session->data[\'compare\']) ? count($this->session->data[\'compare\']) : 0));\r\n				$data[\'logged\'] = $this->customer->isLogged();\r\n				$data[\'account\'] = $this->url->link(\'account/account\', \'\', true);\r\n				$data[\'register\'] = $this->url->link(\'account/register\', \'\', true);\r\n				$data[\'login\'] = $this->url->link(\'account/login\', \'\', true);\r\n				\r\n			\r\n			]]></add>\r\n		</operation>\r\n		\r\n	</file>\r\n	<!--End Catalog/controller/common-->\r\n	\r\n	<!--Catalog/controller/product-->\r\n	<file path=\"catalog/controller/product/category.php\">\r\n		<operation>\r\n			<search ><![CDATA[$data[\'heading_title\'] = $category_info[\'name\']]]></search>\r\n			<add position=\"before\"><![CDATA[$data[\'mobile\'] = $this->config->get(\'mobile_general\');\r\n			$this->load->language(\'extension/soconfig/mobile\');\r\n			$data[\'objlang\'] = $this->language;\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path=\"catalog/controller/product/{search,special,manufacturer}*.php\">\r\n		<operation>\r\n			<search ><![CDATA[$this->load->model(\'tool/image\')]]></search>\r\n			<add position=\"after\"><![CDATA[$data[\'mobile\'] = $this->config->get(\'mobile_general\');]]></add>\r\n		</operation> \r\n      \r\n    </file>\r\n	<file path=\"catalog/controller/product/product.php\">\r\n		<operation error=\"skip\">\r\n			<search ><![CDATA[$this->document->addScript(\'catalog/view/javascript/jquery/datetimepicker/moment.js\');]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n			if($this->session->data[\'device\']==\'mobile\'){\r\n				$this->document->addStyle(\'catalog/view/javascript/soconfig/css/mobile/slick.css\');\r\n				$this->document->addScript(\'catalog/view/javascript/soconfig/js/mobile/slick.min.js\');\r\n			}\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<!--End Catalog/controller/product-->\r\n	\r\n</modification>', 1, '2017-05-30 16:16:14'),
(12, 'Whoa POS', 'Whoa_POS', 'WOOH LTD', '1.2', 'http://www.wooh.co.nz', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<modification>\r\n    <name>Whoa POS</name>\r\n    <version>1.2</version>\r\n    <author>WOOH LTD</author>\r\n    <link>http://www.wooh.co.nz</link>\r\n    <code>Whoa_POS</code>\r\n\r\n    <file path=\"admin/view/template/catalog/product_form.tpl\">\r\n        <operation>\r\n            <search><![CDATA[<td class=\"text-left\"><?php echo $entry_option_value; ?></td>]]></search>\r\n            <add position=\"replace\"><![CDATA[<td class=\"text-left\"><?php echo $entry_option_value; ?></td><td class=\"text-left\"><?php echo $entry_upc; ?></td><td class=\"text-left\"><?php echo $entry_sku; ?></td>]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[\r\n            <input type=\"hidden\" name=\"product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_value_id]\" value=\"<?php echo $product_option_value[\'product_option_value_id\']; ?>\" /></td>\r\n            ]]></search>\r\n            <add position=\"after\"><![CDATA[\r\n            <td class=\"text-right\"><input type=\"text\" name=\"product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][upc]\" value=\"<?php echo $product_option_value[\'upc\']; ?>\" placeholder=\"<?php echo $entry_upc; ?>\" class=\"form-control\" /></td>\r\n            <td class=\"text-right\"><input type=\"text\" name=\"product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][sku]\" value=\"<?php echo $product_option_value[\'sku\']; ?>\" placeholder=\"<?php echo $entry_upc; ?>\" class=\"form-control\" /></td>\r\n            ]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[<td colspan=\"6\"></td>]]></search>\r\n            <add position=\"replace\"><![CDATA[<td colspan=\"8\"></td>]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[\r\n            html += \'  <td class=\"text-right\"><input type=\"text\" name=\"product_option[\' + option_row + \'][product_option_value][\' + option_value_row + \'][quantity]\" value=\"\" placeholder=\"<?php echo $entry_quantity; ?>\" class=\"form-control\" /></td>\'; \r\n            ]]></search>\r\n            <add position=\"replace\"><![CDATA[\r\n            html += \'  <td class=\"text-right\"><input type=\"text\" name=\"product_option[\' + option_row + \'][product_option_value][\' + option_value_row + \'][upc]\" value=\"\" placeholder=\"<?php echo $entry_upc; ?>\" class=\"form-control\" /></td>\'; \r\n            html += \'  <td class=\"text-right\"><input type=\"text\" name=\"product_option[\' + option_row + \'][product_option_value][\' + option_value_row + \'][sku]\" value=\"\" placeholder=\"<?php echo $entry_sku; ?>\" class=\"form-control\" /></td>\'; \r\n            html += \'  <td class=\"text-right\"><input type=\"text\" name=\"product_option[\' + option_row + \'][product_option_value][\' + option_value_row + \'][quantity]\" value=\"\" placeholder=\"<?php echo $entry_quantity; ?>\" class=\"form-control\" /></td>\'; \r\n            ]]></add>\r\n        </operation>\r\n\r\n        \r\n\r\n    </file>\r\n\r\n\r\n    <file path=\"admin/controller/catalog/product.php\">\r\n        <operation>\r\n            <search><![CDATA[\r\n            \'points_prefix\'           => $product_option_value[\'points_prefix\'],\r\n            ]]></search>\r\n            <add position=\"after\"><![CDATA[\r\n            \'upc\'           => $product_option_value[\'upc\'],\r\n            \'sku\'           => $product_option_value[\'sku\'],\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n\r\n\r\n    <file path=\"admin/model/catalog/product.php\">\r\n        <operation>\r\n            <search><![CDATA[\r\n            points_prefix = \'\" . $this->db->escape($product_option_value[\'points_prefix\']) . \"\',\r\n            ]]></search>\r\n            <add position=\"replace\"><![CDATA[\r\n            points_prefix = \'\" . $this->db->escape($product_option_value[\'points_prefix\']) . \"\', upc = \'\" . $this->db->escape($product_option_value[\'upc\']) . \"\', sku = \'\" . $this->db->escape($product_option_value[\'sku\']) . \"\',\r\n            ]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[\r\n            \'points_prefix\'           => $product_option_value[\'points_prefix\'],\r\n            ]]></search>\r\n            <add position=\"after\"><![CDATA[\r\n            \'upc\'           => $product_option_value[\'upc\'],\r\n            \'sku\'           => $product_option_value[\'sku\'],\r\n            ]]></add>\r\n        </operation>\r\n\r\n\r\n\r\n        <operation>\r\n            <search><![CDATA[\r\n                date_end = \'\" . $this->db->escape($product_special[\'date_end\']) . \"\'\");\r\n            ]]></search>\r\n            <add position=\"after\"><![CDATA[\r\n                //curl product_speical start\r\n\r\n                if($this->config->get(\'config_whoapos_status\')==\'1\')\r\n                {\r\n                    $remote_server = $this->config->get(\'config_whoapos_url\').\"product_specials\";\r\n                    $ch = curl_init();\r\n\r\n                    $product_special_id =  $this->db->getLastId();\r\n                    $customer_group_id =(int)$product_special[\'customer_group_id\'];\r\n                    $price_special = (float)$product_special[\'price\'];\r\n                    $product_id = (int)$product_id;\r\n\r\n                    $post_string = \"product_special_id=$product_special_id&product_id=$product_id&customer_group_id=$customer_group_id&price_special=$price_special&key=\".$this->config->get(\'config_whoapos_api\');\r\n                    $post_string;\r\n                    curl_setopt($ch,CURLOPT_URL,$remote_server);\r\n                    curl_setopt($ch,CURLOPT_POSTFIELDS,$post_string);\r\n                    curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);\r\n                    curl_exec($ch);\r\n                    curl_close($ch);    \r\n                }\r\n                //curl product_special end\r\n            ]]></add>\r\n        </operation>\r\n        <operation>\r\n            <search index=\"0\"><![CDATA[\r\n                if (isset($data[\'product_option\'])) {\r\n            ]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n                //api_new start\r\n                if($this->config->get(\'config_whoapos_status\')==\'1\')\r\n                {\r\n                    $price_api = (float)$data[\'price\'];\r\n                    if (isset($data[\'image\'])) {\r\n                        $image_api =  HTTP_SERVER.\'image/\'.$this->db->escape($data[\'image\']);\r\n                    }else{\r\n                        $image_api=\"\";\r\n                    }\r\n                    $product_id_api = (int)$product_id;\r\n                    if (isset($data[\'product_category\'])) {\r\n                        foreach ($data[\'product_category\'] as $category_id) {\r\n                            $category_id_api = (int)$category_id;\r\n                        }\r\n                    }else{\r\n                        $category_id_api=\"\";\r\n                    }\r\n                    $name_api = $this->db->escape($value[\'name\']);\r\n                    $quantity = (int)$data[\'quantity\'];\r\n                    $upc = $this->db->escape($data[\'upc\']);\r\n                    $tax = (int)$data[\'tax_class_id\'];\r\n\r\n                    $remote_server = $this->config->get(\'config_whoapos_url\').\"UpdateProduct\";\r\n                    $post_string = \"username=adminEdit&id=$product_id_api&name=$name_api&category=$category_id_api&price=$price_api&photo=$image_api&quantity=$quantity&upc=$upc&tax=$tax&key=\".$this->config->get(\'config_whoapos_api\');\r\n                    $ch = curl_init();\r\n                    curl_setopt($ch,CURLOPT_URL,$remote_server);\r\n                    curl_setopt($ch,CURLOPT_POSTFIELDS,$post_string);\r\n                    curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);\r\n                    $res = curl_exec($ch);\r\n                    curl_close($ch);\r\n                }\r\n                //exit();\r\n                //curl add new end\r\n            ]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search index=\"1\"><![CDATA[\r\n                if (isset($data[\'product_option\'])) {\r\n            ]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n               //api_edit start\r\n\r\n                if($this->config->get(\'config_whoapos_status\')==\'1\')\r\n                {\r\n                    $price_api = (float)$data[\'price\'];\r\n                    if (isset($data[\'image\'])) {\r\n                        $image_api =  HTTP_SERVER.\'image/\'.$this->db->escape($data[\'image\']);\r\n                    }else{\r\n                        $image_api=\"\";\r\n                    }\r\n                    $product_id_api = (int)$product_id;\r\n                    if (isset($data[\'product_category\'])) {\r\n                        foreach ($data[\'product_category\'] as $category_id) {\r\n                            $category_id_api = (int)$category_id;\r\n                        }\r\n                    }else{\r\n                        $category_id_api=\"\";\r\n                    }\r\n                    $name_api = $this->db->escape($value[\'name\']);\r\n                    $quantity = (int)$data[\'quantity\'];\r\n                    $upc = $this->db->escape($data[\'upc\']);\r\n                    $tax = (int)$data[\'tax_class_id\'];\r\n\r\n                    $remote_server = $this->config->get(\'config_whoapos_url\').\"UpdateProduct\";\r\n                    $post_string = \"username=adminEdit&id=$product_id_api&name=$name_api&category=$category_id_api&price=$price_api&photo=$image_api&quantity=$quantity&upc=$upc&tax=$tax&key=\".$this->config->get(\'config_whoapos_api\');\r\n                    $ch = curl_init();\r\n                    curl_setopt($ch,CURLOPT_URL,$remote_server);\r\n                    curl_setopt($ch,CURLOPT_POSTFIELDS,$post_string);\r\n                    curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);\r\n                    $res = curl_exec($ch);\r\n                    curl_close($ch);\r\n                }\r\n                //exit();\r\n                //api_edit end\r\n            ]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[\r\n                $this->db->query(\"DELETE FROM \" . DB_PREFIX . \"product WHERE product_id = \'\" . (int)$product_id . \"\'\");\r\n            ]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n                //api_delete start\r\n                if($this->config->get(\'config_whoapos_status\')==\'1\')\r\n                {\r\n                    $product_id_api = (int)$product_id;\r\n\r\n                    $remote_server = $this->config->get(\'config_whoapos_url\').\"DelProduct\";\r\n                    $post_string = \"username=productDel&id=$product_id_api&key=\".$this->config->get(\'config_whoapos_api\');\r\n                    $ch = curl_init();\r\n                    curl_setopt($ch,CURLOPT_URL,$remote_server);\r\n                    curl_setopt($ch,CURLOPT_POSTFIELDS,$post_string);\r\n                    curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);\r\n                    $res = curl_exec($ch);\r\n                    curl_close($ch);\r\n                }\r\n                //exit();\r\n\r\n                //curl delete end\r\n            ]]></add>\r\n        </operation>\r\n        <operation>\r\n            <search><![CDATA[\r\n                if (isset($data[\'product_option\'])) {\r\n            ]]></search>\r\n            <add position=\"replace\"><![CDATA[\r\n                if (1==100) {\r\n            ]]></add>\r\n        </operation>\r\n        <operation>\r\n            <search index=\"0\"><![CDATA[\r\n                if (isset($data[\'product_image\'])) {\r\n            ]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n            if($this->config->get(\'config_whoapos_status\')==\'1\')\r\n            {\r\n\r\n\r\n                if (isset($data[\'product_option\'])) {\r\n                    foreach ($data[\'product_option\'] as $product_option) {\r\n                        if ($product_option[\'type\'] == \'select\' || $product_option[\'type\'] == \'radio\' || $product_option[\'type\'] == \'checkbox\' || $product_option[\'type\'] == \'image\') {\r\n                            if (isset($product_option[\'product_option_value\'])) {\r\n                                $this->db->query(\"INSERT INTO \" . DB_PREFIX . \"product_option SET product_id = \'\" . (int)$product_id . \"\', option_id = \'\" . (int)$product_option[\'option_id\'] . \"\', required = \'\" . (int)$product_option[\'required\'] . \"\'\");\r\n\r\n                                $product_option_id = $this->db->getLastId();\r\n\r\n                                foreach ($product_option[\'product_option_value\'] as $product_option_value) {\r\n                                    $this->db->query(\"INSERT INTO \" . DB_PREFIX . \"product_option_value SET product_option_id = \'\" . (int)$product_option_id . \"\', product_id = \'\" . (int)$product_id . \"\', option_id = \'\" . (int)$product_option[\'option_id\'] . \"\', option_value_id = \'\" . (int)$product_option_value[\'option_value_id\'] . \"\', quantity = \'\" . (int)$product_option_value[\'quantity\'] . \"\', subtract = \'\" . (int)$product_option_value[\'subtract\'] . \"\', price = \'\" . (float)$product_option_value[\'price\'] . \"\', price_prefix = \'\" . $this->db->escape($product_option_value[\'price_prefix\']) . \"\', points = \'\" . (int)$product_option_value[\'points\'] . \"\', \r\n                    points_prefix = \'\" . $this->db->escape($product_option_value[\'points_prefix\']) . \"\', upc = \'\" . $this->db->escape($product_option_value[\'upc\']) . \"\', sku = \'\" . $this->db->escape($product_option_value[\'sku\']) . \"\',\r\n                     weight = \'\" . (float)$product_option_value[\'weight\'] . \"\', weight_prefix = \'\" . $this->db->escape($product_option_value[\'weight_prefix\']) . \"\'\");\r\n\r\n                        //curl option start\r\n                        $option_id = $this->db->getLastId();\r\n                        //$option_id = (int)$product_option_value[\'product_option_value_id\'];\r\n                        $product_id = (int)$product_id;\r\n                        $quantity = (int)$product_option_value[\'quantity\'];\r\n                        $price = (float)$product_option_value[\'price\'];\r\n                        $code = $product_option_value[\'upc\'];//barcode\r\n\r\n                        $test = \"SELECT * FROM \" . DB_PREFIX . \"option_value_description WHERE option_value_id = \'\" . (int)$product_option_value[\'option_value_id\'] . \"\'\";\r\n                        $query = $this->db->query($test);\r\n\r\n                        foreach ($query->rows as $result) {\r\n                            $option_name = $result[\'name\'];\r\n                        }\r\n                        $option_product_name =$this->db->escape($value[\'name\']);\r\n                        $name = $option_product_name.\" \".$option_name;\r\n                         $tax = (int)$data[\'tax_class_id\'];\r\n\r\n                        $remote_server = $this->config->get(\'config_whoapos_url\').\"UpdateOption\";\r\n                        $post_string = \"username=adminNew&id=$product_id&option_id=$option_id&name=$name&price=$price_api&quantity=$quantity&upc=$code&test=$test&tax=$tax&key=\".$this->config->get(\'config_whoapos_api\');\r\n                        $ch = curl_init();\r\n                        curl_setopt($ch,CURLOPT_URL,$remote_server);\r\n                        curl_setopt($ch,CURLOPT_POSTFIELDS,$post_string);\r\n                        curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);\r\n                        $res = curl_exec($ch);\r\n                        curl_close($ch);\r\n                        //exit();\r\n                        //curl option end\r\n                    \r\n                                }\r\n                            }\r\n                        } else {\r\n                            $this->db->query(\"INSERT INTO \" . DB_PREFIX . \"product_option SET product_id = \'\" . (int)$product_id . \"\', option_id = \'\" . (int)$product_option[\'option_id\'] . \"\', value = \'\" . $this->db->escape($product_option[\'value\']) . \"\', required = \'\" . (int)$product_option[\'required\'] . \"\'\");\r\n                        }\r\n                    }\r\n                }\r\n            }\r\n            ]]></add>\r\n        </operation>\r\n        <operation>\r\n            <search index=\"1\"><![CDATA[\r\n                if (isset($data[\'product_image\'])) {\r\n            ]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n                if($this->config->get(\'config_whoapos_status\')==\'1\')\r\n                {\r\n                            $arr = array();\r\n                          if (isset($data[\'product_option\'])) {\r\n                        foreach ($data[\'product_option\'] as $product_option) {\r\n                            if ($product_option[\'type\'] == \'select\' || $product_option[\'type\'] == \'radio\' || $product_option[\'type\'] == \'checkbox\' || $product_option[\'type\'] == \'image\') {\r\n                                if (isset($product_option[\'product_option_value\'])) {\r\n                                    $this->db->query(\"INSERT INTO \" . DB_PREFIX . \"product_option SET product_option_id = \'\" . (int)$product_option[\'product_option_id\'] . \"\', product_id = \'\" . (int)$product_id . \"\', option_id = \'\" . (int)$product_option[\'option_id\'] . \"\', required = \'\" . (int)$product_option[\'required\'] . \"\'\");\r\n\r\n                                    $product_option_id = $this->db->getLastId();\r\n\r\n                                    foreach ($product_option[\'product_option_value\'] as $product_option_value) {\r\n                                        $this->db->query(\"INSERT INTO \" . DB_PREFIX . \"product_option_value SET product_option_value_id = \'\" . (int)$product_option_value[\'product_option_value_id\'] . \"\', product_option_id = \'\" . (int)$product_option_id . \"\', product_id = \'\" . (int)$product_id . \"\', option_id = \'\" . (int)$product_option[\'option_id\'] . \"\', option_value_id = \'\" . (int)$product_option_value[\'option_value_id\'] . \"\', quantity = \'\" . (int)$product_option_value[\'quantity\'] . \"\', subtract = \'\" . (int)$product_option_value[\'subtract\'] . \"\', price = \'\" . (float)$product_option_value[\'price\'] . \"\', price_prefix = \'\" . $this->db->escape($product_option_value[\'price_prefix\']) . \"\', points = \'\" . (int)$product_option_value[\'points\'] . \"\', \r\n                        points_prefix = \'\" . $this->db->escape($product_option_value[\'points_prefix\']) . \"\', upc = \'\" . $this->db->escape($product_option_value[\'upc\']) . \"\', sku = \'\" . $this->db->escape($product_option_value[\'sku\']) . \"\',\r\n                         weight = \'\" . (float)$product_option_value[\'weight\'] . \"\', weight_prefix = \'\" . $this->db->escape($product_option_value[\'weight_prefix\']) . \"\'\");\r\n\r\n                            //curl option start\r\n                            $option_id = $this->db->getLastId();\r\n                            $product_id = (int)$product_id;\r\n                            $quantity = (int)$product_option_value[\'quantity\'];\r\n                            $price = (float)$product_option_value[\'price\'];\r\n                            $code = $product_option_value[\'upc\'];//barcode\r\n\r\n\r\n                            $test = \"SELECT * FROM \" . DB_PREFIX . \"option_value_description WHERE option_value_id = \'\" . (int)$product_option_value[\'option_value_id\'] . \"\'\";\r\n                            $query = $this->db->query($test);\r\n\r\n                            foreach ($query->rows as $result) {\r\n                                $option_name = $result[\'name\'];\r\n                            }\r\n                            $option_product_name =$this->db->escape($value[\'name\']);\r\n                            $name = $option_product_name.\" \".$option_name;\r\n                            $tax = (int)$data[\'tax_class_id\'];\r\n                            $arr[] = $option_id;\r\n\r\n                            $remote_server = $this->config->get(\'config_whoapos_url\').\"UpdateOption\";\r\n                            $post_string = \"username=adminNew&id=$product_id&option_id=$option_id&name=$name&price=$price_api&quantity=$quantity&upc=$code&test=$test&tax=$tax&key=\".$this->config->get(\'config_whoapos_api\');\r\n                            $ch = curl_init();\r\n                            curl_setopt($ch,CURLOPT_URL,$remote_server);\r\n                            curl_setopt($ch,CURLOPT_POSTFIELDS,$post_string);\r\n                            curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);\r\n                            $res = curl_exec($ch);\r\n                            curl_close($ch);\r\n                            //exit();\r\n                            //curl option end\r\n                        \r\n                                    }\r\n                                }\r\n                            } else {\r\n                                $this->db->query(\"INSERT INTO \" . DB_PREFIX . \"product_option SET product_option_id = \'\" . (int)$product_option[\'product_option_id\'] . \"\', product_id = \'\" . (int)$product_id . \"\', option_id = \'\" . (int)$product_option[\'option_id\'] . \"\', value = \'\" . $this->db->escape($product_option[\'value\']) . \"\', required = \'\" . (int)$product_option[\'required\'] . \"\'\");\r\n                            }\r\n                        }\r\n                    }\r\n\r\n                            $arr_string = implode(\",\", $arr);\r\n\r\n                     $remote_server = $this->config->get(\'config_whoapos_url\').\"DeleteOption\";\r\n                    $post_string = \"username=adminNew&arr_string=$arr_string&product_id=$product_id&key=\".$this->config->get(\'config_whoapos_api\');\r\n                    $ch = curl_init();\r\n                    curl_setopt($ch,CURLOPT_URL,$remote_server);\r\n                    curl_setopt($ch,CURLOPT_POSTFIELDS,$post_string);\r\n                    curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);\r\n                    $res = curl_exec($ch);\r\n                    curl_close($ch);\r\n                    //exit();\r\n            }\r\n        //curl option end\r\n\r\n            ]]></add>\r\n        </operation>\r\n\r\n\r\n    </file>\r\n\r\n    <file path=\"admin/model/sale/customer.php\">\r\n        <operation>\r\n            <search><![CDATA[\r\n            if (isset($data[\'address\'])) {\r\n            ]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n            //api_new_customer start\r\n            if($this->config->get(\'config_whoapos_status\')==\'1\')\r\n            {\r\n                $customer_group_id_api = (int)$data[\'customer_group_id\'];\r\n                $customer_id_api = (int)$customer_id;\r\n                $firstname_api = $this->db->escape($data[\'firstname\']);\r\n                $lastname_api = $this->db->escape($data[\'lastname\']);\r\n                $name_api = $lastname_api.$firstname_api;\r\n                $email_api = $this->db->escape($data[\'email\']);\r\n                $telephone_api = $this->db->escape($data[\'telephone\']);\r\n\r\n\r\n                $remote_server = $this->config->get(\'config_whoapos_url\').\"UpdateCustomer\";\r\n                $post_string = \"username=adminNewCustomer&id=$customer_id_api&name=$name_api&phone=$telephone_api&email=$email_api&group_id=$customer_group_id_api&key=\".$this->config->get(\'config_whoapos_api\');\r\n                $ch = curl_init();\r\n                curl_setopt($ch,CURLOPT_URL,$remote_server);\r\n                curl_setopt($ch,CURLOPT_POSTFIELDS,$post_string);\r\n                curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);\r\n                //echo $res = curl_exec($ch);\r\n                $res = curl_exec($ch);\r\n                curl_close($ch);\r\n            }\r\n            //exit();\r\n            //api_new_customer end\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n\r\n    <file path=\"catalog/model/account/customer.php\">\r\n        <operation>\r\n            <search><![CDATA[\r\n            $this->event->trigger(\'post.customer.add\', $customer_id);\r\n            ]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n            //customer curl start\r\n            if($this->config->get(\'config_whoapos_status\')==\'1\')\r\n            {\r\n                $customer_group_id_api = (int)$customer_group_id;\r\n                $customer_id_api = (int)$customer_id;\r\n                $firstname_api = $this->db->escape($data[\'firstname\']);\r\n                $lastname_api = $this->db->escape($data[\'lastname\']);\r\n                $name_api = $lastname_api.$firstname_api;\r\n                $email_api = $this->db->escape($data[\'email\']);\r\n                $telephone_api = $this->db->escape($data[\'telephone\']);\r\n\r\n\r\n                $remote_server = $this->config->get(\'config_whoapos_url\').\"UpdateCustomer\";\r\n                $post_string = \"username=adminNewCustomer&id=$customer_id_api&name=$name_api&phone=$telephone_api&email=$email_api&group_id=$customer_group_id_api&key=\".$this->config->get(\'config_whoapos_api\');\r\n                $ch = curl_init();\r\n                curl_setopt($ch,CURLOPT_URL,$remote_server);\r\n                curl_setopt($ch,CURLOPT_POSTFIELDS,$post_string);\r\n                curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);\r\n                //echo $res = curl_exec($ch);\r\n                $res = curl_exec($ch);\r\n                curl_close($ch);\r\n            }\r\n            //customer curl end\r\n            ]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[\r\n            $this->event->trigger(\'post.customer.edit\', $customer_id);\r\n            ]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n            //edit customer start\r\n            if($this->config->get(\'config_whoapos_status\')==\'1\')\r\n            {\r\n                $customer_group_id_api = $data[\'customer_group_id\'];\r\n                $customer_id_api = (int)$customer_id;\r\n                $firstname_api = $this->db->escape($data[\'firstname\']);\r\n                $lastname_api = $this->db->escape($data[\'lastname\']);\r\n                $name_api = $lastname_api.$firstname_api;\r\n                $email_api = $this->db->escape($data[\'email\']);\r\n                $telephone_api = $this->db->escape($data[\'telephone\']);\r\n\r\n\r\n                $remote_server = $this->config->get(\'config_whoapos_url\').\"UpdateCustomer\";\r\n                $post_string = \"username=adminNewCustomer&id=$customer_id_api&name=$name_api&phone=$telephone_api&email=$email_api&group_id=$customer_group_id_api&key=\".$this->config->get(\'config_whoapos_api\');\r\n                $ch = curl_init();\r\n                curl_setopt($ch,CURLOPT_URL,$remote_server);\r\n                curl_setopt($ch,CURLOPT_POSTFIELDS,$post_string);\r\n                curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);\r\n                //echo $res = curl_exec($ch);\r\n                $res = curl_exec($ch);\r\n                curl_close($ch);\r\n            }\r\n            //edit customer end\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n\r\n    <file path=\"catalog/model/checkout/order.php\">\r\n        <operation>\r\n            <search index=\"0\"><![CDATA[\r\n            $order_product_id = $this->db->getLastId();\r\n            ]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n            //stock curl start\r\n            if($this->config->get(\'config_whoapos_status\')==\'1\')\r\n            {\r\n                $product_id = (int)$product[\'product_id\'];\r\n                $quantity = (int)$product[\'quantity\'];\r\n\r\n                $remote_server = $this->config->get(\'config_whoapos_url\').\"UpdateStock\";\r\n                $post_string = \"username=productStockSubtraction&id=$product_id&quantity=$quantity&key=\".$this->config->get(\'config_whoapos_api\');\r\n                $ch = curl_init();\r\n                curl_setopt($ch,CURLOPT_URL,$remote_server);\r\n                curl_setopt($ch,CURLOPT_POSTFIELDS,$post_string);\r\n                curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);\r\n                $res = curl_exec($ch);\r\n                curl_close($ch);\r\n                //exit();\r\n            }\r\n            //stock curl end\r\n            ]]></add>\r\n        </operation>\r\n\r\n    </file>\r\n\r\n    <file path=\"admin/language/english/catalog/product.php\">\r\n        <operation>\r\n            <search><![CDATA[\r\n            $_[\'entry_upc\']              = \'UPC\';\r\n            ]]></search>\r\n            <add position=\"replace\"><![CDATA[\r\n               $_[\'entry_upc\']              = \'Barcode\';\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n\r\n\r\n    <file path=\"admin/language/chinese/catalog/product.php\">\r\n        <operation>\r\n            <search><![CDATA[\r\n            $_[\'entry_upc\']                  = \'UPC：\';\r\n            ]]></search>\r\n            <add position=\"replace\"><![CDATA[\r\n            $_[\'entry_upc\']                  = \'条形码\';\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n\r\n\r\n\r\n    <file path=\"admin/view/template/setting/setting.tpl\">\r\n        <operation>\r\n            <search><![CDATA[<li><a href=\"#tab-mail\" data-toggle=\"tab\"><?php echo $tab_mail; ?></a></li>]]></search>\r\n            <add position=\"after\"><![CDATA[\r\n            <li><a href=\"#tab-whoapos\" data-toggle=\"tab\">Whoa POS</a></li>\r\n            ]]></add>\r\n        </operation>\r\n\r\n        <operation>\r\n            <search><![CDATA[<div class=\"tab-pane\" id=\"tab-mail\">]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n            \r\n            <div class=\"tab-pane\" id=\"tab-whoapos\">\r\n              \r\n              <!-- <div class=\"form-group\">\r\n                <label class=\"col-sm-2 control-label\" for=\"input-mail-parameter\">Website API</label>\r\n                <div class=\"col-sm-10\">\r\n                    <label class=\"control-label\"\">http://<?php echo $_SERVER[\'HTTP_HOST\']; ?>/api</label>\r\n                </div>\r\n              </div> -->\r\n\r\n\r\n              <!-- <div class=\"form-group\">\r\n                <label class=\"col-sm-2 control-label\" for=\"input-mail-parameter\">API KEY</label>\r\n                <div class=\"col-sm-10\">\r\n\r\n                  <input type=\"hidden\" name=\"config_whoapos_url\" value=\"https://pos.whoa.nz/apis/\">\r\n\r\n                  <textarea name=\"config_whoapos_api\" rows=\"3\" id=\"input-whoapos_whoapos_key_api\" class=\"form-control\"><?php echo $config_whoapos_api; ?></textarea>\r\n                  <br>\r\n                  <button type=\"button\" id=\"button-generate\" class=\"btn btn-primary\"><i class=\"fa fa-refresh\"></i> Generate</button>\r\n                \r\n                </div>\r\n              </div> -->\r\n\r\n\r\n              <div class=\"form-group\">\r\n                <label class=\"col-sm-2 control-label\" for=\"input-mail-parameter\"></label>\r\n                <div class=\"col-sm-10\">\r\n                    <label class=\"control-label\"\"><a href=\"https://pos.whoa.nz/login/?username=<?php echo $_SERVER[\'HTTP_HOST\']; ?>&password=<?php echo $config_encryption; ?>\" target=\"_blank\">Click Login</a></label>\r\n                </div>\r\n            </div>\r\n\r\n\r\n                \r\n\r\n\r\n\r\n            \r\n\r\n\r\n            <div class=\"form-group\">\r\n                <label class=\"col-sm-2 control-label\" for=\"input-mail-parameter\">Pos Login</label>\r\n                <div class=\"col-sm-10\">\r\n                    <label class=\"control-label\"\"><a href=\"https://pos.whoa.nz\" target=\"_blank\">https://pos.whoa.nz</a></label>\r\n                </div>\r\n            </div>\r\n\r\n            <div class=\"form-group\">\r\n                <label class=\"col-sm-2 control-label\" for=\"input-mail-parameter\">Username</label>\r\n                <div class=\"col-sm-10\">\r\n                    <label class=\"control-label\"\"><?php echo $_SERVER[\'HTTP_HOST\']; ?></label>\r\n                </div>\r\n            </div>\r\n\r\n            <div class=\"form-group\">\r\n                <label class=\"col-sm-2 control-label\" for=\"input-mail-parameter\">Password</label>\r\n                <div class=\"col-sm-10\">\r\n                    <label class=\"control-label\"\"><?php echo $config_encryption; ?></label>\r\n                </div>\r\n            </div>\r\n\r\n\r\n            <div class=\"form-group\">\r\n                  <label class=\"col-sm-2 control-label\"><?php echo $entry_status; ?></label>\r\n                  <div class=\"col-sm-10\">\r\n                    <select name=\"config_whoapos_status\" class=\"form-control\">\r\n                      <?php if ($config_whoapos_status) { ?>\r\n                      <option value=\"1\" selected=\"selected\"><?php echo $text_enabled; ?></option>\r\n                      <option value=\"0\"><?php echo $text_disabled; ?></option>\r\n                      <?php } else { ?>\r\n                      <option value=\"1\"><?php echo $text_enabled; ?></option>\r\n                      <option value=\"0\" selected=\"selected\"><?php echo $text_disabled; ?></option>\r\n                      <?php } ?>\r\n                    </select>\r\n                  </div>\r\n                </div>\r\n\r\n\r\n\r\n\r\n\r\n              \r\n            </div>\r\n\r\n            ]]></add>\r\n        </operation>\r\n\r\n\r\n        <operation>\r\n            <search><![CDATA[<?php echo $footer; ?>]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n            <script type=\"text/javascript\"><!--\r\n$(\'#button-generate\').on(\'click\', function() {\r\n  rand = \'\';\r\n  \r\n  string = \'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\';\r\n\r\n  for (i = 0; i < 120; i++) {\r\n    rand += string[Math.floor(Math.random() * (string.length - 1))];\r\n  }\r\n  \r\n  $(\'#input-whoapos_whoapos_key_api\').val(rand);\r\n});\r\n//--></script>\r\n\r\n            ]]></add>\r\n        </operation>\r\n\r\n    </file>\r\n\r\n\r\n\r\n    <file path=\"admin/controller/setting/setting.php\">\r\n        <operation>\r\n            <search><![CDATA[$this->load->model(\'design/layout\');]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n\r\n        if (isset($this->request->post[\'config_whoapos_url\'])) {\r\n            $data[\'config_whoapos_url\'] = $this->request->post[\'config_whoapos_url\'];\r\n        } else {\r\n            $data[\'config_whoapos_url\'] = $this->config->get(\'config_whoapos_url\');\r\n        }\r\n\r\n        if (isset($this->request->post[\'config_whoapos_api\'])) {\r\n            $data[\'config_whoapos_api\'] = $this->request->post[\'config_whoapos_api\'];\r\n        } else {\r\n            $data[\'config_whoapos_api\'] = $this->config->get(\'config_whoapos_api\');\r\n        }\r\n\r\n        if (isset($this->request->post[\'config_whoapos_status\'])) {\r\n            $data[\'config_whoapos_status\'] = $this->request->post[\'config_whoapos_status\'];\r\n        } else {\r\n            $data[\'config_whoapos_status\'] = $this->config->get(\'config_whoapos_status\');\r\n        }\r\n\r\n\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n\r\n\r\n    <file path=\"admin/view/template/common/menu.tpl\">\r\n        <operation>\r\n            <search><![CDATA[<li id=\"dashboard\"><a href=\"<?php echo $home; ?>\"><i class=\"fa fa-dashboard fa-fw\"></i> <span><?php echo $text_dashboard; ?></span></a></li>]]></search>\r\n            <add position=\"after\"><![CDATA[<li id=\"dashboard\"><a href=\"https://pos.whoa.nz/login/?username=<?php echo $_SERVER[\'HTTP_HOST\']; ?>&password=<?php echo $config_encryption; ?>\" target=\"_blank\"><i class=\"fa fa-desktop fa-fw\"></i> <span>Whoa POS</span></a></li>]]></add>\r\n        </operation>\r\n    </file>\r\n\r\n\r\n    <file path=\"admin/controller/common/menu.php\">\r\n        <operation>\r\n            <search><![CDATA[$data[\'home\'] = $this->url->link(\'common/dashboard\', \'token=\' . $this->session->data[\'token\'], \'SSL\');]]></search>\r\n            <add position=\"before\"><![CDATA[$data[\'config_encryption\'] = $this->config->get(\'config_encryption\');]]></add>\r\n        </operation>\r\n    </file>\r\n\r\n\r\n\r\n\r\n</modification>', 1, '2017-05-30 20:49:19');
INSERT INTO `wbc_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(13, 'OpenCart Shortcodes', 'shortcodes_2.2.1', 'EchoThemes', '2.2.1', 'http://www.echothemes.com', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<modification>\r\n    <name>OpenCart Shortcodes</name>\r\n    <version>2.2.1</version>\r\n    <code>shortcodes_2.2.1</code>\r\n    <author>EchoThemes</author>\r\n    <link>http://www.echothemes.com</link>\r\n\r\n   <file path=\"admin/controller/startup/startup.php\">\r\n        <operation info=\"Add Shortcodes to admin $registry\">\r\n            <search><![CDATA[$this->registry->set(\'encryption\']]></search>\r\n            <add position=\"after\"><![CDATA[\r\n            // OpenCart Shortcodes\r\n            $this->registry->set(\'shortcodes\', new Shortcodes($this->registry));\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n    <file path=\"catalog/controller/startup/startup.php\">\r\n        <operation info=\"Add Shortcodes to front $registry\">\r\n            <search><![CDATA[$this->registry->set(\'encryption\']]></search>\r\n            <add position=\"after\"><![CDATA[\r\n            // OpenCart Shortcodes\r\n            $this->registry->set(\'shortcodes\', new Shortcodes($this->registry));\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n    <file path=\"catalog/controller/startup/maintenance.php\">\r\n        <operation>\r\n            <search><![CDATA[function index()]]></search>\r\n            <add position=\"after\"><![CDATA[\r\n            //========= OpenCart Shortcodes\r\n            //=== Default shortcodes\r\n            $this->load->helper(\'shortcodes_default\');\r\n\r\n            $class = new ShortcodesDefault($this->registry);\r\n            $scDefaults = get_class_methods($class);\r\n            foreach ($scDefaults as $shortcode) {\r\n                $this->shortcodes->add_shortcode($shortcode, $class);\r\n            }\r\n\r\n            //=== Extensions shortcodes : for extensions developer\r\n            $files = glob(DIR_APPLICATION . \'/view/shortcodes/*.php\');\r\n            if ($files) {\r\n                foreach ($files as $file) {\r\n                   require_once($file);\r\n\r\n                   $file     = basename($file, \".php\");\r\n                   $extClass = \'Shortcodes\' . preg_replace(\'/[^a-zA-Z0-9]/\', \'\', $file);\r\n\r\n                   $class = new $extClass($this->registry);\r\n                   $scExtensions = get_class_methods($class);\r\n                   foreach ($scExtensions as $shortcode) {\r\n                      $this->shortcodes->add_shortcode($shortcode, $class);\r\n                   }\r\n                }\r\n            }\r\n\r\n            //--------------- OLD theme OpenCart 2 compatible\r\n            $theme = $this->config->get(\'config_theme\');\r\n            if ($this->config->get(\'config_theme\') == \'theme_default\') {\r\n              $theme = $this->config->get(\'theme_default_directory\');\r\n            }\r\n\r\n            //=== Themes shortcodes : for theme developer\r\n            $file = DIR_TEMPLATE . $theme . \'/shortcodes_theme.php\';\r\n            if (file_exists($file)) {\r\n                require_once($file);\r\n\r\n                $class      = new ShortcodesTheme($this->registry);\r\n                $scThemes   = get_class_methods($class);\r\n                foreach ($scThemes as $shortcode) {\r\n                   $this->shortcodes->add_shortcode($shortcode, $class);\r\n                }\r\n            }\r\n\r\n            $this->event->trigger(\'shortcodes/themes/after\', array(&$data));\r\n\r\n            //=== Custom shortcodes : user power!\r\n            $file = DIR_TEMPLATE . $theme . \'/shortcodes_custom.php\';\r\n            if (file_exists($file)) {\r\n                require_once($file);\r\n\r\n                $class      = new ShortcodesCustom($this->registry);\r\n                $scCustom   = get_class_methods($class);\r\n                foreach ($scCustom as $shortcode) {\r\n                   $this->shortcodes->add_shortcode($shortcode, $class);\r\n                }\r\n            }\r\n            //========= End:: OpenCart Shortcodes\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n\r\n    <file path=\"catalog/controller/{information,product}/{information,product,category}.php\">\r\n      <operation info=\"Parse shortcodes at information, product and category content\">\r\n         <search><![CDATA[$data[\'description\']]]></search>\r\n         <add position=\"after\"><![CDATA[\r\n          $data[\'description\'] = $this->shortcodes->do_shortcode($data[\'description\']);\r\n         ]]></add>\r\n      </operation>\r\n   </file>\r\n   <file path=\"catalog/controller/product/{category,manufacturer,search}.php\">\r\n      <operation info=\"Product teaser in category and manufacture\">\r\n         <search><![CDATA[new Pagination()]]></search>\r\n         <add position=\"before\"><![CDATA[\r\n         $x = count($data[\'products\']);\r\n         if ($x) {\r\n            $sc_products = array();\r\n            for ($i=0; $i < $x; $i++) {\r\n               $sc_products[$i] = $data[\'products\'][$i];\r\n               $sc_products[$i][\'description\'] = $this->shortcodes->do_shortcode($data[\'products\'][$i][\'description\']);\r\n            }\r\n            $data[\'products\'] = $sc_products;\r\n         }\r\n         ]]></add>\r\n      </operation>\r\n   </file>\r\n   <file path=\"catalog/controller/extension/module/{bestseller,featured,latest,special}.php\">\r\n      <operation info=\"Product teaser in module\">\r\n         <search><![CDATA[$this->load->view(\'extension/module]]></search>\r\n         <add position=\"before\"><![CDATA[\r\n         $x = count($data[\'products\']);\r\n         if ($x) {\r\n            $sc_products = array();\r\n            for ($i=0; $i < $x; $i++) {\r\n               $sc_products[$i] = $data[\'products\'][$i];\r\n               $sc_products[$i][\'description\'] = $this->shortcodes->do_shortcode($data[\'products\'][$i][\'description\']);\r\n            }\r\n            $data[\'products\'] = $sc_products;\r\n         }\r\n         ]]></add>\r\n      </operation>\r\n   </file>\r\n</modification>\r\n', 1, '2017-05-31 17:14:58');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_module`
--

CREATE TABLE `wbc_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_module`
--

INSERT INTO `wbc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(323, 'So Megamenu', 'so_megamenu', '{\"layout_id\":100,\"position\":\"menu\",\"sort_order\":0,\"orientation\":0,\"search_bar\":0,\"navigation_text\":\"\",\"home_text\":\"\",\"full_width\":1000,\"home_item\":\"icon\",\"animation\":\"slide\",\"animation_time\":500,\"show_itemver\":5,\"status\":1,\"name\":\"So Megamenu\",\"use_cache\":\"1\",\"cache_time\":\"3600\"}'),
(324, 'So Social Login', 'so_sociallogin', '{\"so_sociallogin_name\":\"So Social Login\",\"so_sociallogin_width\":130,\"so_sociallogin_height\":35,\"so_sociallogin_button\":\"icon\",\"so_sociallogin_status\":1,\"so_sociallogin_popuplogin\":1,\"so_sociallogin_fbtitle\":\"Facebook Login\",\"so_sociallogin_fbimage\":\"catalog\\/sociallogin\\/fb.png\",\"so_sociallogin_fbapikey\":\"442675926063537\",\"so_sociallogin_fbsecretapi\":\"88d0f814891d4d1a9b173647291a911e\",\"so_sociallogin_fbstatus\":1,\"so_sociallogin_twittertitle\":\"Twitter Login\",\"so_sociallogin_twitimage\":\"catalog\\/sociallogin\\/twitter.png\",\"so_sociallogin_twitapikey\":\"EEJ3pjetfaHXrOw54ZyjATQGw\",\"so_sociallogin_twitsecretapi\":\"i7kGpUlhPsEmb4AkmaSQ2kFqgBM2U1nYs7ijHGk2f65J0672mP\",\"so_sociallogin_twitstatus\":1,\"so_sociallogin_googletitle\":\"Google Login\",\"so_sociallogin_googleimage\":\"catalog\\/sociallogin\\/google.png\",\"so_sociallogin_googleapikey\":\"21690390667-tco9t3ca2o89d3sshkb2fmppoioq5mfq.apps.googleusercontent.com\",\"so_sociallogin_googlesecretapi\":\"COYNPrxaLq42QdIM2XBPASna\",\"so_sociallogin_googlestatus\":1,\"so_sociallogin_linkedintitle\":\"Linkedin Login\",\"so_sociallogin_linkdinimage\":\"catalog\\/sociallogin\\/linkedin.png\",\"so_sociallogin_linkdinapikey\":\"78b7xin6x0kjj3\",\"so_sociallogin_linkdinsecretapi\":\"qvTyRdKakj6WFmWs\",\"so_sociallogin_linkstatus\":1,\"name\":\"So Social Login\"}'),
(325, 'Top menu', 'so_megamenu', '{\"button-save\":\"\",\"moduleid\":\"325\",\"name\":\"Top menu\",\"suffix_class\":\"top-menu\",\"head_name\":{\"2\":\"\",\"1\":\"\"},\"disp_title_module\":\"1\",\"status\":\"1\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"orientation\":\"1\",\"show_itemver\":\"\",\"navigation_text\":{\"2\":\"\",\"1\":\"\"},\"full_width\":\"0\",\"home_item\":\"disabled\",\"home_text\":{\"2\":\"\",\"1\":\"\"},\"animation\":\"slide\",\"animation_time\":\"\",\"layout_id\":100,\"position\":\"menu\",\"sort_order\":0,\"label_item\":\"hot\",\"icon_font\":\"fa fa-camera-retro\",\"class_menu\":\"\",\"search_bar\":0}'),
(326, 'Main menu', 'so_megamenu', '{\"button-save\":\"\",\"moduleid\":\"326\",\"name\":\"Main menu\",\"suffix_class\":\"main-menu\",\"head_name\":{\"2\":\"\",\"1\":\"\"},\"disp_title_module\":\"1\",\"status\":\"1\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"orientation\":\"0\",\"show_itemver\":\"\",\"navigation_text\":{\"2\":\"\",\"1\":\"\"},\"full_width\":\"0\",\"home_item\":\"icon\",\"home_text\":{\"2\":\"\",\"1\":\"\"},\"animation\":\"slide\",\"animation_time\":\"\",\"layout_id\":100,\"position\":\"menu\",\"sort_order\":0,\"label_item\":\"hot\",\"icon_font\":\"fa fa-camera-retro\",\"class_menu\":\"\",\"search_bar\":0}'),
(327, 'Footer', 'so_page_builder', '{\"page_builder\":\"[{\\\"text_class_id\\\":\\\"row_hl3r\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":0,\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":0,\\\"row_section\\\":0,\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":0,\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":0,\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_cw92\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":4,\\\"md_col\\\":\\\"4\\\",\\\"sm_col\\\":12,\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_osd2\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"TH\\u00d4NG TIN\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"INFORMATION\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p><img alt=\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\"\\/image\\/catalog\\/logo.png\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"height:92px; width:293px\\\\\\\\\\\\\\\" \\/><\\/p>\\\\\\\\n\\\\\\\\n<p>Head Office: 61\\/11 \\u0111\\u01b0\\u1eddng C\\u00f4 Giang, ph\\u01b0\\u1eddng C\\u1ea7u \\u00d4ng L\\u00e3nh, qu\\u1eadn 1, TPHCM<\\/p>\\\\\\\\n\\\\\\\\n<p>Brand Office: Ph\\u00f2ng 321, T\\u1ea7ng 2, T\\u00f2a nh\\u00e0 71 Nguy\\u1ec5n Ch\\u00ed Thanh, qu\\u1eadn \\u0110\\u1ed1ng \\u0110a, H\\u00e0 N\\u1ed9i<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u0110i\\u1ec7n tho\\u1ea1i: 08.3838.6706<\\/p>\\\\\\\\n\\\\\\\\n<p>Email: dang-thu.phuong@grassroots.com.vn<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p><img alt=\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\"\\/image\\/catalog\\/logo.png\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"height:92px; width:293px\\\\\\\\\\\\\\\" \\/><\\/p>\\\\\\\\n\\\\\\\\n<p>Head Office: 61\\/11 \\u0111\\u01b0\\u1eddng C\\u00f4 Giang, ph\\u01b0\\u1eddng C\\u1ea7u \\u00d4ng L\\u00e3nh, qu\\u1eadn 1, TPHCM<\\/p>\\\\\\\\n\\\\\\\\n<p>Brand Office: Ph\\u00f2ng 321, T\\u1ea7ng 2, T\\u00f2a nh\\u00e0 71 Nguy\\u1ec5n Ch\\u00ed Thanh, qu\\u1eadn \\u0110\\u1ed1ng \\u0110a, H\\u00e0 N\\u1ed9i<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u0110i\\u1ec7n tho\\u1ea1i: 08.3838.6706<\\/p>\\\\\\\\n\\\\\\\\n<p>Email: dang-thu.phuong@grassroots.com.vn<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_ufaj\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":4,\\\"md_col\\\":\\\"4\\\",\\\"sm_col\\\":\\\"6\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_0buf\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Danh m\\u1ee5c\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Categories\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<ul>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">\\u0110i\\u1ec1u tr\\u1ecb s\\u1eb9o r\\u1ed5 <\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">\\u0110i\\u1ec1u tr\\u1ecb s\\u1eb9o v\\u1ebft th\\u01b0\\u01a1ng h\\u1edf <\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">C\\u0103ng da m\\u1eb7t <\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Thi\\u1ebft b\\u1ecb laser th\\u1ea9m m\\u1ef9 <\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Ch\\u1eefa tr\\u1ecb s\\u1eb9o Th\\u1ea9m m\\u1ef9 <\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">B\\u00f4i ngo\\u00e0i da <\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Ti\\u00eam tr\\u1ebb h\\u00f3a<\\/a><\\/li>\\\\\\\\n  <li><\\/li>\\\\\\\\n  <li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">H\\u1ec7 th\\u1ed1ng ph\\u00e2n ph\\u1ed1i<\\/a><\\/li>\\\\\\\\n<\\/ul>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<ul>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">\\u0110i\\u1ec1u tr\\u1ecb s\\u1eb9o r\\u1ed5 <\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">\\u0110i\\u1ec1u tr\\u1ecb s\\u1eb9o v\\u1ebft th\\u01b0\\u01a1ng h\\u1edf <\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">C\\u0103ng da m\\u1eb7t <\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Thi\\u1ebft b\\u1ecb laser th\\u1ea9m m\\u1ef9 <\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Ch\\u1eefa tr\\u1ecb s\\u1eb9o Th\\u1ea9m m\\u1ef9 <\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">B\\u00f4i ngo\\u00e0i da <\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\">Ti\\u00eam tr\\u1ebb h\\u00f3a<\\/a><\\/li>\\\\\\\\n<\\/ul>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_ynyz\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":4,\\\"md_col\\\":\\\"4\\\",\\\"sm_col\\\":6,\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_ttk0\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"LI\\u00caN K\\u1ebeT\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"CONNECT\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"social_footer\\\\\\\\\\\\\\\">\\\\\\\\n<ul>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"fa fa-facebook\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"color:#000000\\\\\\\\\\\\\\\"><\\/span><\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"fa fa-google-plus\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"color:#000000\\\\\\\\\\\\\\\"><\\/span><\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"fa fa-instagram\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"color:#000000\\\\\\\\\\\\\\\"><\\/span><\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"fa fa-twitter\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"color:#000000\\\\\\\\\\\\\\\"><\\/span><\\/a><\\/li>\\\\\\\\n<\\/ul>\\\\\\\\n<\\/div>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n<div class=\\\\\\\\\\\\\\\"fb-page\\\\\\\\\\\\\\\" data-href=\\\\\\\\\\\\\\\"https:\\/\\/www.facebook.com\\/webicovn\\/\\\\\\\\\\\\\\\" data-small-header=\\\\\\\\\\\\\\\"true\\\\\\\\\\\\\\\" data-adapt-container-width=\\\\\\\\\\\\\\\"true\\\\\\\\\\\\\\\" data-hide-cover=\\\\\\\\\\\\\\\"false\\\\\\\\\\\\\\\" data-show-facepile=\\\\\\\\\\\\\\\"true\\\\\\\\\\\\\\\"><blockquote cite=\\\\\\\\\\\\\\\"https:\\/\\/www.facebook.com\\/webicovn\\/\\\\\\\\\\\\\\\" class=\\\\\\\\\\\\\\\"fb-xfbml-parse-ignore\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"https:\\/\\/www.facebook.com\\/webicovn\\/\\\\\\\\\\\\\\\">WEBICO.VN<\\/a><\\/blockquote><\\/div>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"social_footer\\\\\\\\\\\\\\\">\\\\\\\\n<ul>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"fa fa-facebook\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"color:#000000\\\\\\\\\\\\\\\"><\\/span><\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"fa fa-google-plus\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"color:#000000\\\\\\\\\\\\\\\"><\\/span><\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"fa fa-instagram\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"color:#000000\\\\\\\\\\\\\\\"><\\/span><\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a href=\\\\\\\\\\\\\\\"#\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"fa fa-twitter\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"color:#000000\\\\\\\\\\\\\\\"><\\/span><\\/a><\\/li>\\\\\\\\n<\\/ul>\\\\\\\\n<\\/div>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<div class=\\\\\\\\\\\\\\\"fb-page\\\\\\\\\\\\\\\" data-adapt-container-width=\\\\\\\\\\\\\\\"true\\\\\\\\\\\\\\\" data-hide-cover=\\\\\\\\\\\\\\\"false\\\\\\\\\\\\\\\" data-href=\\\\\\\\\\\\\\\"https:\\/\\/www.facebook.com\\/webicovn\\/\\\\\\\\\\\\\\\" data-show-facepile=\\\\\\\\\\\\\\\"true\\\\\\\\\\\\\\\" data-small-header=\\\\\\\\\\\\\\\"true\\\\\\\\\\\\\\\">\\\\\\\\n<blockquote><a href=\\\\\\\\\\\\\\\"https:\\/\\/www.facebook.com\\/webicovn\\/\\\\\\\\\\\\\\\">WebicoVN<\\/a><\\/blockquote>\\\\\\\\n<\\/div>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]}]\",\"name\":\"Footer\",\"status\":\"1\",\"import_theme\":\"0\",\"content_shortcode\":\"{&quot;cparent&quot;:[{&quot;name_shortcode_2&quot;:&quot;LI\\u00caN K\\u1ebeT&quot;,&quot;name_shortcode_1&quot;:&quot;CONNECT&quot;,&quot;name_shortcode_status&quot;:&quot;yes&quot;,&quot;content_2&quot;:&quot;&lt;div class=\\\\&quot;social_footer\\\\&quot;&gt;\\\\n&lt;ul&gt;\\\\n\\\\t&lt;li&gt;&lt;a href=\\\\&quot;#\\\\&quot;&gt;&lt;span class=\\\\&quot;fa fa-facebook\\\\&quot; style=\\\\&quot;color:#000000\\\\&quot;&gt;&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\\\n\\\\t&lt;li&gt;&lt;a href=\\\\&quot;#\\\\&quot;&gt;&lt;span class=\\\\&quot;fa fa-google-plus\\\\&quot; style=\\\\&quot;color:#000000\\\\&quot;&gt;&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\\\n\\\\t&lt;li&gt;&lt;a href=\\\\&quot;#\\\\&quot;&gt;&lt;span class=\\\\&quot;fa fa-instagram\\\\&quot; style=\\\\&quot;color:#000000\\\\&quot;&gt;&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\\\n\\\\t&lt;li&gt;&lt;a href=\\\\&quot;#\\\\&quot;&gt;&lt;span class=\\\\&quot;fa fa-twitter\\\\&quot; style=\\\\&quot;color:#000000\\\\&quot;&gt;&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\\\n&lt;\\/ul&gt;\\\\n&lt;\\/div&gt;\\\\n\\\\n&lt;p&gt;&amp;nbsp;&lt;\\/p&gt;\\\\n&lt;div class=\\\\&quot;fb-page\\\\&quot; data-href=\\\\&quot;https:\\/\\/www.facebook.com\\/webicovn\\/\\\\&quot; data-small-header=\\\\&quot;true\\\\&quot; data-adapt-container-width=\\\\&quot;true\\\\&quot; data-hide-cover=\\\\&quot;false\\\\&quot; data-show-facepile=\\\\&quot;true\\\\&quot;&gt;&lt;blockquote cite=\\\\&quot;https:\\/\\/www.facebook.com\\/webicovn\\/\\\\&quot; class=\\\\&quot;fb-xfbml-parse-ignore\\\\&quot;&gt;&lt;a href=\\\\&quot;https:\\/\\/www.facebook.com\\/webicovn\\/\\\\&quot;&gt;WEBICO.VN&lt;\\/a&gt;&lt;\\/blockquote&gt;&lt;\\/div&gt;\\\\n\\\\n&lt;p&gt;&amp;nbsp;&lt;\\/p&gt;\\\\n&quot;,&quot;content_1&quot;:&quot;&lt;div class=\\\\&quot;social_footer\\\\&quot;&gt;\\\\n&lt;ul&gt;\\\\n\\\\t&lt;li&gt;&lt;a href=\\\\&quot;#\\\\&quot;&gt;&lt;span class=\\\\&quot;fa fa-facebook\\\\&quot; style=\\\\&quot;color:#000000\\\\&quot;&gt;&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\\\n\\\\t&lt;li&gt;&lt;a href=\\\\&quot;#\\\\&quot;&gt;&lt;span class=\\\\&quot;fa fa-google-plus\\\\&quot; style=\\\\&quot;color:#000000\\\\&quot;&gt;&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\\\n\\\\t&lt;li&gt;&lt;a href=\\\\&quot;#\\\\&quot;&gt;&lt;span class=\\\\&quot;fa fa-instagram\\\\&quot; style=\\\\&quot;color:#000000\\\\&quot;&gt;&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\\\n\\\\t&lt;li&gt;&lt;a href=\\\\&quot;#\\\\&quot;&gt;&lt;span class=\\\\&quot;fa fa-twitter\\\\&quot; style=\\\\&quot;color:#000000\\\\&quot;&gt;&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\\\n&lt;\\/ul&gt;\\\\n&lt;\\/div&gt;\\\\n\\\\n&lt;p&gt;&amp;nbsp;&lt;\\/p&gt;\\\\n\\\\n&lt;div class=\\\\&quot;fb-page\\\\&quot; data-adapt-container-width=\\\\&quot;true\\\\&quot; data-hide-cover=\\\\&quot;false\\\\&quot; data-href=\\\\&quot;https:\\/\\/www.facebook.com\\/webicovn\\/\\\\&quot; data-show-facepile=\\\\&quot;true\\\\&quot; data-small-header=\\\\&quot;true\\\\&quot;&gt;\\\\n&lt;blockquote&gt;&lt;a href=\\\\&quot;https:\\/\\/www.facebook.com\\/webicovn\\/\\\\&quot;&gt;WebicoVN&lt;\\/a&gt;&lt;\\/blockquote&gt;\\\\n&lt;\\/div&gt;\\\\n\\\\n&lt;p&gt;&amp;nbsp;&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;&amp;nbsp;&lt;\\/p&gt;\\\\n&quot;,&quot;yt_class&quot;:&quot;&quot;,&quot;css_internal&quot;:&quot;&quot;}],&quot;cchild&quot;:{}}\",\"moduleid\":\"327\"}');
INSERT INTO `wbc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(328, 'Home page', 'so_page_builder', '{\"page_builder\":\"[{\\\"text_class_id\\\":\\\"row_ix51\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"1\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_v2p6\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home slideshow\\\",\\\"module\\\":\\\"revslideroutput.331\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]}]},{\\\"text_class_id\\\":\\\"row_2poj\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"1\\\",\\\"row_section_class\\\":\\\"abouts\\\",\\\"row_section_id\\\":\\\"abouts\\\",\\\"section_background_type\\\":\\\"2\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"catalog\\/home\\/abouts.jpg\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"right top\\\",\\\"section_bg_attachment\\\":\\\"scroll\\\",\\\"section_bg_scale\\\":\\\"\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_cd64\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"2\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"catalog\\/home\\/bg_logo.png\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center bottom\\\",\\\"bg_attachment\\\":\\\"scroll\\\",\\\"bg_scale\\\":\\\"\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"40px 0\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"7\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_h51n\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"GI\\u1edaI THI\\u1ec6U V\\u1ec0 GRASSROOTS\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"GI\\u1edaI THI\\u1ec6U V\\u1ec0 GRASSROOTS\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>GRASSROOTS Aesthetics Pharmar l\\u00e0 c\\u00f4ng ty chuy\\u00ean ph\\u00e2n ph\\u1ed1i d\\u01b0\\u1ee3c ph\\u1ea9m v\\u00e0 m\\u00e1y thi\\u1ebft b\\u1ecb th\\u1ea9m m\\u1ef9 cao c\\u1ea5p d\\u00f9ng trong ng\\u00e0nh Th\\u1ea9m m\\u1ef9. C\\u00e1c s\\u1ea3n ph\\u1ea9m \\u0111\\u01b0\\u1ee3c s\\u1ea3n xu\\u1ea5t t\\u1ea1i c\\u00e1c n\\u01b0\\u1edbc uy t\\u00edn tr\\u00ean th\\u1ebf gi\\u1edbi nh\\u01b0 M\\u1ef9, Ph\\u00e1p, \\u0110\\u1ee9c, Th\\u1ee5y S\\u0129,H\\u00e0n Qu\\u1ed1c, \\u00c1o\\u2026 v\\u00e0 \\u0111\\u1ea1t ch\\u1ee9ng ch\\u1ec9 ch\\u00e2u \\u00e2u FDA hay KFDA.\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p>V\\u1edbi t\\u1ea7m nh\\u00ecn n\\u0103ng \\u0111\\u1ed9ng v\\u1ec1 t\\u01b0\\u01a1ng lai c\\u1ee7a ng\\u00e0nh Th\\u1ea9m M\\u1ef9 Vi\\u1ec7t Nam, v\\u1ec1 \\u0111\\u1ed1i t\\u01b0\\u1ee3ng c\\u1ea3m th\\u1ee5 c\\u0169ng nh\\u01b0 kh\\u00e1t khao v\\u01b0\\u01a1n \\u0111\\u1ebfn c\\u00e1i \\u0111\\u1eb9p ho\\u00e0n h\\u1ea3o, ch\\u00fang t\\u00f4i x\\u00e1c \\u0111\\u1ecbnh cho m\\u00ecnh m\\u1ee5c ti\\u00eau tr\\u1edf th\\u00e0nh 1 trong Top 5 nh\\u1eefng Nh\\u00e0 Ph\\u00e2n Ph\\u1ed1i s\\u1ea3n ph\\u1ea9m v\\u1ec1 l\\u00e0m \\u0111\\u1eb9p cao c\\u1ea5p t\\u1ea1i \\u0110\\u00f4ng D\\u01b0\\u01a1ng.\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p><a href=\\\\\\\\\\\\\\\"\\/gioi-thieu\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\">Xem th\\u00eam<\\/a><\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>GRASSROOTS Aesthetics Pharmar l\\u00e0 c\\u00f4ng ty chuy\\u00ean ph\\u00e2n ph\\u1ed1i d\\u01b0\\u1ee3c ph\\u1ea9m v\\u00e0 m\\u00e1y thi\\u1ebft b\\u1ecb th\\u1ea9m m\\u1ef9 cao c\\u1ea5p d\\u00f9ng trong ng\\u00e0nh Th\\u1ea9m m\\u1ef9. C\\u00e1c s\\u1ea3n ph\\u1ea9m \\u0111\\u01b0\\u1ee3c s\\u1ea3n xu\\u1ea5t t\\u1ea1i c\\u00e1c n\\u01b0\\u1edbc uy t\\u00edn tr\\u00ean th\\u1ebf gi\\u1edbi nh\\u01b0 M\\u1ef9, Ph\\u00e1p, \\u0110\\u1ee9c, Th\\u1ee5y S\\u0129,H\\u00e0n Qu\\u1ed1c, \\u00c1o\\u2026 v\\u00e0 \\u0111\\u1ea1t ch\\u1ee9ng ch\\u1ec9 ch\\u00e2u \\u00e2u FDA hay KFDA.\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p>V\\u1edbi t\\u1ea7m nh\\u00ecn n\\u0103ng \\u0111\\u1ed9ng v\\u1ec1 t\\u01b0\\u01a1ng lai c\\u1ee7a ng\\u00e0nh Th\\u1ea9m M\\u1ef9 Vi\\u1ec7t Nam, v\\u1ec1 \\u0111\\u1ed1i t\\u01b0\\u1ee3ng c\\u1ea3m th\\u1ee5 c\\u0169ng nh\\u01b0 kh\\u00e1t khao v\\u01b0\\u01a1n \\u0111\\u1ebfn c\\u00e1i \\u0111\\u1eb9p ho\\u00e0n h\\u1ea3o, ch\\u00fang t\\u00f4i x\\u00e1c \\u0111\\u1ecbnh cho m\\u00ecnh m\\u1ee5c ti\\u00eau tr\\u1edf th\\u00e0nh 1 trong Top 5 nh\\u1eefng Nh\\u00e0 Ph\\u00e2n Ph\\u1ed1i s\\u1ea3n ph\\u1ea9m v\\u1ec1 l\\u00e0m \\u0111\\u1eb9p cao c\\u1ea5p t\\u1ea1i \\u0110\\u00f4ng D\\u01b0\\u01a1ng.\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p><a href=\\\\\\\\\\\\\\\"\\/gioi-thieu\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\">Xem th\\u00eam<\\/a><\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"about-home\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]},{\\\"text_class_id\\\":\\\"row_jklg\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"40px\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"1\\\",\\\"row_section_class\\\":\\\"featured-box\\\",\\\"row_section_id\\\":\\\"featured-box\\\",\\\"section_background_type\\\":\\\"2\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"catalog\\/home\\/bg_green.jpg\\\",\\\"section_bg_repeat\\\":\\\"repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"scroll\\\",\\\"section_bg_scale\\\":\\\"\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_6eeb\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"2\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"catalog\\/home\\/bg_logo.png\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center bottom\\\",\\\"bg_attachment\\\":\\\"scroll\\\",\\\"bg_scale\\\":\\\"\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"50px 0\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":3,\\\"md_col\\\":3,\\\"sm_col\\\":6,\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Feature Box\\\",\\\"module\\\":\\\"feature_box_1fl8\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"feature_box\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Kh\\u00e1ch h\\u00e0ng\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Kh\\u00e1ch h\\u00e0ng\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"style\\\\\\\":\\\\\\\"style1\\\\\\\",\\\\\\\"box_color\\\\\\\":\\\\\\\"#fff\\\\\\\",\\\\\\\"radius\\\\\\\":\\\\\\\"100\\\\\\\",\\\\\\\"icon\\\\\\\":\\\\\\\"catalog\\/home\\/line2.png\\\\\\\",\\\\\\\"icon_color\\\\\\\":\\\\\\\"#ffffff\\\\\\\",\\\\\\\"icon_size\\\\\\\":\\\\\\\"40\\\\\\\",\\\\\\\"yt_title_2\\\\\\\":\\\\\\\"9999\\\\\\\",\\\\\\\"yt_title_1\\\\\\\":\\\\\\\"9999\\\\\\\",\\\\\\\"title_color\\\\\\\":\\\\\\\"#fff\\\\\\\",\\\\\\\"align\\\\\\\":\\\\\\\"center\\\\\\\",\\\\\\\"padding\\\\\\\":\\\\\\\"40\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_p5wc\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"2\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"catalog\\/home\\/bg_logo.png\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center bottom\\\",\\\"bg_attachment\\\":\\\"scroll\\\",\\\"bg_scale\\\":\\\"\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"50px 0\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":3,\\\"md_col\\\":3,\\\"sm_col\\\":6,\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Feature Box\\\",\\\"module\\\":\\\"feature_box_5c6x\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"feature_box\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"h\\u1ec7 th\\u1ed1ng\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"h\\u1ec7 th\\u1ed1ng\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"style\\\\\\\":\\\\\\\"style1\\\\\\\",\\\\\\\"box_color\\\\\\\":\\\\\\\"#fff\\\\\\\",\\\\\\\"radius\\\\\\\":\\\\\\\"100\\\\\\\",\\\\\\\"icon\\\\\\\":\\\\\\\"catalog\\/home\\/line2.png\\\\\\\",\\\\\\\"icon_color\\\\\\\":\\\\\\\"#ffffff\\\\\\\",\\\\\\\"icon_size\\\\\\\":\\\\\\\"40\\\\\\\",\\\\\\\"yt_title_2\\\\\\\":\\\\\\\"123\\\\\\\",\\\\\\\"yt_title_1\\\\\\\":\\\\\\\"123\\\\\\\",\\\\\\\"title_color\\\\\\\":\\\\\\\"#fff\\\\\\\",\\\\\\\"align\\\\\\\":\\\\\\\"center\\\\\\\",\\\\\\\"padding\\\\\\\":\\\\\\\"40\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_esnv\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"2\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"catalog\\/home\\/bg_logo.png\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center bottom\\\",\\\"bg_attachment\\\":\\\"scroll\\\",\\\"bg_scale\\\":\\\"\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"50px 0\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":3,\\\"md_col\\\":3,\\\"sm_col\\\":6,\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Feature Box\\\",\\\"module\\\":\\\"feature_box_vmrt\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"feature_box\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Chuy\\u00ean gia\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Chuy\\u00ean gia\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"style\\\\\\\":\\\\\\\"style1\\\\\\\",\\\\\\\"box_color\\\\\\\":\\\\\\\"#fff\\\\\\\",\\\\\\\"radius\\\\\\\":\\\\\\\"100\\\\\\\",\\\\\\\"icon\\\\\\\":\\\\\\\"catalog\\/home\\/line2.png\\\\\\\",\\\\\\\"icon_color\\\\\\\":\\\\\\\"#ffffff\\\\\\\",\\\\\\\"icon_size\\\\\\\":\\\\\\\"40\\\\\\\",\\\\\\\"yt_title_2\\\\\\\":\\\\\\\"425\\\\\\\",\\\\\\\"yt_title_1\\\\\\\":\\\\\\\"425\\\\\\\",\\\\\\\"title_color\\\\\\\":\\\\\\\"#fff\\\\\\\",\\\\\\\"align\\\\\\\":\\\\\\\"center\\\\\\\",\\\\\\\"padding\\\\\\\":\\\\\\\"40\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_t5jf\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"2\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"catalog\\/home\\/bg_logo.png\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center bottom\\\",\\\"bg_attachment\\\":\\\"scroll\\\",\\\"bg_scale\\\":\\\"\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"50px 0\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":3,\\\"md_col\\\":3,\\\"sm_col\\\":6,\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Feature Box\\\",\\\"module\\\":\\\"feature_box_ilch\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"feature_box\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"D\\u1ecbch v\\u1ee5\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Services\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"style\\\\\\\":\\\\\\\"style1\\\\\\\",\\\\\\\"box_color\\\\\\\":\\\\\\\"#fff\\\\\\\",\\\\\\\"radius\\\\\\\":\\\\\\\"100\\\\\\\",\\\\\\\"icon\\\\\\\":\\\\\\\"catalog\\/home\\/line2.png\\\\\\\",\\\\\\\"icon_color\\\\\\\":\\\\\\\"#ffffff\\\\\\\",\\\\\\\"icon_size\\\\\\\":\\\\\\\"40\\\\\\\",\\\\\\\"yt_title_2\\\\\\\":\\\\\\\"33\\\\\\\",\\\\\\\"yt_title_1\\\\\\\":\\\\\\\"333\\\\\\\",\\\\\\\"title_color\\\\\\\":\\\\\\\"#fff\\\\\\\",\\\\\\\"align\\\\\\\":\\\\\\\"center\\\\\\\",\\\\\\\"padding\\\\\\\":\\\\\\\"40\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]},{\\\"text_class_id\\\":\\\"row_pmm7\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"40px\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"1\\\",\\\"row_section_class\\\":\\\"brand-box\\\",\\\"row_section_id\\\":\\\"brand-box\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"catalog\\/home\\/bg_green.jpg\\\",\\\"section_bg_repeat\\\":\\\"repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"scroll\\\",\\\"section_bg_scale\\\":\\\"\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_4fg1\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":12,\\\"md_col\\\":12,\\\"sm_col\\\":12,\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_4nbf\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"TH\\u01af\\u01a0NG HI\\u1ec6U C\\u1ee6A CH\\u00daNG T\\u00d4I\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"title-brand\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"title-brand\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"},{\\\"name\\\":\\\"Th\\u01b0\\u01a1ng hi\\u1ec7u\\\",\\\"module\\\":\\\"banner.332\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]}]},{\\\"text_class_id\\\":\\\"row_z20m\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"40px\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"1\\\",\\\"row_section_class\\\":\\\"product-box\\\",\\\"row_section_id\\\":\\\"product-box\\\",\\\"section_background_type\\\":\\\"1\\\",\\\"section_bg_color\\\":\\\"#f6f6f6\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"catalog\\/home\\/bg_green.jpg\\\",\\\"section_bg_repeat\\\":\\\"repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"scroll\\\",\\\"section_bg_scale\\\":\\\"\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_36ch\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":12,\\\"md_col\\\":12,\\\"sm_col\\\":12,\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_cpg9\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"S\\u1ea2N PH\\u1ea8M\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"S\\u1ea2N PH\\u1ea8M\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\">GRASSROOTS Aesthetics Pharmar l\\u00e0 c\\u00f4ng ty chuy\\u00ean ph\\u00e2n ph\\u1ed1i d\\u01b0\\u1ee3c ph\\u1ea9m v\\u00e0 m\\u00e1y thi\\u1ebft b\\u1ecb <\\/span><\\/p>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\">th\\u1ea9m m\\u1ef9 cao c\\u1ea5p d\\u00f9ng trong ng\\u00e0nh Th\\u1ea9m m\\u1ef9<\\/span><\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\">GRASSROOTS Aesthetics Pharmar l\\u00e0 c\\u00f4ng ty chuy\\u00ean ph\\u00e2n ph\\u1ed1i d\\u01b0\\u1ee3c ph\\u1ea9m v\\u00e0 m\\u00e1y thi\\u1ebft b\\u1ecb <\\/span><\\/p>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\">th\\u1ea9m m\\u1ef9 cao c\\u1ea5p d\\u00f9ng trong ng\\u00e0nh Th\\u1ea9m m\\u1ef9<\\/span><\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"title-brand\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"},{\\\"name\\\":\\\"S\\u1ea3n ph\\u1ea9m Home\\\",\\\"module\\\":\\\"content_info.335\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]}]},{\\\"text_class_id\\\":\\\"row_8q3m\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#fff\\\",\\\"link_color\\\":\\\"#fff\\\",\\\"link_hover_color\\\":\\\"#fff\\\",\\\"heading_color\\\":\\\"#fff\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"40px\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"1\\\",\\\"row_section_class\\\":\\\"dieutri-box\\\",\\\"row_section_id\\\":\\\"dieutri-box\\\",\\\"section_background_type\\\":\\\"2\\\",\\\"section_bg_color\\\":\\\"#f6f6f6\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"catalog\\/home\\/bg1.jpg\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"scroll\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_ul1r\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":12,\\\"md_col\\\":12,\\\"sm_col\\\":12,\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_gwol\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"\\u0110I\\u1ec0U TR\\u1eca\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"\\u0110I\\u1ec0U TR\\u1eca\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\">Grassroots \\u0111i \\u0111\\u1ea7u trong l\\u0129nh v\\u1ef1c l\\u00e0m \\u0111\\u1eb9p v\\u00e0 ph\\u1ee5c h\\u1ed3i ,\\u0111\\u1ed9i ng\\u0169 gi\\u00e0u kinh nghi\\u1ec7m <\\/span><\\/p>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\">gi\\u00fap b\\u1ea1n l\\u1ea5y l\\u1ea1i v\\u1ebb \\u0111\\u1eb9p h\\u00e3y tr\\u1ea3i nghi\\u1ec7m c\\u00f9ng ch\\u00fang t\\u00f4i!<\\/span><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\"><\\/span><\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\"><\\/span><\\/p>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\">Grassroots \\u0111i \\u0111\\u1ea7u trong l\\u0129nh v\\u1ef1c l\\u00e0m \\u0111\\u1eb9p v\\u00e0 ph\\u1ee5c h\\u1ed3i ,\\u0111\\u1ed9i ng\\u0169 gi\\u00e0u kinh nghi\\u1ec7m <\\/span><\\/p>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\">gi\\u00fap b\\u1ea1n l\\u1ea5y l\\u1ea1i v\\u1ebb \\u0111\\u1eb9p h\\u00e3y tr\\u1ea3i nghi\\u1ec7m c\\u00f9ng ch\\u00fang t\\u00f4i!<\\/span><\\/p>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\"><\\/span><\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"title-brand\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"},{\\\"name\\\":\\\"\\u0110i\\u1ec1u tr\\u1ecb\\\",\\\"module\\\":\\\"dieutri_latest.336\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]}]},{\\\"text_class_id\\\":\\\"row_p7br\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"heading_color\\\":\\\"\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"40px\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"1\\\",\\\"row_section_class\\\":\\\"testeminal-box\\\",\\\"row_section_id\\\":\\\"testeminal-box\\\",\\\"section_background_type\\\":\\\"2\\\",\\\"section_bg_color\\\":\\\"#f6f6f6\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"catalog\\/testerminal\\/bg.jpg\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"scroll\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_ekip\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":12,\\\"md_col\\\":12,\\\"sm_col\\\":12,\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_jb4j\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"KH\\u00c1CH H\\u00c0NG C\\u1ea2M NH\\u1eacN \\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"KH\\u00c1CH H\\u00c0NG C\\u1ea2M NH\\u1eacN \\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"title-brand\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"},{\\\"name\\\":\\\"Testimonial\\\",\\\"module\\\":\\\"testimonial_m0a2\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"testimonial\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Testimonial\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Testimonial\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"yt_title_2\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"yt_title_1\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"display_avatar\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"items_column0\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"items_column1\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"items_column2\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"items_column3\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"items_column4\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"border\\\\\\\":\\\\\\\"0px solid #ccc\\\\\\\",\\\\\\\"background\\\\\\\":\\\\\\\"catalog\\/testerminal\\/bgtext.png\\\\\\\",\\\\\\\"title_color\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"testimonial\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{\\\\\\\"child1\\\\\\\":{\\\\\\\"author_2\\\\\\\":\\\\\\\"Di\\u1ec5m My\\\\\\\",\\\\\\\"author_1\\\\\\\":\\\\\\\"Di\\u1ec5m My\\\\\\\",\\\\\\\"position_2\\\\\\\":\\\\\\\"AUTHOR POSITION\\\\\\\",\\\\\\\"position_1\\\\\\\":\\\\\\\"AUTHOR POSITION\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/testerminal\\/1.png\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>\\u201cT\\u00f4i r\\u1ea5t h\\u00e0i l\\u00f2ng v\\u1ec1 s\\u1ea3n ph\\u1ea9m c\\u1ee7a Grassroots c\\u0169ng nh\\u01b0 \\u0111\\u1ed5i ng\\u1ee7 t\\u01b0 v\\u1ea5n r\\u1ea5t nhi\\u1ec7t t\\u00ecnh. T\\u00f4i s\\u1ebd \\u0111\\u1ed3ng h\\u00e0nh l\\u00e2u d\\u00e0i qu\\u00fd c\\u00f4ng ty\\u201d<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>\\u201cT\\u00f4i r\\u1ea5t h\\u00e0i l\\u00f2ng v\\u1ec1 s\\u1ea3n ph\\u1ea9m c\\u1ee7a Grassroots c\\u0169ng nh\\u01b0 \\u0111\\u1ed5i ng\\u1ee7 t\\u01b0 v\\u1ea5n r\\u1ea5t nhi\\u1ec7t t\\u00ecnh. T\\u00f4i s\\u1ebd \\u0111\\u1ed3ng h\\u00e0nh l\\u00e2u d\\u00e0i qu\\u00fd c\\u00f4ng ty\\u201d<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child2\\\\\\\":{\\\\\\\"author_2\\\\\\\":\\\\\\\"T\\u1ed1 Nh\\u01b0\\\\\\\",\\\\\\\"author_1\\\\\\\":\\\\\\\"T\\u1ed1 Nh\\u01b0\\\\\\\",\\\\\\\"position_2\\\\\\\":\\\\\\\"AUTHOR POSITION\\\\\\\",\\\\\\\"position_1\\\\\\\":\\\\\\\"AUTHOR POSITION\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/testerminal\\/3.png\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>\\u201cT\\u00f4i r\\u1ea5t h\\u00e0i l\\u00f2ng v\\u1ec1 s\\u1ea3n ph\\u1ea9m c\\u1ee7a Grassroots c\\u0169ng nh\\u01b0 \\u0111\\u1ed5i ng\\u1ee7 t\\u01b0 v\\u1ea5n r\\u1ea5t nhi\\u1ec7t t\\u00ecnh. T\\u00f4i s\\u1ebd \\u0111\\u1ed3ng h\\u00e0nh l\\u00e2u d\\u00e0i qu\\u00fd c\\u00f4ng ty\\u201d<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>\\u201cT\\u00f4i r\\u1ea5t h\\u00e0i l\\u00f2ng v\\u1ec1 s\\u1ea3n ph\\u1ea9m c\\u1ee7a Grassroots c\\u0169ng nh\\u01b0 \\u0111\\u1ed5i ng\\u1ee7 t\\u01b0 v\\u1ea5n r\\u1ea5t nhi\\u1ec7t t\\u00ecnh. T\\u00f4i s\\u1ebd \\u0111\\u1ed3ng h\\u00e0nh l\\u00e2u d\\u00e0i qu\\u00fd c\\u00f4ng ty\\u201d<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child3\\\\\\\":{\\\\\\\"author_2\\\\\\\":\\\\\\\"Tr\\u1ea7n B\\u00ecnh\\\\\\\",\\\\\\\"author_1\\\\\\\":\\\\\\\"Tr\\u1ea7n B\\u00ecnh\\\\\\\",\\\\\\\"position_2\\\\\\\":\\\\\\\"AUTHOR POSITION\\\\\\\",\\\\\\\"position_1\\\\\\\":\\\\\\\"AUTHOR POSITION\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/testerminal\\/4.png\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>\\u201cT\\u00f4i r\\u1ea5t h\\u00e0i l\\u00f2ng v\\u1ec1 s\\u1ea3n ph\\u1ea9m c\\u1ee7a Grassroots c\\u0169ng nh\\u01b0 \\u0111\\u1ed5i ng\\u1ee7 t\\u01b0 v\\u1ea5n r\\u1ea5t nhi\\u1ec7t t\\u00ecnh. T\\u00f4i s\\u1ebd \\u0111\\u1ed3ng h\\u00e0nh l\\u00e2u d\\u00e0i qu\\u00fd c\\u00f4ng ty\\u201d<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>\\u201cT\\u00f4i r\\u1ea5t h\\u00e0i l\\u00f2ng v\\u1ec1 s\\u1ea3n ph\\u1ea9m c\\u1ee7a Grassroots c\\u0169ng nh\\u01b0 \\u0111\\u1ed5i ng\\u1ee7 t\\u01b0 v\\u1ea5n r\\u1ea5t nhi\\u1ec7t t\\u00ecnh. T\\u00f4i s\\u1ebd \\u0111\\u1ed3ng h\\u00e0nh l\\u00e2u d\\u00e0i qu\\u00fd c\\u00f4ng ty\\u201d<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child4\\\\\\\":{\\\\\\\"author_2\\\\\\\":\\\\\\\"Tr\\u01b0\\u1eddng Ph\\u1ea1m\\\\\\\",\\\\\\\"author_1\\\\\\\":\\\\\\\"Tr\\u01b0\\u1eddng Ph\\u1ea1m\\\\\\\",\\\\\\\"position_2\\\\\\\":\\\\\\\"AUTHOR POSITION\\\\\\\",\\\\\\\"position_1\\\\\\\":\\\\\\\"AUTHOR POSITION\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/testerminal\\/5.png\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>\\u201cT\\u00f4i r\\u1ea5t h\\u00e0i l\\u00f2ng v\\u1ec1 s\\u1ea3n ph\\u1ea9m c\\u1ee7a Grassroots c\\u0169ng nh\\u01b0 \\u0111\\u1ed5i ng\\u1ee7 t\\u01b0 v\\u1ea5n r\\u1ea5t nhi\\u1ec7t t\\u00ecnh. T\\u00f4i s\\u1ebd \\u0111\\u1ed3ng h\\u00e0nh l\\u00e2u d\\u00e0i qu\\u00fd c\\u00f4ng ty\\u201d<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>\\u201cT\\u00f4i r\\u1ea5t h\\u00e0i l\\u00f2ng v\\u1ec1 s\\u1ea3n ph\\u1ea9m c\\u1ee7a Grassroots c\\u0169ng nh\\u01b0 \\u0111\\u1ed5i ng\\u1ee7 t\\u01b0 v\\u1ea5n r\\u1ea5t nhi\\u1ec7t t\\u00ecnh. T\\u00f4i s\\u1ebd \\u0111\\u1ed3ng h\\u00e0nh l\\u00e2u d\\u00e0i qu\\u00fd c\\u00f4ng ty\\u201d<\\/p>\\\\\\\\n\\\\\\\"}}}\\\"}],\\\"rows\\\":[]}]},{\\\"text_class_id\\\":\\\"row_vjqm\\\",\\\"text_class\\\":\\\"blog-style\\\",\\\"text_color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"heading_color\\\":\\\"\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"40px 0\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"0\\\",\\\"row_section_class\\\":\\\"\\\",\\\"row_section_id\\\":\\\"blog-box\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#f6f6f6\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"catalog\\/testerminal\\/bg.jpg\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"scroll\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_92c6\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":12,\\\"md_col\\\":12,\\\"sm_col\\\":12,\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_fum4\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Tin t\\u1ee9c\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Tin t\\u1ee9c\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"title-brand\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"},{\\\"name\\\":\\\"Tin t\\u1ee9c home\\\",\\\"module\\\":\\\"blog_latest.337\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]}]}]\",\"name\":\"Home page\",\"status\":\"1\",\"import_theme\":\"0\",\"content_shortcode\":\"{&quot;cparent&quot;:[{&quot;name_shortcode_2&quot;:&quot;Tin t\\u1ee9c&quot;,&quot;name_shortcode_1&quot;:&quot;Tin t\\u1ee9c&quot;,&quot;name_shortcode_status&quot;:&quot;yes&quot;,&quot;content_2&quot;:&quot;&quot;,&quot;content_1&quot;:&quot;&quot;,&quot;yt_class&quot;:&quot;title-brand&quot;,&quot;css_internal&quot;:&quot;&quot;}],&quot;cchild&quot;:{}}\",\"moduleid\":\"328\"}'),
(329, 'tìm kiếm', 'so_searchpro', '{\"name\":\"t\\u00ecm ki\\u1ebfm\",\"action\":\"save_edit\",\"module_description\":{\"2\":{\"head_name\":\"t\\u00ecm ki\\u1ebfm\",\"str_keyword\":\"ewewe\"},\"1\":{\"head_name\":\"t\\u00ecm ki\\u1ebfm\",\"str_keyword\":\"eww\"}},\"head_name\":\"t\\u00ecm ki\\u1ebfm\",\"disp_title_module\":\"0\",\"type_layout\":\"2\",\"class\":\"so-search\",\"width\":\"100\",\"height\":\"100\",\"limit\":\"5\",\"character\":\"3\",\"showcategory\":\"0\",\"showimage\":\"0\",\"showprice\":\"0\",\"status\":\"1\",\"show_keyword\":\"0\",\"str_keyword\":\"ewewe\",\"limit_keyword\":\"5\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"header_display1\":\"1\",\"header_display2\":\"1\",\"header_display3\":\"1\",\"header_display4\":\"1\",\"header_display5\":\"1\",\"header_display6\":\"1\",\"header_display7\":\"1\",\"moduleid\":\"329\"}'),
(330, 'Left header content', 'content_info', '{\"name\":\"Left header content\",\"show_title\":\"0\",\"type\":\"grid\",\"class\":\"content_header_left\",\"hidden_description\":\"1\",\"hidden_image\":\"1\",\"width\":\"20\",\"height\":\"20\",\"column\":\"4\",\"setting_link\":\"title\",\"status\":\"1\",\"info\":{\"name\":{\"2\":[\"&lt;i class=&quot;fa fa-phone&quot; aria-hidden=&quot;true&quot;&gt;&lt;\\/i&gt;  Hotline: 08.3838.6706\",\"&lt;i class=&quot;fa fa-facebook&quot; aria-hidden=&quot;true&quot;&gt;&lt;\\/i&gt;\",\"&lt;i class=&quot;fa fa-google-plus&quot; aria-hidden=&quot;true&quot;&gt;&lt;\\/i&gt;\",\"&lt;i class=&quot;fa fa-instagram&quot; aria-hidden=&quot;true&quot;&gt;&lt;\\/i&gt;\"],\"1\":[\"&lt;i class=&quot;fa fa-phone&quot; aria-hidden=&quot;true&quot;&gt;&lt;\\/i&gt;  Hotline: 08.3838.6706\",\"&lt;i class=&quot;fa fa-facebook&quot; aria-hidden=&quot;true&quot;&gt;&lt;\\/i&gt;\",\"&lt;i class=&quot;fa fa-google-plus&quot; aria-hidden=&quot;true&quot;&gt;&lt;\\/i&gt;\",\"&lt;i class=&quot;fa fa-instagram&quot; aria-hidden=&quot;true&quot;&gt;&lt;\\/i&gt;\"]},\"link\":[\"tel:08.3838.6706\",\"#\",\"#\",\"#\"]}}'),
(331, 'Home slideshow', 'revslideroutput', '{\"name\":\"Home slideshow\",\"slider_id\":\"1\",\"status\":\"1\"}'),
(332, 'Thương hiệu', 'banner', '{\"name\":\"Th\\u01b0\\u01a1ng hi\\u1ec7u\",\"banner_id\":\"8\",\"width\":\"180\",\"height\":\"90\",\"column\":\"5\",\"margin\":\"10\",\"style\":\"3\",\"status\":\"1\"}'),
(333, 'So Super Category', 'so_super_category', '{\"action\":\"save_edit\",\"name\":\"So Super Category\",\"module_description\":{\"2\":{\"head_name\":\"So Super Category\"},\"1\":{\"head_name\":\"So Super Category\"}},\"head_name\":\"So Super Category\",\"disp_title_module\":\"1\",\"status\":\"1\",\"advanced_mod_class_suffix\":\"\",\"item_link_target\":\"_blank\",\"category\":\"25\",\"category_depth\":\"4\",\"field_product_tab\":[\"pd_name\",\"p_model\",\"p_quantity\",\"sales\"],\"field_preload\":\"pd_name\",\"limitation\":\"4\",\"product_ordering\":\"ASC\",\"category_column0\":\"4\",\"category_column1\":\"4\",\"category_column2\":\"3\",\"category_column3\":\"2\",\"category_column4\":\"1\",\"category_title_maxlength\":\"25\",\"display_title_sub_category\":\"1\",\"display_slide_category\":\"1\",\"show_category_type\":\"1\",\"sub_category_title_maxlength\":\"25\",\"category_width\":\"200\",\"category_height\":\"100\",\"category_placeholder_path\":\"nophoto.png\",\"product_column0\":\"4\",\"product_column1\":\"4\",\"product_column2\":\"3\",\"product_column3\":\"2\",\"product_column4\":\"1\",\"type_show\":\"slider\",\"rows\":\"1\",\"product_display_title\":\"1\",\"product_title_maxlength\":\"25\",\"product_display_description\":\"1\",\"product_description_maxlength\":\"200\",\"product_display_price\":\"1\",\"display_add_to_cart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_rating\":\"1\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"7\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"product_width\":\"150\",\"product_height\":\"150\",\"product_placeholder_path\":\"nophoto.png\",\"effect\":\"flip\",\"product_duration\":\"600\",\"product_delay\":\"300\",\"subcategory_center\":\"0\",\"subcategory_display_navigation\":\"1\",\"subcategory_display_loop\":\"1\",\"subcategory_margin_right\":\"5\",\"subcategory_slideby\":\"1\",\"subcategory_auto_play\":\"0\",\"subcategory_auto_interval_timeout\":\"300\",\"subcategory_auto_hover_pause\":\"1\",\"subcategory_auto_play_speed\":\"300\",\"subcategory_navigation_speed\":\"3000\",\"subcategory_start_position\":\"0\",\"subcategory_mouse_drag\":\"1\",\"subcategory_touch_drag\":\"1\",\"slider_auto_play\":\"1\",\"slider_display_navigation\":\"1\",\"slider_display_loop\":\"1\",\"slider_mouse_drag\":\"1\",\"slider_touch_drag\":\"1\",\"slider_auto_hover_pause\":\"1\",\"slider_auto_interval_timeout\":\"5000\",\"slider_auto_play_speed\":\"2000\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"333\"}'),
(334, 'So Category Slider', 'so_category_slider', '{\"action\":\"save_edit\",\"name\":\"So Category Slider\",\"module_description\":{\"2\":{\"head_name\":\"So Category Slider\"},\"1\":{\"head_name\":\"So Category Slider\"}},\"head_name\":\"\",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"\",\"item_link_target\":\"_blank\",\"nb_column0\":\"4\",\"nb_column1\":\"4\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"category\":\"20\",\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"6\",\"display_feature\":\"0\",\"product_feature\":\"\",\"cat_title_display\":\"1\",\"cat_title_maxcharacs\":\"25\",\"cat_image_display\":\"1\",\"width_cat\":\"200\",\"height_cat\":\"200\",\"placeholder_path\":\"nophoto.png\",\"child_category_cat\":\"1\",\"source_limit_cat\":\"6\",\"cat_sub_title_maxcharacs\":\"25\",\"cat_all_product\":\"1\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"1\",\"description_maxlength\":\"50\",\"product_image\":\"1\",\"product_image_num\":\"1\",\"width\":\"200\",\"height\":\"200\",\"nb_row\":\"1\",\"display_rating\":\"1\",\"display_price\":\"1\",\"display_addtocart\":\"1\",\"display_wishlist\":\"1\",\"display_compare\":\"1\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"7\",\"margin\":\"5\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplay_timeout\":\"5000\",\"pausehover\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"navs\":\"1\",\"navSpeed\":\"500\",\"effect\":\"starwars\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"  \",\"post_text\":\"  \",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"334\"}'),
(335, 'Sản phẩm Home', 'content_info', '{\"name\":\"S\\u1ea3n ph\\u1ea9m Home\",\"show_title\":\"0\",\"type\":\"column\",\"class\":\"product-home\",\"width\":\"340\",\"height\":\"250\",\"column\":\"3\",\"setting_link\":\"all\",\"status\":\"1\",\"info\":{\"name\":{\"2\":[\"Thi\\u1ebft b\\u1ecb laser th\\u1ea9m m\\u1ef9\",\"Ch\\u1eefa tr\\u1ecb s\\u1eb9o\",\"Th\\u1ea9m m\\u1ef9\",\" B\\u00f4i ngo\\u00e0i da\",\"Ti\\u00eam tr\\u1ebb h\\u00f3a\"],\"1\":[\"Thi\\u1ebft b\\u1ecb laser th\\u1ea9m m\\u1ef9\",\"Ch\\u1eefa tr\\u1ecb s\\u1eb9o\",\"Th\\u1ea9m m\\u1ef9\",\" B\\u00f4i ngo\\u00e0i da\",\"Ti\\u00eam tr\\u1ebb h\\u00f3a\"]},\"title\":{\"2\":[\"Trang thi\\u1ebft b\\u1ecb \",\"Gel l\\u00e0m \\u0111\\u1eb9p\",\"Trang thi\\u1ebft b\\u1ecb \",\"Gel l\\u00e0m \\u0111\\u1eb9p\",\"Gel l\\u00e0m \\u0111\\u1eb9p\"],\"1\":[\"Trang thi\\u1ebft b\\u1ecb \",\"Gel l\\u00e0m \\u0111\\u1eb9p\",\"Trang thi\\u1ebft b\\u1ecb \",\"Gel l\\u00e0m \\u0111\\u1eb9p\",\"Gel l\\u00e0m \\u0111\\u1eb9p\"]},\"description\":{\"2\":[\"\",\"\",\"\",\"\",\"\"],\"1\":[\"\",\"\",\"\",\"\",\"\"]},\"image\":[[\"catalog\\/home\\/p.png\",\"catalog\\/home\\/p2.png\",\"catalog\\/home\\/p3.png\",\"catalog\\/home\\/p4.png\",\"catalog\\/home\\/p5.png\"],[\"\",\"\",\"\",\"\",\"\"]],\"link\":[\"#\",\"#\",\"#\",\"#\",\"#\"]}}'),
(336, 'Điều trị', 'dieutri_latest', '{\"name\":\"\\u0110i\\u1ec1u tr\\u1ecb\",\"limit\":\"10\",\"columns\":\"3\",\"carousel\":\"1\",\"characters\":\"200\",\"thumb\":\"1\",\"width\":\"300\",\"height\":\"300\",\"status\":\"1\"}'),
(337, 'Tin tức home', 'blog_latest', '{\"name\":\"Tin t\\u1ee9c home\",\"limit\":\"10\",\"columns\":\"3\",\"carousel\":\"1\",\"characters\":\"200\",\"thumb\":\"1\",\"width\":\"400\",\"height\":\"200\",\"status\":\"1\"}');
INSERT INTO `wbc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(24, 'Mobile Page Builder - Home 1', 'so_page_builder', '{\"page_builder\":\"[{\\\"text_class_id\\\":\\\"row_v2u7\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":0,\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":0,\\\"row_section\\\":0,\\\"row_section_class\\\":\\\"section-style\\\",\\\"row_section_id\\\":\\\"\\\",\\\"section_background_type\\\":0,\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":0,\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_oqrd\\\",\\\"text_class\\\":\\\"menu_custom\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_8ng0\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Custom_Menu\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Custom_Menu\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"module\\\\\\\\\\\\\\\">\\\\\\\\n<div class=\\\\\\\\\\\\\\\"menu-link contentslider\\\\\\\\\\\\\\\" data-rtl=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-autoplay=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-autowidth=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-delay=\\\\\\\\\\\\\\\"4\\\\\\\\\\\\\\\" data-speed=\\\\\\\\\\\\\\\"0.6\\\\\\\\\\\\\\\" data-margin=\\\\\\\\\\\\\\\"10\\\\\\\\\\\\\\\" data-items_column1=\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\" data-items_column2=\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\" data-items_column3=\\\\\\\\\\\\\\\"2\\\\\\\\\\\\\\\" data-items_column4=\\\\\\\\\\\\\\\"2\\\\\\\\\\\\\\\" data-arrows=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-pagination=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-lazyload=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" \\\\\\\\\\\\\\\"=\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\" data-loop=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-hoverpause=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">New Arrivals<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">Best Sellers<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">Top Deals<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=simple_blog\\/category&simple_blog_category_id=5\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">Blog<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=information\\/information&information_id=4\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">About Us<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=information\\/contact\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">Contact Us<\\/span><\\/a><\\/div>\\\\\\\\n<\\/div>\\\\\\\\t\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"module\\\\\\\\\\\\\\\">\\\\\\\\n<div class=\\\\\\\\\\\\\\\"menu-link contentslider\\\\\\\\\\\\\\\" data-rtl=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-autoplay=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-autowidth=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-delay=\\\\\\\\\\\\\\\"4\\\\\\\\\\\\\\\" data-speed=\\\\\\\\\\\\\\\"0.6\\\\\\\\\\\\\\\" data-margin=\\\\\\\\\\\\\\\"10\\\\\\\\\\\\\\\" data-items_column1=\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\" data-items_column2=\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\" data-items_column3=\\\\\\\\\\\\\\\"2\\\\\\\\\\\\\\\" data-items_column4=\\\\\\\\\\\\\\\"2\\\\\\\\\\\\\\\" data-arrows=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-pagination=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-lazyload=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" \\\\\\\\\\\\\\\"=\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\" data-loop=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-hoverpause=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">New Arrivals<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">Best Sellers<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">Top Deals<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=simple_blog\\/category&simple_blog_category_id=5\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">Blog<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=information\\/information&information_id=4\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">About Us<\\/span><\\/a><\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-link\\\\\\\\\\\\\\\"><a href=\\\\\\\\\\\\\\\"index.php?route=information\\/contact\\\\\\\\\\\\\\\"><span class=\\\\\\\\\\\\\\\"menu-title\\\\\\\\\\\\\\\">Contact Us<\\/span><\\/a><\\/div>\\\\\\\\n<\\/div>\\\\\\\\t\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_9pr0\\\",\\\"text_class\\\":\\\"no-padding\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Mobile - Slide - Home 1\\\",\\\"module\\\":\\\"so_home_slider.12\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_63tw\\\",\\\"text_class\\\":\\\"no-padding\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_rhau\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Mobile_Banner1_Home1\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Mobile_Banner1_Home1\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"mobile-bn1-h1 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-2.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-3.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"mobile-bn1-h1 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-2.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-3.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_ukoq\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":12,\\\"md_col\\\":\\\"4\\\",\\\"sm_col\\\":\\\"6\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Home 1 - Featured Categories\\\",\\\"module\\\":\\\"so_html_content.22\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_07aq\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":12,\\\"md_col\\\":\\\"4\\\",\\\"sm_col\\\":\\\"6\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Mobile - Top Deals\\\",\\\"module\\\":\\\"so_deals.14\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_5fku\\\",\\\"text_class\\\":\\\"\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_zai2\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Mobile_Banner2_Home1\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Mobile_Banner2_Home1\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"mobile-bn2-h1 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-4.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"mobile-bn2-h1 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-4.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_o2b0\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":12,\\\"md_col\\\":\\\"4\\\",\\\"sm_col\\\":\\\"6\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Mobile - Best Sellers\\\",\\\"module\\\":\\\"so_extra_slider.13\\\",\\\"type\\\":\\\"module\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_w3j9\\\",\\\"text_class\\\":\\\"no-padding\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_bs4u\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Mobile_Banner3_Home1\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Mobile_Banner3_Home1\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"mobile-bn1-h1 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-5.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-6.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"mobile-bn1-h1 clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banners\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-5.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"banner21\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/banner-mobile-6.png\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_aykc\\\",\\\"text_class\\\":\\\"\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_iff1\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Brand_Home1\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Brand_Home1\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\" module\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<h3 class=\\\\\\\\\\\\\\\"modtitle\\\\\\\\\\\\\\\"><span>Top Brands<\\/span><\\/h3>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"contentslider\\\\\\\\\\\\\\\" data-rtl=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-autoplay=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-autowidth=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-delay=\\\\\\\\\\\\\\\"4\\\\\\\\\\\\\\\" data-speed=\\\\\\\\\\\\\\\"0.6\\\\\\\\\\\\\\\" data-margin=\\\\\\\\\\\\\\\"10\\\\\\\\\\\\\\\" data-items_column1=\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\" data-items_column2=\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\" data-items_column3=\\\\\\\\\\\\\\\"2\\\\\\\\\\\\\\\" data-items_column4=\\\\\\\\\\\\\\\"2\\\\\\\\\\\\\\\" data-arrows=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-pagination=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-lazyload=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-loop=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-hoverpause=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\" module\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<h3 class=\\\\\\\\\\\\\\\"modtitle\\\\\\\\\\\\\\\"><span>Top Brands<\\/span><\\/h3>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"contentslider\\\\\\\\\\\\\\\" data-rtl=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-autoplay=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-autowidth=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-delay=\\\\\\\\\\\\\\\"4\\\\\\\\\\\\\\\" data-speed=\\\\\\\\\\\\\\\"0.6\\\\\\\\\\\\\\\" data-margin=\\\\\\\\\\\\\\\"10\\\\\\\\\\\\\\\" data-items_column1=\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\" data-items_column2=\\\\\\\\\\\\\\\"1\\\\\\\\\\\\\\\" data-items_column3=\\\\\\\\\\\\\\\"2\\\\\\\\\\\\\\\" data-items_column4=\\\\\\\\\\\\\\\"2\\\\\\\\\\\\\\\" data-arrows=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-pagination=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-lazyload=\\\\\\\\\\\\\\\"no\\\\\\\\\\\\\\\" data-loop=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\" data-hoverpause=\\\\\\\\\\\\\\\"yes\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"item-brand item-scroll\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<a href=\\\\\\\\\\\\\\\"index.php?route=mobile\\/home\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<img src=\\\\\\\\\\\\\\\"image\\/catalog\\/demo-mobile\\/banner\\/brand-mobile.jpg\\\\\\\\\\\\\\\" alt=\\\\\\\\\\\\\\\"Image Client\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/a>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_724x\\\",\\\"text_class\\\":\\\"\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_bj24\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Sevicer_Home1\\\\\\\",\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Sevicer_Home1\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"block-mobile clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info info1\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"inner\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-truck\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info-content\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<span>free delivery<\\/span>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>From 275 AED<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info info2\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"inner\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-money\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info-content\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<span>free delivery<\\/span>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>From 275 AED<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info info3\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"inner\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-gift\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info-content\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<span>free gift box<\\/span>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>& gift note<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<div class=\\\\\\\\\\\\\\\"block-mobile clearfix\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info info1\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"inner\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-truck\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info-content\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<span>free delivery<\\/span>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>From 275 AED<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info info2\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"inner\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-money\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info-content\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<span>free delivery<\\/span>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>From 275 AED<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info info3\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"inner\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<i class=\\\\\\\\\\\\\\\"fa fa-gift\\\\\\\\\\\\\\\"><\\/i>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<div class=\\\\\\\\\\\\\\\"info-content\\\\\\\\\\\\\\\">\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<span>free gift box<\\/span>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t\\\\\\\\t<p>& gift note<\\/p>\\\\\\\\n\\\\\\\\t\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t\\\\\\\\t<\\/div>\\\\\\\\n\\\\\\\\t<\\/div>\\\\\\\\n<\\/div>\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]}]\",\"name\":\"Mobile Page Builder - Home 1\",\"status\":\"1\",\"import_theme\":\"0\",\"content_shortcode\":\"{&quot;cparent&quot;:[{&quot;name_shortcode_1&quot;:&quot;Sevicer_Home1&quot;,&quot;name_shortcode_2&quot;:&quot;Sevicer_Home1&quot;,&quot;name_shortcode_status&quot;:&quot;no&quot;,&quot;content_1&quot;:&quot;&lt;div class=\\\\&quot;block-mobile clearfix\\\\&quot;&gt;\\\\n\\\\t&lt;div class=\\\\&quot;info info1\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;inner\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;i class=\\\\&quot;fa fa-truck\\\\&quot;&gt;&lt;\\/i&gt;\\\\n\\\\t\\\\t\\\\t&lt;div class=\\\\&quot;info-content\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;span&gt;free delivery&lt;\\/span&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;p&gt;From 275 AED&lt;\\/p&gt;\\\\n\\\\t\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;div class=\\\\&quot;info info2\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;inner\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;i class=\\\\&quot;fa fa-money\\\\&quot;&gt;&lt;\\/i&gt;\\\\n\\\\t\\\\t\\\\t&lt;div class=\\\\&quot;info-content\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;span&gt;free delivery&lt;\\/span&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;p&gt;From 275 AED&lt;\\/p&gt;\\\\n\\\\t\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;div class=\\\\&quot;info info3\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;inner\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;i class=\\\\&quot;fa fa-gift\\\\&quot;&gt;&lt;\\/i&gt;\\\\n\\\\t\\\\t\\\\t&lt;div class=\\\\&quot;info-content\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;span&gt;free gift box&lt;\\/span&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;p&gt;&amp; gift note&lt;\\/p&gt;\\\\n\\\\t\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n&lt;\\/div&gt;&quot;,&quot;content_2&quot;:&quot;&lt;div class=\\\\&quot;block-mobile clearfix\\\\&quot;&gt;\\\\n\\\\t&lt;div class=\\\\&quot;info info1\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;inner\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;i class=\\\\&quot;fa fa-truck\\\\&quot;&gt;&lt;\\/i&gt;\\\\n\\\\t\\\\t\\\\t&lt;div class=\\\\&quot;info-content\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;span&gt;free delivery&lt;\\/span&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;p&gt;From 275 AED&lt;\\/p&gt;\\\\n\\\\t\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;div class=\\\\&quot;info info2\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;inner\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;i class=\\\\&quot;fa fa-money\\\\&quot;&gt;&lt;\\/i&gt;\\\\n\\\\t\\\\t\\\\t&lt;div class=\\\\&quot;info-content\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;span&gt;free delivery&lt;\\/span&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;p&gt;From 275 AED&lt;\\/p&gt;\\\\n\\\\t\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;div class=\\\\&quot;info info3\\\\&quot;&gt;\\\\n\\\\t\\\\t&lt;div class=\\\\&quot;inner\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t&lt;i class=\\\\&quot;fa fa-gift\\\\&quot;&gt;&lt;\\/i&gt;\\\\n\\\\t\\\\t\\\\t&lt;div class=\\\\&quot;info-content\\\\&quot;&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;span&gt;free gift box&lt;\\/span&gt;\\\\n\\\\t\\\\t\\\\t\\\\t&lt;p&gt;&amp; gift note&lt;\\/p&gt;\\\\n\\\\t\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t\\\\t&lt;\\/div&gt;\\\\n\\\\t&lt;\\/div&gt;\\\\n&lt;\\/div&gt;&quot;,&quot;yt_class&quot;:&quot;&quot;,&quot;css_internal&quot;:&quot;&quot;}],&quot;cchild&quot;:{}}\",\"moduleid\":\"310\"}');
INSERT INTO `wbc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(339, 'Giới thiệu', 'so_page_builder', '{\"page_builder\":\"[{\\\"text_class_id\\\":\\\"row_bccl\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#841521\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"10px\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"1\\\",\\\"row_section_class\\\":\\\"menu-style\\\",\\\"row_section_id\\\":\\\"menuabouts\\\",\\\"section_background_type\\\":\\\"1\\\",\\\"section_bg_color\\\":\\\"#841521\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"fixed\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_3n0k\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_0dos\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Menu\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Menu\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<ul>\\\\\\\\n\\\\\\\\t<li><a class=\\\\\\\\\\\\\\\"page-scroll\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#vechungtoi\\\\\\\\\\\\\\\">V\\u1ec0 CH\\u00daNG T\\u00d4I<\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a class=\\\\\\\\\\\\\\\"page-scroll\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#lichsu\\\\\\\\\\\\\\\">L\\u1ecaCH S\\u1eec<\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a class=\\\\\\\\\\\\\\\"page-scroll\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#nhasanglap\\\\\\\\\\\\\\\">NH\\u00c0 S\\u00c1NG L\\u1eacP<\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a class=\\\\\\\\\\\\\\\"page-scroll\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#giatri\\\\\\\\\\\\\\\">GI\\u00c1 TR\\u1eca<\\/a>\\u00a0<\\/li>\\\\\\\\n\\\\\\\\t<li><a class=\\\\\\\\\\\\\\\"page-scroll\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#visaochon\\\\\\\\\\\\\\\">T\\u1ea0I SAO CH\\u1eccN CH\\u00daNG T\\u00d4I<\\/a><\\/li>\\\\\\\\n<\\/ul>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<ul>\\\\\\\\n\\\\\\\\t<li><a class=\\\\\\\\\\\\\\\"page-scroll\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#vechungtoi\\\\\\\\\\\\\\\">V\\u1ec0 CH\\u00daNG T\\u00d4I<\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a class=\\\\\\\\\\\\\\\"page-scroll\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#lichsu\\\\\\\\\\\\\\\">L\\u1ecaCH S\\u1eec<\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a class=\\\\\\\\\\\\\\\"page-scroll\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#nhasanglap\\\\\\\\\\\\\\\">NH\\u00c0 S\\u00c1NG L\\u1eacP<\\/a><\\/li>\\\\\\\\n\\\\\\\\t<li><a class=\\\\\\\\\\\\\\\"page-scroll\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#giatri\\\\\\\\\\\\\\\">GI\\u00c1 TR\\u1eca<\\/a>\\u00a0<\\/li>\\\\\\\\n\\\\\\\\t<li><a class=\\\\\\\\\\\\\\\"page-scroll\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"#visaochon\\\\\\\\\\\\\\\">T\\u1ea0I SAO CH\\u1eccN CH\\u00daNG T\\u00d4I<\\/a><\\/li>\\\\\\\\n<\\/ul>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"menu-onepage navbar\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]},{\\\"text_class_id\\\":\\\"row_2poj\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"1\\\",\\\"row_section_class\\\":\\\"abouts\\\",\\\"row_section_id\\\":\\\"vechungtoi\\\",\\\"section_background_type\\\":\\\"2\\\",\\\"section_bg_color\\\":\\\"#FFFFFF\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"catalog\\/home\\/abouts.jpg\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"right top\\\",\\\"section_bg_attachment\\\":\\\"scroll\\\",\\\"section_bg_scale\\\":\\\"\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_cd64\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"2\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"catalog\\/home\\/bg_logo.png\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center bottom\\\",\\\"bg_attachment\\\":\\\"scroll\\\",\\\"bg_scale\\\":\\\"\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"40px 0\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":6,\\\"md_col\\\":6,\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_h51n\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"GI\\u1edaI THI\\u1ec6U V\\u1ec0 GRASSROOTS\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"GI\\u1edaI THI\\u1ec6U V\\u1ec0 GRASSROOTS\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>GRASSROOTS Aesthetics Pharmar l\\u00e0 c\\u00f4ng ty chuy\\u00ean ph\\u00e2n ph\\u1ed1i d\\u01b0\\u1ee3c ph\\u1ea9m v\\u00e0 m\\u00e1y thi\\u1ebft b\\u1ecb th\\u1ea9m m\\u1ef9 cao c\\u1ea5p d\\u00f9ng trong ng\\u00e0nh Th\\u1ea9m m\\u1ef9. C\\u00e1c s\\u1ea3n ph\\u1ea9m \\u0111\\u01b0\\u1ee3c s\\u1ea3n xu\\u1ea5t t\\u1ea1i c\\u00e1c n\\u01b0\\u1edbc uy t\\u00edn tr\\u00ean th\\u1ebf gi\\u1edbi nh\\u01b0 M\\u1ef9, Ph\\u00e1p, \\u0110\\u1ee9c, Th\\u1ee5y S\\u0129,H\\u00e0n Qu\\u1ed1c, \\u00c1o\\u2026 v\\u00e0 \\u0111\\u1ea1t ch\\u1ee9ng ch\\u1ec9 ch\\u00e2u \\u00e2u FDA hay KFDA.<\\/p>\\\\\\\\n\\\\\\\\n<p>V\\u1edbi t\\u1ea7m nh\\u00ecn n\\u0103ng \\u0111\\u1ed9ng v\\u1ec1 t\\u01b0\\u01a1ng lai c\\u1ee7a ng\\u00e0nh Th\\u1ea9m M\\u1ef9 Vi\\u1ec7t Nam, v\\u1ec1 \\u0111\\u1ed1i t\\u01b0\\u1ee3ng c\\u1ea3m th\\u1ee5 c\\u0169ng nh\\u01b0 kh\\u00e1t khao v\\u01b0\\u01a1n \\u0111\\u1ebfn c\\u00e1i \\u0111\\u1eb9p ho\\u00e0n h\\u1ea3o, ch\\u00fang t\\u00f4i x\\u00e1c \\u0111\\u1ecbnh cho m\\u00ecnh m\\u1ee5c ti\\u00eau tr\\u1edf th\\u00e0nh 1 trong Top 5 nh\\u1eefng Nh\\u00e0 Ph\\u00e2n Ph\\u1ed1i s\\u1ea3n ph\\u1ea9m v\\u1ec1 l\\u00e0m \\u0111\\u1eb9p cao c\\u1ea5p t\\u1ea1i \\u0110\\u00f4ng D\\u01b0\\u01a1ng.<\\/p>\\\\\\\\n\\\\\\\\n<p>V\\u1edbi m\\u1ee5c ti\\u00eau tr\\u00ean Grassoots lu\\u00f4n cam k\\u1ebft ch\\u1ec9 ph\\u00e2n ph\\u1ed1i nh\\u1eefng s\\u1ea3n ph\\u1ea9m cao c\\u1ea5p \\u0111\\u01b0\\u1ee3c nghi\\u00ean c\\u1ee9u khoa h\\u1ecdc ch\\u1ee9ng minh. Ch\\u00fang t\\u00f4i kh\\u00f4ng ng\\u1eebng \\u0111\\u1ea7u t\\u01b0 cho \\u0111\\u1ed9i ng\\u0169 nh\\u00e2n vi\\u00ean th\\u1ef1c s\\u1ef1 chuy\\u00ean nghi\\u1ec7p, n\\u0103ng \\u0111\\u1ed9ng, c\\u00f3 tr\\u00e1ch nhi\\u1ec7m \\u0111am m\\u00ea trong l\\u0129nh v\\u1ef1c th\\u1ea9m m\\u1ef9: v\\u1eefng ki\\u1ebfn th\\u1ee9c, c\\u1ea7u ti\\u1ebfn, lu\\u00f4n kh\\u00e1t v\\u1ecdng h\\u1ecdc h\\u1ecfi, c\\u00f3 t\\u1ea7m nh\\u00ecn v\\u00e0 t\\u1ed1 ch\\u1ea5t trong l\\u0129nh v\\u1ef1c Th\\u1ea9m M\\u1ef9 N\\u1ed9i khoa.<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>GRASSROOTS Aesthetics Pharmar l\\u00e0 c\\u00f4ng ty chuy\\u00ean ph\\u00e2n ph\\u1ed1i d\\u01b0\\u1ee3c ph\\u1ea9m v\\u00e0 m\\u00e1y thi\\u1ebft b\\u1ecb th\\u1ea9m m\\u1ef9 cao c\\u1ea5p d\\u00f9ng trong ng\\u00e0nh Th\\u1ea9m m\\u1ef9. C\\u00e1c s\\u1ea3n ph\\u1ea9m \\u0111\\u01b0\\u1ee3c s\\u1ea3n xu\\u1ea5t t\\u1ea1i c\\u00e1c n\\u01b0\\u1edbc uy t\\u00edn tr\\u00ean th\\u1ebf gi\\u1edbi nh\\u01b0 M\\u1ef9, Ph\\u00e1p, \\u0110\\u1ee9c, Th\\u1ee5y S\\u0129,H\\u00e0n Qu\\u1ed1c, \\u00c1o\\u2026 v\\u00e0 \\u0111\\u1ea1t ch\\u1ee9ng ch\\u1ec9 ch\\u00e2u \\u00e2u FDA hay KFDA.<\\/p>\\\\\\\\n\\\\\\\\n<p>V\\u1edbi t\\u1ea7m nh\\u00ecn n\\u0103ng \\u0111\\u1ed9ng v\\u1ec1 t\\u01b0\\u01a1ng lai c\\u1ee7a ng\\u00e0nh Th\\u1ea9m M\\u1ef9 Vi\\u1ec7t Nam, v\\u1ec1 \\u0111\\u1ed1i t\\u01b0\\u1ee3ng c\\u1ea3m th\\u1ee5 c\\u0169ng nh\\u01b0 kh\\u00e1t khao v\\u01b0\\u01a1n \\u0111\\u1ebfn c\\u00e1i \\u0111\\u1eb9p ho\\u00e0n h\\u1ea3o, ch\\u00fang t\\u00f4i x\\u00e1c \\u0111\\u1ecbnh cho m\\u00ecnh m\\u1ee5c ti\\u00eau tr\\u1edf th\\u00e0nh 1 trong Top 5 nh\\u1eefng Nh\\u00e0 Ph\\u00e2n Ph\\u1ed1i s\\u1ea3n ph\\u1ea9m v\\u1ec1 l\\u00e0m \\u0111\\u1eb9p cao c\\u1ea5p t\\u1ea1i \\u0110\\u00f4ng D\\u01b0\\u01a1ng.<\\/p>\\\\\\\\n\\\\\\\\n<p>V\\u1edbi m\\u1ee5c ti\\u00eau tr\\u00ean Grassoots lu\\u00f4n cam k\\u1ebft ch\\u1ec9 ph\\u00e2n ph\\u1ed1i nh\\u1eefng s\\u1ea3n ph\\u1ea9m cao c\\u1ea5p \\u0111\\u01b0\\u1ee3c nghi\\u00ean c\\u1ee9u khoa h\\u1ecdc ch\\u1ee9ng minh. Ch\\u00fang t\\u00f4i kh\\u00f4ng ng\\u1eebng \\u0111\\u1ea7u t\\u01b0 cho \\u0111\\u1ed9i ng\\u0169 nh\\u00e2n vi\\u00ean th\\u1ef1c s\\u1ef1 chuy\\u00ean nghi\\u1ec7p, n\\u0103ng \\u0111\\u1ed9ng, c\\u00f3 tr\\u00e1ch nhi\\u1ec7m \\u0111am m\\u00ea trong l\\u0129nh v\\u1ef1c th\\u1ea9m m\\u1ef9: v\\u1eefng ki\\u1ebfn th\\u1ee9c, c\\u1ea7u ti\\u1ebfn, lu\\u00f4n kh\\u00e1t v\\u1ecdng h\\u1ecdc h\\u1ecfi, c\\u00f3 t\\u1ea7m nh\\u00ecn v\\u00e0 t\\u1ed1 ch\\u1ea5t trong l\\u0129nh v\\u1ef1c Th\\u1ea9m M\\u1ef9 N\\u1ed9i khoa.<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"about-home\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]},{\\\"text_class_id\\\":\\\"row_pmm7\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"40px\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"1\\\",\\\"row_section_class\\\":\\\"history-box\\\",\\\"row_section_id\\\":\\\"lichsu\\\",\\\"section_background_type\\\":\\\"1\\\",\\\"section_bg_color\\\":\\\"#eee\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"catalog\\/home\\/bg_green.jpg\\\",\\\"section_bg_repeat\\\":\\\"repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"scroll\\\",\\\"section_bg_scale\\\":\\\"\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_4fg1\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":12,\\\"md_col\\\":12,\\\"sm_col\\\":12,\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_4nbf\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"L\\u1ecaCH S\\u1eec\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"L\\u1ecaCH S\\u1eec\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"title-brand\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]},{\\\"text_class_id\\\":\\\"row_tkr6\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"40px\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"1\\\",\\\"row_section_class\\\":\\\"history-box2\\\",\\\"row_section_id\\\":\\\"history-box2\\\",\\\"section_background_type\\\":\\\"1\\\",\\\"section_bg_color\\\":\\\"#fff\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"catalog\\/home\\/bg_green.jpg\\\",\\\"section_bg_repeat\\\":\\\"repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"scroll\\\",\\\"section_bg_scale\\\":\\\"\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_8s1g\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":12,\\\"md_col\\\":12,\\\"sm_col\\\":12,\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_1qfr\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"CH\\u00daNG T\\u00d4I C\\u00d3 M\\u1eb6T TR\\u00caN TH\\u1eca TR\\u01af\\u1edcNG \\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"CH\\u00daNG T\\u00d4I C\\u00d3 M\\u1eb6T TR\\u00caN TH\\u1eca TR\\u01af\\u1edcNG \\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<h3 style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><strong>CH\\u00daNG T\\u00d4I C\\u00d3 M\\u1eb6T TR\\u00caN TH\\u1eca TR\\u01af\\u1edcNG\\u00a0<\\/strong><\\/h3>\\\\\\\\n\\\\\\\\n<h3 style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><span style=\\\\\\\\\\\\\\\"color:#c0392b\\\\\\\\\\\\\\\"><em>11 N\\u0102M<\\/em><\\/span><\\/h3>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\">GRASSROOTS Aesthetics Pharma l\\u00e0 nh\\u00e0 ph\\u00e2n ph\\u1ed1i \\u0111\\u1ed9c quy\\u1ec1n s\\u1ea3n ph\\u1ea9m d\\u01b0\\u1ee3c th\\u1ea9m m\\u1ef9 v\\u00e0 m\\u00e1y m\\u00f3c thi\\u1ebft b\\u1ecb cao c\\u1ea5p d\\u00f9ng trong ng\\u00e0nh th\\u1ea9m m\\u1ef9 t\\u1eeb c\\u00e1c th\\u01b0\\u01a1ng hi\\u1ec7u n\\u1ed5i ti\\u1ebfng t\\u1ea1i ch\\u00e2u \\u00c2u v\\u00e0 ch\\u00e2u M\\u1ef9<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<h3 style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><em><span style=\\\\\\\\\\\\\\\"color:#c0392b\\\\\\\\\\\\\\\"><\\/span><\\/em><\\/h3>\\\\\\\\n\\\\\\\\n<h3 style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><strong>CH\\u00daNG T\\u00d4I C\\u00d3 M\\u1eb6T TR\\u00caN TH\\u1eca TR\\u01af\\u1edcNG\\u00a0<\\/strong><\\/h3>\\\\\\\\n\\\\\\\\n<h3 style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><span style=\\\\\\\\\\\\\\\"color:#c0392b\\\\\\\\\\\\\\\"><em>11 N\\u0102M<\\/em><\\/span><\\/h3>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\">GRASSROOTS Aesthetics Pharma l\\u00e0 nh\\u00e0 ph\\u00e2n ph\\u1ed1i \\u0111\\u1ed9c quy\\u1ec1n s\\u1ea3n ph\\u1ea9m d\\u01b0\\u1ee3c th\\u1ea9m m\\u1ef9 v\\u00e0 m\\u00e1y m\\u00f3c thi\\u1ebft b\\u1ecb cao c\\u1ea5p d\\u00f9ng trong ng\\u00e0nh th\\u1ea9m m\\u1ef9 t\\u1eeb c\\u00e1c th\\u01b0\\u01a1ng hi\\u1ec7u n\\u1ed5i ti\\u1ebfng t\\u1ea1i ch\\u00e2u \\u00c2u v\\u00e0 ch\\u00e2u M\\u1ef9<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]},{\\\"text_class_id\\\":\\\"row_9yur\\\",\\\"text_class\\\":\\\"timeline-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"1\\\",\\\"row_section_class\\\":\\\"timeline-box\\\",\\\"row_section_id\\\":\\\"timeline-box\\\",\\\"section_background_type\\\":\\\"2\\\",\\\"section_bg_color\\\":\\\"#fff\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"catalog\\/abouts\\/bg_timeline.jpg\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"scroll\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_nwg8\\\",\\\"text_class\\\":\\\"timeline-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"12\\\",\\\"md_col\\\":12,\\\"sm_col\\\":12,\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"shortcode_timeline\\\",\\\"module\\\":\\\"timeline_tdzn\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"timeline\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"shortcode_timeline\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"shortcode_timeline\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"yt_title_2\\\\\\\":\\\\\\\"Title\\\\\\\",\\\\\\\"yt_title_1\\\\\\\":\\\\\\\"Title\\\\\\\",\\\\\\\"display_avatar\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{\\\\\\\"child1\\\\\\\":{\\\\\\\"date\\\\\\\":\\\\\\\"2006\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/no_image.jpg\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child2\\\\\\\":{\\\\\\\"date\\\\\\\":\\\\\\\"2007\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/no_image.jpg\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child3\\\\\\\":{\\\\\\\"date\\\\\\\":\\\\\\\"2008\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/no_image.jpg\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child4\\\\\\\":{\\\\\\\"date\\\\\\\":\\\\\\\"2009\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/no_image.jpg\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child5\\\\\\\":{\\\\\\\"date\\\\\\\":\\\\\\\"2010\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/no_image.jpg\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child6\\\\\\\":{\\\\\\\"date\\\\\\\":\\\\\\\"2011\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/no_image.jpg\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child7\\\\\\\":{\\\\\\\"date\\\\\\\":\\\\\\\"2012\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/no_image.jpg\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child8\\\\\\\":{\\\\\\\"date\\\\\\\":\\\\\\\"2013\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/no_image.jpg\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child9\\\\\\\":{\\\\\\\"date\\\\\\\":\\\\\\\"2014\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/no_image.jpg\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child10\\\\\\\":{\\\\\\\"date\\\\\\\":\\\\\\\"2015\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/no_image.jpg\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child11\\\\\\\":{\\\\\\\"date\\\\\\\":\\\\\\\"2016\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/no_image.jpg\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child12\\\\\\\":{\\\\\\\"date\\\\\\\":\\\\\\\"2017\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/no_image.jpg\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child13\\\\\\\":{\\\\\\\"date\\\\\\\":\\\\\\\"2006\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/no_image.jpg\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child14\\\\\\\":{\\\\\\\"date\\\\\\\":\\\\\\\"2006\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/no_image.jpg\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child15\\\\\\\":{\\\\\\\"date\\\\\\\":\\\\\\\"2006\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/no_image.jpg\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\"},\\\\\\\"child16\\\\\\\":{\\\\\\\"date\\\\\\\":\\\\\\\"2006\\\\\\\",\\\\\\\"avatar\\\\\\\":\\\\\\\"catalog\\/no_image.jpg\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\"}}}\\\"}],\\\"rows\\\":[]}]},{\\\"text_class_id\\\":\\\"row_z20m\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"1\\\",\\\"bg_color\\\":\\\"#eee\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"150px -15px 0\\\",\\\"padding\\\":\\\"0\\\",\\\"row_container_fluid\\\":\\\"1\\\",\\\"row_section\\\":\\\"1\\\",\\\"row_section_class\\\":\\\"ceo-box\\\",\\\"row_section_id\\\":\\\"nhasanglap\\\",\\\"section_background_type\\\":\\\"2\\\",\\\"section_bg_color\\\":\\\"#f6f6f6\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"catalog\\/home\\/bg_logo.png\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"right bottom\\\",\\\"section_bg_attachment\\\":\\\"scroll\\\",\\\"section_bg_scale\\\":\\\"\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_9xcg\\\",\\\"text_class\\\":\\\"ceo1-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"0\\\",\\\"margin\\\":\\\"0\\\",\\\"lg_col\\\":2,\\\"md_col\\\":\\\"3\\\",\\\"sm_col\\\":\\\"6\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Lightbox\\\",\\\"module\\\":\\\"lightbox_zye3\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"lightbox\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Lightbox\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Lightbox\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"yt_title_2\\\\\\\":\\\\\\\"YOURNAME\\\\\\\",\\\\\\\"yt_title_1\\\\\\\":\\\\\\\"YOURNAME\\\\\\\",\\\\\\\"align\\\\\\\":\\\\\\\"left\\\\\\\",\\\\\\\"type\\\\\\\":\\\\\\\"none\\\\\\\",\\\\\\\"style\\\\\\\":\\\\\\\"none\\\\\\\",\\\\\\\"src\\\\\\\":\\\\\\\"catalog\\/abouts\\/ceo1.jpg\\\\\\\",\\\\\\\"video_addr\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"width\\\\\\\":\\\\\\\"100%\\\\\\\",\\\\\\\"height\\\\\\\":\\\\\\\"100%\\\\\\\",\\\\\\\"lightbox\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"description_2\\\\\\\":\\\\\\\"<p>YOURNAME<\\/p>\\\\\\\\n\\\\\\\\n<p>Ng\\u01b0\\u1eddi s\\u00e1ng l\\u1eadp & CEO<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u00d4ng......... \\u00a0b\\u1eaft \\u0111\\u1ea7u kinh doanh t\\u1eeb ch\\u00ednh \\u0111am m\\u00ea v\\u1ec1 m\\u1ef9 ph\\u1ea9m c\\u1ee7a m\\u00ecnh v\\u00e0 s\\u1ef1 th\\u00e1ch th\\u1ee9c \\u0111\\u01b0a n\\u1ec1n m\\u1ef9 ph\\u1ea9m th\\u1ebf gi\\u1edbi \\u0111\\u1ebfn v\\u1edbi ph\\u1ee5 n\\u1eef Vi\\u1ec7t Nam. Sau g\\u1ea7n 15 n\\u0103m tr\\u00ean th\\u01b0\\u01a1ng tr\\u01b0\\u1eddng, b\\u00e0 kh\\u00f4ng ch\\u1ec9 \\u0111\\u01b0\\u1ee3c bi\\u1ebft \\u0111\\u1ebfn nh\\u01b0 m\\u1ed9t trong nh\\u1eefng ng\\u01b0\\u1eddi ti\\u00ean phong mang m\\u1ef9 ph\\u1ea9m qu\\u1ed1c t\\u1ebf v\\u1ec1 Vi\\u1ec7t Nam, \\u0111\\u01a1n v\\u1ecb kinh doanh nh\\u01b0\\u1ee3ng quy\\u1ec1n uy t\\u00edn c\\u1ee7a h\\u01a1n 8 th\\u01b0\\u01a1ng hi\\u1ec7u m\\u1ef9 ph\\u1ea9m n\\u1ed5i ti\\u1ebfng.<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"description_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_utjy\\\",\\\"text_class\\\":\\\"ceo2-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"0\\\",\\\"margin\\\":\\\"0\\\",\\\"lg_col\\\":2,\\\"md_col\\\":\\\"3\\\",\\\"sm_col\\\":\\\"6\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Lightbox\\\",\\\"module\\\":\\\"lightbox_ybtg\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"lightbox\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"Lightbox\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"Lightbox\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"yt_title_2\\\\\\\":\\\\\\\"YOURNAME\\\\\\\",\\\\\\\"yt_title_1\\\\\\\":\\\\\\\"YOURNAME\\\\\\\",\\\\\\\"align\\\\\\\":\\\\\\\"left\\\\\\\",\\\\\\\"type\\\\\\\":\\\\\\\"none\\\\\\\",\\\\\\\"style\\\\\\\":\\\\\\\"none\\\\\\\",\\\\\\\"src\\\\\\\":\\\\\\\"catalog\\/abouts\\/ceo2.jpg\\\\\\\",\\\\\\\"video_addr\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"width\\\\\\\":\\\\\\\"100%\\\\\\\",\\\\\\\"height\\\\\\\":\\\\\\\"100%\\\\\\\",\\\\\\\"lightbox\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"description_2\\\\\\\":\\\\\\\"<p>YOURNAME<\\/p>\\\\\\\\n\\\\\\\\n<p>Ng\\u01b0\\u1eddi s\\u00e1ng l\\u1eadp & CEO<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u00d4ng......... \\u00a0b\\u1eaft \\u0111\\u1ea7u kinh doanh t\\u1eeb ch\\u00ednh \\u0111am m\\u00ea v\\u1ec1 m\\u1ef9 ph\\u1ea9m c\\u1ee7a m\\u00ecnh v\\u00e0 s\\u1ef1 th\\u00e1ch th\\u1ee9c \\u0111\\u01b0a n\\u1ec1n m\\u1ef9 ph\\u1ea9m th\\u1ebf gi\\u1edbi \\u0111\\u1ebfn v\\u1edbi ph\\u1ee5 n\\u1eef Vi\\u1ec7t Nam. Sau g\\u1ea7n 15 n\\u0103m tr\\u00ean th\\u01b0\\u01a1ng tr\\u01b0\\u1eddng, b\\u00e0 kh\\u00f4ng ch\\u1ec9 \\u0111\\u01b0\\u1ee3c bi\\u1ebft \\u0111\\u1ebfn nh\\u01b0 m\\u1ed9t trong nh\\u1eefng ng\\u01b0\\u1eddi ti\\u00ean phong mang m\\u1ef9 ph\\u1ea9m qu\\u1ed1c t\\u1ebf v\\u1ec1 Vi\\u1ec7t Nam, \\u0111\\u01a1n v\\u1ecb kinh doanh nh\\u01b0\\u1ee3ng quy\\u1ec1n uy t\\u00edn c\\u1ee7a h\\u01a1n 8 th\\u01b0\\u01a1ng hi\\u1ec7u m\\u1ef9 ph\\u1ea9m n\\u1ed5i ti\\u1ebfng.<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"description_1\\\\\\\":\\\\\\\"<p>Add content here<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_36ch\\\",\\\"text_class\\\":\\\"aboutceo-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"50px 40px\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":7,\\\"md_col\\\":\\\"6\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_cpg9\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"NH\\u00c0 S\\u00c1NG L\\u1eacP\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"NH\\u00c0 S\\u00c1NG L\\u1eacP\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u0110\\u1eb1ng sau c\\u00e1c th\\u01b0\\u01a1ng hi\\u1ec7u m\\u1ef9 ph\\u1ea9m qu\\u1ed1c t\\u1ebf c\\u1ee7a ch\\u00fang t\\u00f4i l\\u00e0 nh\\u1eefng con ng\\u01b0\\u1eddi c\\u00f3 kh\\u1ea3 n\\u0103ng truy\\u1ec1n c\\u1ea3m h\\u1ee9ng, s\\u1edf h\\u1eefu ni\\u1ec1m \\u0111am m\\u00ea b\\u1ea5t t\\u1eadn v\\u00e0 t\\u1ea7m nh\\u00ecn xa tr\\u00ean th\\u1ecb tr\\u01b0\\u1eddng b\\u00e1n l\\u1ebb.<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p>\\u0110\\u1eb1ng sau c\\u00e1c th\\u01b0\\u01a1ng hi\\u1ec7u m\\u1ef9 ph\\u1ea9m qu\\u1ed1c t\\u1ebf c\\u1ee7a ch\\u00fang t\\u00f4i l\\u00e0 nh\\u1eefng con ng\\u01b0\\u1eddi c\\u00f3 kh\\u1ea3 n\\u0103ng truy\\u1ec1n c\\u1ea3m h\\u1ee9ng, s\\u1edf h\\u1eefu ni\\u1ec1m \\u0111am m\\u00ea b\\u1ea5t t\\u1eadn v\\u00e0 t\\u1ea7m nh\\u00ecn xa tr\\u00ean th\\u1ecb tr\\u01b0\\u1eddng b\\u00e1n l\\u1ebb.<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"title-brand\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]},{\\\"text_class_id\\\":\\\"row_8q3m\\\",\\\"text_class\\\":\\\"row-style\\\",\\\"text_color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"heading_color\\\":\\\"\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"40px\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"1\\\",\\\"row_section_class\\\":\\\"\\\",\\\"row_section_id\\\":\\\"giatri\\\",\\\"section_background_type\\\":\\\"0\\\",\\\"section_bg_color\\\":\\\"#f6f6f6\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"catalog\\/home\\/bg1.jpg\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"scroll\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_ul1r\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":12,\\\"md_col\\\":12,\\\"sm_col\\\":12,\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_gwol\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"GI\\u00c1 TR\\u1eca\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"GI\\u00c1 TR\\u1eca\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\">Grassroots c\\u0169ng x\\u00e1c \\u0111\\u1ecbnh ph\\u01b0\\u01a1ng ch\\u00e2m kinh doanh c\\u1ee7a m\\u00ecnh: Kh\\u00e1ch h\\u00e0ng l\\u00e0 c\\u00e1c \\u0111\\u1ed1i t\\u00e1c chi\\u1ebfn l\\u01b0\\u1ee3c, lu\\u00f4n \\u0111\\u1ed3ng h\\u00e0nh c\\u00f9ng nhau trong m\\u1ee5c ti\\u00eau c\\u00f9ng ph\\u00e1t tri\\u1ec3n ng\\u00e0nh Th\\u1ea9m m\\u1ef9, c\\u00f9ng ph\\u00e1t tri\\u1ec3n kinh doanh \\u0111\\u1ec3 \\u0111\\u01b0a ng\\u00e0nh Th\\u1ea9m M\\u1ef9 Vi\\u1ec7t Nam kh\\u00f4ng ng\\u1eebng ngang t\\u1ea7m v\\u1edbi khu v\\u1ef1c c\\u0169ng nh\\u01b0 b\\u1eaft k\\u1ecbp c\\u00e1c c\\u00f4ng ngh\\u1ec7 ti\\u00ean ti\\u1ebfn tr\\u00ean th\\u1ebf gi\\u1edbi.\\u00a0<\\/span><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\"><\\/span><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\"><\\/span><\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\"><\\/span><\\/p>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\">Grassroots c\\u0169ng x\\u00e1c \\u0111\\u1ecbnh ph\\u01b0\\u01a1ng ch\\u00e2m kinh doanh c\\u1ee7a m\\u00ecnh: Kh\\u00e1ch h\\u00e0ng l\\u00e0 c\\u00e1c \\u0111\\u1ed1i t\\u00e1c chi\\u1ebfn l\\u01b0\\u1ee3c, lu\\u00f4n \\u0111\\u1ed3ng h\\u00e0nh c\\u00f9ng nhau trong m\\u1ee5c ti\\u00eau c\\u00f9ng ph\\u00e1t tri\\u1ec3n ng\\u00e0nh Th\\u1ea9m m\\u1ef9, c\\u00f9ng ph\\u00e1t tri\\u1ec3n kinh doanh \\u0111\\u1ec3 \\u0111\\u01b0a ng\\u00e0nh Th\\u1ea9m M\\u1ef9 Vi\\u1ec7t Nam kh\\u00f4ng ng\\u1eebng ngang t\\u1ea7m v\\u1edbi khu v\\u1ef1c c\\u0169ng nh\\u01b0 b\\u1eaft k\\u1ecbp c\\u00e1c c\\u00f4ng ngh\\u1ec7 ti\\u00ean ti\\u1ebfn tr\\u00ean th\\u1ebf gi\\u1edbi.\\u00a0<\\/span><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\"><\\/span><\\/p>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><span style=\\\\\\\\\\\\\\\"font-size:16px\\\\\\\\\\\\\\\"><\\/span><\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"title-brand\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]},{\\\"text_class_id\\\":\\\"row_hrfn\\\",\\\"text_class\\\":\\\"giatri-style\\\",\\\"text_color\\\":\\\"#fff\\\",\\\"link_color\\\":\\\"#fff\\\",\\\"link_hover_color\\\":\\\"#fff\\\",\\\"heading_color\\\":\\\"#fff\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"0 0 80px 0\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"1\\\",\\\"row_section_class\\\":\\\"giatri-box\\\",\\\"row_section_id\\\":\\\"giatri-box\\\",\\\"section_background_type\\\":\\\"2\\\",\\\"section_bg_color\\\":\\\"#f6f6f6\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"catalog\\/abouts\\/bg_giatri.jpg\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"center center\\\",\\\"section_bg_attachment\\\":\\\"scroll\\\",\\\"section_bg_scale\\\":\\\"cover\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_c1sc\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"0 1px\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"4\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_52cu\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"N\\u1ec0N T\\u1ea2NG\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"N\\u1ec0N T\\u1ea2NG\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\">\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<h3 style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><strong>N\\u1ec0N T\\u1ea2NG<\\/strong><\\/h3>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><img alt=\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\"http:\\/\\/grassroots.dev\\/image\\/catalog\\/abouts\\/icon1.png\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"height:105px; width:84px\\\\\\\\\\\\\\\" \\/><\\/p>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\">Ch\\u00fang t\\u00f4i kh\\u00f4ng ng\\u1eebng \\u0111\\u1ea7u t\\u01b0 cho \\u0111\\u1ed9i ng\\u0169 nh\\u00e2n vi\\u00ean th\\u1ef1c s\\u1ef1 chuy\\u00ean nghi\\u1ec7p, n\\u0103ng \\u0111\\u1ed9ng, v\\u1eefng ki\\u1ebfn th\\u1ee9c, c\\u1ea7u ti\\u1ebfn, lu\\u00f4n kh\\u00e1t v\\u1ecdng h\\u1ecdc h\\u1ecfi, c\\u00f3 t\\u1ea7m nh\\u00ecn v\\u00e0 t\\u1ed1 ch\\u1ea5t trong l\\u0129nh v\\u1ef1c Th\\u1ea9m M\\u1ef9 N\\u1ed9i khoa.\\u00a0<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\">\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<h3 style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><strong>N\\u1ec0N T\\u1ea2NG<\\/strong><\\/h3>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><img alt=\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\"http:\\/\\/grassroots.dev\\/image\\/catalog\\/abouts\\/icon1.png\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"height:105px; width:84px\\\\\\\\\\\\\\\" \\/><\\/p>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\">Ch\\u00fang t\\u00f4i kh\\u00f4ng ng\\u1eebng \\u0111\\u1ea7u t\\u01b0 cho \\u0111\\u1ed9i ng\\u0169 nh\\u00e2n vi\\u00ean th\\u1ef1c s\\u1ef1 chuy\\u00ean nghi\\u1ec7p, n\\u0103ng \\u0111\\u1ed9ng, v\\u1eefng ki\\u1ebfn th\\u1ee9c, c\\u1ea7u ti\\u1ebfn, lu\\u00f4n kh\\u00e1t v\\u1ecdng h\\u1ecdc h\\u1ecfi, c\\u00f3 t\\u1ea7m nh\\u00ecn v\\u00e0 t\\u1ed1 ch\\u1ea5t trong l\\u0129nh v\\u1ef1c Th\\u1ea9m M\\u1ef9 N\\u1ed9i khoa.\\u00a0<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_0i6m\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"0 1px\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"4\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_xbic\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"TI\\u00caU CHU\\u1ea8N\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"N\\u1ec0N T\\u1ea2NG\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\">\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<h3 style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><strong>TI\\u00caU CHU\\u1ea8N<\\/strong><\\/h3>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><img alt=\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\"http:\\/\\/grassroots.dev\\/image\\/catalog\\/abouts\\/icon2.png\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"height:105px; width:88px\\\\\\\\\\\\\\\" \\/><\\/p>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\">GrassRoots \\u0111\\u1ec1 ra nh\\u1eefng k\\u1ef3 v\\u1ecdng cao \\u0111\\u1ed1i v\\u1edbi ch\\u1ea5t l\\u01b0\\u1ee3ng s\\u1ea3n ph\\u1ea9m v\\u00e0 quan h\\u1ec7 kh\\u00e1ch h\\u00e0ng. M\\u1ed9t m\\u00f4i tr\\u01b0\\u1eddng l\\u00e0m vi\\u1ec7c n\\u0103ng \\u0111\\u1ed9ng v\\u00e0 th\\u00e2n thi\\u1ec7n \\u0111\\u01b0\\u1ee3c duy tr\\u00ec \\u0111\\u1ec3 c\\u00f4ng vi\\u1ec7c \\u0111\\u1ea1t hi\\u1ec7u su\\u1ea5t cao nh\\u1ea5t.<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<h3 style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\">\\u00a0<\\/h3>\\\\\\\\n\\\\\\\\n<h3 style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><strong>TI\\u00caU CHU\\u1ea8N<\\/strong><\\/h3>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><img alt=\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\"http:\\/\\/grassroots.dev\\/image\\/catalog\\/abouts\\/icon2.png\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"height:105px; width:88px\\\\\\\\\\\\\\\" \\/><\\/p>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\">GrassRoots \\u0111\\u1ec1 ra nh\\u1eefng k\\u1ef3 v\\u1ecdng cao \\u0111\\u1ed1i v\\u1edbi ch\\u1ea5t l\\u01b0\\u1ee3ng s\\u1ea3n ph\\u1ea9m v\\u00e0 quan h\\u1ec7 kh\\u00e1ch h\\u00e0ng. M\\u1ed9t m\\u00f4i tr\\u01b0\\u1eddng l\\u00e0m vi\\u1ec7c n\\u0103ng \\u0111\\u1ed9ng v\\u00e0 th\\u00e2n thi\\u1ec7n \\u0111\\u01b0\\u1ee3c duy tr\\u00ec \\u0111\\u1ec3 c\\u00f4ng vi\\u1ec7c \\u0111\\u1ea1t hi\\u1ec7u su\\u1ea5t cao nh\\u1ea5t.<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]},{\\\"text_class_id\\\":\\\"col_k7h0\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":\\\"0\\\",\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"0 1px\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":\\\"4\\\",\\\"md_col\\\":\\\"12\\\",\\\"sm_col\\\":\\\"12\\\",\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_hxvy\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"\\u0110A D\\u1ea0NG\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"N\\u1ec0N T\\u1ea2NG\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"no\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\">\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<h3 style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><strong>\\u0110A D\\u1ea0NG<\\/strong><\\/h3>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><img alt=\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\"http:\\/\\/grassroots.dev\\/image\\/catalog\\/abouts\\/icon3.png\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"height:105px; width:99px\\\\\\\\\\\\\\\" \\/><\\/p>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\">GrassRoots t\\u00f4n tr\\u1ecdng s\\u1ef1 \\u0111a d\\u1ea1ng v\\u00e0 ti\\u1ebfp thu \\u00fd ki\\u1ebfn s\\u1ed1 \\u0111\\u00f4ng. B\\u1edfi ch\\u00fang t\\u00f4i hi\\u1ec3u r\\u1eb1ng con ng\\u01b0\\u1eddi l\\u00e0 t\\u00e0i s\\u1ea3n c\\u1ed1t l\\u00f5i \\u0111\\u1ec3 c\\u1ee7ng c\\u1ed1 doanh nghi\\u1ec7p v\\u00e0 danh ti\\u1ebfng th\\u01b0\\u01a1ng hi\\u1ec7u.\\u00a0<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\">\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<h3 style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><strong>\\u0110A D\\u1ea0NG<\\/strong><\\/h3>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\"><img alt=\\\\\\\\\\\\\\\"\\\\\\\\\\\\\\\" src=\\\\\\\\\\\\\\\"http:\\/\\/grassroots.dev\\/image\\/catalog\\/abouts\\/icon3.png\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"height:105px; width:99px\\\\\\\\\\\\\\\" \\/><\\/p>\\\\\\\\n\\\\\\\\n<p style=\\\\\\\\\\\\\\\"text-align:center\\\\\\\\\\\\\\\">GrassRoots t\\u00f4n tr\\u1ecdng s\\u1ef1 \\u0111a d\\u1ea1ng v\\u00e0 ti\\u1ebfp thu \\u00fd ki\\u1ebfn s\\u1ed1 \\u0111\\u00f4ng. B\\u1edfi ch\\u00fang t\\u00f4i hi\\u1ec3u r\\u1eb1ng con ng\\u01b0\\u1eddi l\\u00e0 t\\u00e0i s\\u1ea3n c\\u1ed1t l\\u00f5i \\u0111\\u1ec3 c\\u1ee7ng c\\u1ed1 doanh nghi\\u1ec7p v\\u00e0 danh ti\\u1ebfng th\\u01b0\\u01a1ng hi\\u1ec7u.\\u00a0<\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]},{\\\"text_class_id\\\":\\\"row_vjqm\\\",\\\"text_class\\\":\\\"blog-style\\\",\\\"text_color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"heading_color\\\":\\\"\\\",\\\"background_type\\\":\\\"0\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"video_type\\\":\\\"0\\\",\\\"link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"40px 0\\\",\\\"row_container_fluid\\\":\\\"0\\\",\\\"row_section\\\":\\\"1\\\",\\\"row_section_class\\\":\\\"\\\",\\\"row_section_id\\\":\\\"visaochon\\\",\\\"section_background_type\\\":\\\"2\\\",\\\"section_bg_color\\\":\\\"#f6f6f6\\\",\\\"section_bg_opacity\\\":\\\"100%\\\",\\\"section_bg_image\\\":\\\"catalog\\/home\\/bg_logo.png\\\",\\\"section_bg_repeat\\\":\\\"no-repeat\\\",\\\"section_bg_position\\\":\\\"left bottom\\\",\\\"section_bg_attachment\\\":\\\"scroll\\\",\\\"section_bg_scale\\\":\\\"auto\\\",\\\"section_video_type\\\":\\\"0\\\",\\\"section_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"cols\\\":[{\\\"text_class_id\\\":\\\"col_92c6\\\",\\\"text_class\\\":\\\"col-style\\\",\\\"text_color\\\":\\\"#000000\\\",\\\"link_color\\\":\\\"#000000\\\",\\\"link_hover_color\\\":\\\"#000000\\\",\\\"heading_color\\\":\\\"#000000\\\",\\\"background_type\\\":0,\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"bg_opacity\\\":\\\"100%\\\",\\\"bg_image\\\":\\\"\\\",\\\"bg_repeat\\\":\\\"no-repeat\\\",\\\"bg_position\\\":\\\"center center\\\",\\\"bg_attachment\\\":\\\"fixed\\\",\\\"bg_scale\\\":\\\"cover\\\",\\\"col_video_type\\\":0,\\\"col_link_video\\\":\\\"YE7VzlLtp-4\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"lg_col\\\":12,\\\"md_col\\\":12,\\\"sm_col\\\":12,\\\"xs_col\\\":\\\"12\\\",\\\"widgets\\\":[{\\\"name\\\":\\\"Html\\\",\\\"module\\\":\\\"html_fum4\\\",\\\"type\\\":\\\"shortcode\\\",\\\"shortcode\\\":\\\"html\\\",\\\"content\\\":\\\"{\\\\\\\"cparent\\\\\\\":[{\\\\\\\"name_shortcode_2\\\\\\\":\\\\\\\"T\\u1ea0I SAO CH\\u1eccN CH\\u00daNG T\\u00d4I\\\\\\\",\\\\\\\"name_shortcode_1\\\\\\\":\\\\\\\"T\\u1ea0I SAO CH\\u1eccN CH\\u00daNG T\\u00d4I\\\\\\\",\\\\\\\"name_shortcode_status\\\\\\\":\\\\\\\"yes\\\\\\\",\\\\\\\"content_2\\\\\\\":\\\\\\\"<p><span style=\\\\\\\\\\\\\\\"font-size:24px\\\\\\\\\\\\\\\"><strong>TH\\u01af\\u01a0NG HI\\u1ec6U R\\u1ed8NG KH\\u1eaeP<\\/strong><\\/span><\\/p>\\\\\\\\n\\\\\\\\n<p>B\\u1ea3n th\\u00e2n th\\u01b0\\u01a1ng hi\\u1ec7u Grass Roots l\\u00e0 nh\\u00e0 ph\\u00e2n ph\\u1ed1i \\u0111\\u1ed9c quy\\u1ec1n s\\u1ea3n ph\\u1ea9m d\\u01b0\\u1ee3c th\\u1ea9m m\\u1ef9 v\\u00e0 m\\u00e1y m\\u00f3c thi\\u1ebft b\\u1ecb cao c\\u1ea5p d\\u00f9ng trong ng\\u00e0nh th\\u1ea9m m\\u1ef9 t\\u1eeb c\\u00e1c th\\u01b0\\u01a1ng hi\\u1ec7u n\\u1ed5i ti\\u1ebfng t\\u1ea1i ch\\u00e2u \\u00c2u v\\u00e0 ch\\u00e2u M\\u1ef9 trong su\\u1ed1t h\\u01a1n 11 n\\u0103m t\\u1ea1i Vi\\u1ec7t Nam.<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p><strong><span style=\\\\\\\\\\\\\\\"font-size:24px\\\\\\\\\\\\\\\">TH\\u1ea4U HI\\u1ec2U V\\u0102N H\\u00d3A \\u0110\\u1ecaA PH\\u01af\\u01a0NG<\\/span><\\/strong><\\/p>\\\\\\\\n\\\\\\\\n<p>Grass Roots hi\\u1ec3u r\\u1eb1ng th\\u1ecb hi\\u1ebfu v\\u00e0 nhu c\\u1ea7u c\\u1ee7a th\\u1ecb tr\\u01b0\\u1eddng Vi\\u1ec7t Nam l\\u00e0 \\u0111i\\u1ec1u ti\\u00ean quy\\u1ebft \\u0111\\u1ec3 \\u0111\\u1ea7u t\\u01b0 th\\u00e0nh c\\u00f4ng. Grass Roots lu\\u00f4n n\\u1ed7 l\\u1ef1c \\u0111\\u1ec3 s\\u1ef1 xu\\u1ea5t hi\\u1ec7n c\\u1ee7a t\\u1eebng th\\u01b0\\u01a1ng hi\\u1ec7u l\\u00e0 m\\u1ed9t hi\\u1ec7n t\\u01b0\\u1ee3ng t\\u1ea1i \\u0111\\u00e2y, m\\u00e0 v\\u1eabn \\u0111\\u1ea3m b\\u1ea3o xu h\\u01b0\\u1edbng chung to\\u00e0n c\\u1ea7u.<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p><span style=\\\\\\\\\\\\\\\"font-size:24px\\\\\\\\\\\\\\\"><strong>C\\u01a0 H\\u1ed8I H\\u1ee2P T\\u00c1C<\\/strong><\\/span><\\/p>\\\\\\\\n\\\\\\\\n<p>N\\u1ebfu b\\u1ea1n mong mu\\u1ed1n g\\u00f3p ph\\u1ea7n lan t\\u1ecfa s\\u1ee9c s\\u1ed1ng l\\u00e0m \\u0111\\u1eb9p, chia s\\u1ebb nh\\u1eefng ph\\u01b0\\u01a1ng ph\\u00e1p v\\u00e0 \\u1ee9ng d\\u1ee5ng hi\\u1ec7n \\u0111\\u1ea1i \\u0111\\u1ec3 Vi\\u1ec7t Nam tr\\u1edf th\\u00e0nh m\\u1ed9t \\u0111i\\u1ec3m \\u0111\\u1ebfn h\\u1ea5p d\\u1eabn tr\\u00ean b\\u1ea3n \\u0111\\u1ed3 th\\u1ea9m m\\u1ef9 qu\\u1ed1c t\\u1ebf, th\\u00ec Grass Roots \\u00a0ch\\u00ednh l\\u00e0 \\u0111\\u1ed1i t\\u00e1c ho\\u00e0n h\\u1ea3o c\\u1ee7a b\\u1ea1n.<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p><a class=\\\\\\\\\\\\\\\"simple-button-plugin\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"\\/contact\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"display: inline-block;b;background-color: transparent;border: 1px solid #861521;padding: 5px 20px;border-radius: 50px;font-size: 14px;cursor: pointer;color: #861521 !important;text-decoration: none !important;\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\">Li\\u00ean h\\u1ec7<\\/a><\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"content_1\\\\\\\":\\\\\\\"<p><span style=\\\\\\\\\\\\\\\"font-size:24px\\\\\\\\\\\\\\\"><strong>TH\\u01af\\u01a0NG HI\\u1ec6U R\\u1ed8NG KH\\u1eaeP<\\/strong><\\/span><\\/p>\\\\\\\\n\\\\\\\\n<p>B\\u1ea3n th\\u00e2n th\\u01b0\\u01a1ng hi\\u1ec7u Grass Roots l\\u00e0 nh\\u00e0 ph\\u00e2n ph\\u1ed1i \\u0111\\u1ed9c quy\\u1ec1n s\\u1ea3n ph\\u1ea9m d\\u01b0\\u1ee3c th\\u1ea9m m\\u1ef9 v\\u00e0 m\\u00e1y m\\u00f3c thi\\u1ebft b\\u1ecb cao c\\u1ea5p d\\u00f9ng trong ng\\u00e0nh th\\u1ea9m m\\u1ef9 t\\u1eeb c\\u00e1c th\\u01b0\\u01a1ng hi\\u1ec7u n\\u1ed5i ti\\u1ebfng t\\u1ea1i ch\\u00e2u \\u00c2u v\\u00e0 ch\\u00e2u M\\u1ef9 trong su\\u1ed1t h\\u01a1n 11 n\\u0103m t\\u1ea1i Vi\\u1ec7t Nam.<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p><strong><span style=\\\\\\\\\\\\\\\"font-size:24px\\\\\\\\\\\\\\\">TH\\u1ea4U HI\\u1ec2U V\\u0102N H\\u00d3A \\u0110\\u1ecaA PH\\u01af\\u01a0NG<\\/span><\\/strong><\\/p>\\\\\\\\n\\\\\\\\n<p>Grass Roots hi\\u1ec3u r\\u1eb1ng th\\u1ecb hi\\u1ebfu v\\u00e0 nhu c\\u1ea7u c\\u1ee7a th\\u1ecb tr\\u01b0\\u1eddng Vi\\u1ec7t Nam l\\u00e0 \\u0111i\\u1ec1u ti\\u00ean quy\\u1ebft \\u0111\\u1ec3 \\u0111\\u1ea7u t\\u01b0 th\\u00e0nh c\\u00f4ng. Grass Roots lu\\u00f4n n\\u1ed7 l\\u1ef1c \\u0111\\u1ec3 s\\u1ef1 xu\\u1ea5t hi\\u1ec7n c\\u1ee7a t\\u1eebng th\\u01b0\\u01a1ng hi\\u1ec7u l\\u00e0 m\\u1ed9t hi\\u1ec7n t\\u01b0\\u1ee3ng t\\u1ea1i \\u0111\\u00e2y, m\\u00e0 v\\u1eabn \\u0111\\u1ea3m b\\u1ea3o xu h\\u01b0\\u1edbng chung to\\u00e0n c\\u1ea7u.<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p><span style=\\\\\\\\\\\\\\\"font-size:24px\\\\\\\\\\\\\\\"><strong>C\\u01a0 H\\u1ed8I H\\u1ee2P T\\u00c1C<\\/strong><\\/span><\\/p>\\\\\\\\n\\\\\\\\n<p>N\\u1ebfu b\\u1ea1n mong mu\\u1ed1n g\\u00f3p ph\\u1ea7n lan t\\u1ecfa s\\u1ee9c s\\u1ed1ng l\\u00e0m \\u0111\\u1eb9p, chia s\\u1ebb nh\\u1eefng ph\\u01b0\\u01a1ng ph\\u00e1p v\\u00e0 \\u1ee9ng d\\u1ee5ng hi\\u1ec7n \\u0111\\u1ea1i \\u0111\\u1ec3 Vi\\u1ec7t Nam tr\\u1edf th\\u00e0nh m\\u1ed9t \\u0111i\\u1ec3m \\u0111\\u1ebfn h\\u1ea5p d\\u1eabn tr\\u00ean b\\u1ea3n \\u0111\\u1ed3 th\\u1ea9m m\\u1ef9 qu\\u1ed1c t\\u1ebf, th\\u00ec Grass Roots \\u00a0ch\\u00ednh l\\u00e0 \\u0111\\u1ed1i t\\u00e1c ho\\u00e0n h\\u1ea3o c\\u1ee7a b\\u1ea1n.<\\/p>\\\\\\\\n\\\\\\\\n<p>\\u00a0<\\/p>\\\\\\\\n\\\\\\\\n<p><a class=\\\\\\\\\\\\\\\"simple-button-plugin\\\\\\\\\\\\\\\" href=\\\\\\\\\\\\\\\"\\/contact\\\\\\\\\\\\\\\" style=\\\\\\\\\\\\\\\"display: inline-block;b;background-color: transparent;border: 1px solid #861521;padding: 5px 20px;border-radius: 50px;font-size: 14px;cursor: pointer;color: #861521 !important;text-decoration: none !important;\\\\\\\\\\\\\\\" target=\\\\\\\\\\\\\\\"_blank\\\\\\\\\\\\\\\">Li\\u00ean h\\u1ec7<\\/a><\\/p>\\\\\\\\n\\\\\\\",\\\\\\\"yt_class\\\\\\\":\\\\\\\"title-brand\\\\\\\",\\\\\\\"css_internal\\\\\\\":\\\\\\\"\\\\\\\"}],\\\\\\\"cchild\\\\\\\":{}}\\\"}],\\\"rows\\\":[]}]}]\",\"name\":\"Gi\\u1edbi thi\\u1ec7u\",\"status\":\"1\",\"import_theme\":\"0\",\"content_shortcode\":\"{&quot;cparent&quot;:[{&quot;name_shortcode_2&quot;:&quot;T\\u1ea0I SAO CH\\u1eccN CH\\u00daNG T\\u00d4I&quot;,&quot;name_shortcode_1&quot;:&quot;T\\u1ea0I SAO CH\\u1eccN CH\\u00daNG T\\u00d4I&quot;,&quot;name_shortcode_status&quot;:&quot;yes&quot;,&quot;content_2&quot;:&quot;&lt;p&gt;&lt;span style=\\\\&quot;font-size:24px\\\\&quot;&gt;&lt;strong&gt;TH\\u01af\\u01a0NG HI\\u1ec6U R\\u1ed8NG KH\\u1eaeP&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;B\\u1ea3n th\\u00e2n th\\u01b0\\u01a1ng hi\\u1ec7u Grass Roots l\\u00e0 nh\\u00e0 ph\\u00e2n ph\\u1ed1i \\u0111\\u1ed9c quy\\u1ec1n s\\u1ea3n ph\\u1ea9m d\\u01b0\\u1ee3c th\\u1ea9m m\\u1ef9 v\\u00e0 m\\u00e1y m\\u00f3c thi\\u1ebft b\\u1ecb cao c\\u1ea5p d\\u00f9ng trong ng\\u00e0nh th\\u1ea9m m\\u1ef9 t\\u1eeb c\\u00e1c th\\u01b0\\u01a1ng hi\\u1ec7u n\\u1ed5i ti\\u1ebfng t\\u1ea1i ch\\u00e2u \\u00c2u v\\u00e0 ch\\u00e2u M\\u1ef9 trong su\\u1ed1t h\\u01a1n 11 n\\u0103m t\\u1ea1i Vi\\u1ec7t Nam.&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;\\u00a0&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;&lt;strong&gt;&lt;span style=\\\\&quot;font-size:24px\\\\&quot;&gt;TH\\u1ea4U HI\\u1ec2U V\\u0102N H\\u00d3A \\u0110\\u1ecaA PH\\u01af\\u01a0NG&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;Grass Roots hi\\u1ec3u r\\u1eb1ng th\\u1ecb hi\\u1ebfu v\\u00e0 nhu c\\u1ea7u c\\u1ee7a th\\u1ecb tr\\u01b0\\u1eddng Vi\\u1ec7t Nam l\\u00e0 \\u0111i\\u1ec1u ti\\u00ean quy\\u1ebft \\u0111\\u1ec3 \\u0111\\u1ea7u t\\u01b0 th\\u00e0nh c\\u00f4ng. Grass Roots lu\\u00f4n n\\u1ed7 l\\u1ef1c \\u0111\\u1ec3 s\\u1ef1 xu\\u1ea5t hi\\u1ec7n c\\u1ee7a t\\u1eebng th\\u01b0\\u01a1ng hi\\u1ec7u l\\u00e0 m\\u1ed9t hi\\u1ec7n t\\u01b0\\u1ee3ng t\\u1ea1i \\u0111\\u00e2y, m\\u00e0 v\\u1eabn \\u0111\\u1ea3m b\\u1ea3o xu h\\u01b0\\u1edbng chung to\\u00e0n c\\u1ea7u.&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;\\u00a0&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;&lt;span style=\\\\&quot;font-size:24px\\\\&quot;&gt;&lt;strong&gt;C\\u01a0 H\\u1ed8I H\\u1ee2P T\\u00c1C&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;N\\u1ebfu b\\u1ea1n mong mu\\u1ed1n g\\u00f3p ph\\u1ea7n lan t\\u1ecfa s\\u1ee9c s\\u1ed1ng l\\u00e0m \\u0111\\u1eb9p, chia s\\u1ebb nh\\u1eefng ph\\u01b0\\u01a1ng ph\\u00e1p v\\u00e0 \\u1ee9ng d\\u1ee5ng hi\\u1ec7n \\u0111\\u1ea1i \\u0111\\u1ec3 Vi\\u1ec7t Nam tr\\u1edf th\\u00e0nh m\\u1ed9t \\u0111i\\u1ec3m \\u0111\\u1ebfn h\\u1ea5p d\\u1eabn tr\\u00ean b\\u1ea3n \\u0111\\u1ed3 th\\u1ea9m m\\u1ef9 qu\\u1ed1c t\\u1ebf, th\\u00ec Grass Roots \\u00a0ch\\u00ednh l\\u00e0 \\u0111\\u1ed1i t\\u00e1c ho\\u00e0n h\\u1ea3o c\\u1ee7a b\\u1ea1n.&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;\\u00a0&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;&lt;a class=\\\\&quot;simple-button-plugin\\\\&quot; href=\\\\&quot;\\/contact\\\\&quot; style=\\\\&quot;display: inline-block;b;background-color: transparent;border: 1px solid #861521;padding: 5px 20px;border-radius: 50px;font-size: 14px;cursor: pointer;color: #861521 !important;text-decoration: none !important;\\\\&quot; target=\\\\&quot;_blank\\\\&quot;&gt;Li\\u00ean h\\u1ec7&lt;\\/a&gt;&lt;\\/p&gt;\\\\n&quot;,&quot;content_1&quot;:&quot;&lt;p&gt;&lt;span style=\\\\&quot;font-size:24px\\\\&quot;&gt;&lt;strong&gt;TH\\u01af\\u01a0NG HI\\u1ec6U R\\u1ed8NG KH\\u1eaeP&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;B\\u1ea3n th\\u00e2n th\\u01b0\\u01a1ng hi\\u1ec7u Grass Roots l\\u00e0 nh\\u00e0 ph\\u00e2n ph\\u1ed1i \\u0111\\u1ed9c quy\\u1ec1n s\\u1ea3n ph\\u1ea9m d\\u01b0\\u1ee3c th\\u1ea9m m\\u1ef9 v\\u00e0 m\\u00e1y m\\u00f3c thi\\u1ebft b\\u1ecb cao c\\u1ea5p d\\u00f9ng trong ng\\u00e0nh th\\u1ea9m m\\u1ef9 t\\u1eeb c\\u00e1c th\\u01b0\\u01a1ng hi\\u1ec7u n\\u1ed5i ti\\u1ebfng t\\u1ea1i ch\\u00e2u \\u00c2u v\\u00e0 ch\\u00e2u M\\u1ef9 trong su\\u1ed1t h\\u01a1n 11 n\\u0103m t\\u1ea1i Vi\\u1ec7t Nam.&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;\\u00a0&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;&lt;strong&gt;&lt;span style=\\\\&quot;font-size:24px\\\\&quot;&gt;TH\\u1ea4U HI\\u1ec2U V\\u0102N H\\u00d3A \\u0110\\u1ecaA PH\\u01af\\u01a0NG&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;Grass Roots hi\\u1ec3u r\\u1eb1ng th\\u1ecb hi\\u1ebfu v\\u00e0 nhu c\\u1ea7u c\\u1ee7a th\\u1ecb tr\\u01b0\\u1eddng Vi\\u1ec7t Nam l\\u00e0 \\u0111i\\u1ec1u ti\\u00ean quy\\u1ebft \\u0111\\u1ec3 \\u0111\\u1ea7u t\\u01b0 th\\u00e0nh c\\u00f4ng. Grass Roots lu\\u00f4n n\\u1ed7 l\\u1ef1c \\u0111\\u1ec3 s\\u1ef1 xu\\u1ea5t hi\\u1ec7n c\\u1ee7a t\\u1eebng th\\u01b0\\u01a1ng hi\\u1ec7u l\\u00e0 m\\u1ed9t hi\\u1ec7n t\\u01b0\\u1ee3ng t\\u1ea1i \\u0111\\u00e2y, m\\u00e0 v\\u1eabn \\u0111\\u1ea3m b\\u1ea3o xu h\\u01b0\\u1edbng chung to\\u00e0n c\\u1ea7u.&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;\\u00a0&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;&lt;span style=\\\\&quot;font-size:24px\\\\&quot;&gt;&lt;strong&gt;C\\u01a0 H\\u1ed8I H\\u1ee2P T\\u00c1C&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;N\\u1ebfu b\\u1ea1n mong mu\\u1ed1n g\\u00f3p ph\\u1ea7n lan t\\u1ecfa s\\u1ee9c s\\u1ed1ng l\\u00e0m \\u0111\\u1eb9p, chia s\\u1ebb nh\\u1eefng ph\\u01b0\\u01a1ng ph\\u00e1p v\\u00e0 \\u1ee9ng d\\u1ee5ng hi\\u1ec7n \\u0111\\u1ea1i \\u0111\\u1ec3 Vi\\u1ec7t Nam tr\\u1edf th\\u00e0nh m\\u1ed9t \\u0111i\\u1ec3m \\u0111\\u1ebfn h\\u1ea5p d\\u1eabn tr\\u00ean b\\u1ea3n \\u0111\\u1ed3 th\\u1ea9m m\\u1ef9 qu\\u1ed1c t\\u1ebf, th\\u00ec Grass Roots \\u00a0ch\\u00ednh l\\u00e0 \\u0111\\u1ed1i t\\u00e1c ho\\u00e0n h\\u1ea3o c\\u1ee7a b\\u1ea1n.&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;\\u00a0&lt;\\/p&gt;\\\\n\\\\n&lt;p&gt;&lt;a class=\\\\&quot;simple-button-plugin\\\\&quot; href=\\\\&quot;\\/contact\\\\&quot; style=\\\\&quot;display: inline-block;b;background-color: transparent;border: 1px solid #861521;padding: 5px 20px;border-radius: 50px;font-size: 14px;cursor: pointer;color: #861521 !important;text-decoration: none !important;\\\\&quot; target=\\\\&quot;_blank\\\\&quot;&gt;Li\\u00ean h\\u1ec7&lt;\\/a&gt;&lt;\\/p&gt;\\\\n&quot;,&quot;yt_class&quot;:&quot;title-brand&quot;,&quot;css_internal&quot;:&quot;&quot;}],&quot;cchild&quot;:{}}\",\"moduleid\":\"339\"}');
INSERT INTO `wbc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(21, 'Mobile - Slide _ Home3', 'so_home_slider', '{\"name\":\"Mobile - Slide _ Home3\",\"module_description\":{\"1\":{\"head_name\":\"Slide\"},\"2\":{\"head_name\":\"Slide\"}},\"head_name\":\"Slide\",\"disp_title_module\":\"0\",\"status\":\"1\",\"class_suffix\":\"\",\"item_link_target\":\"_self\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"width\":\"480\",\"height\":\"520\",\"center\":\"0\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"1\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"0\",\"dots\":\"0\",\"navs\":\"0\",\"animateOut\":\"none\",\"animateIn\":\"none\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"image\":\"\",\"slide_link\":\"\",\"slide_status\":\"1\",\"slide_description\":{\"1\":{\"slide_title\":\"\",\"language_id\":\"1\",\"slide_caption\":\"\",\"slide_desciption\":\" \"},\"2\":{\"slide_title\":\"\",\"language_id\":\"2\",\"slide_caption\":\"\",\"slide_desciption\":\" \"}},\"moduleid\":\"21\"}'),
(22, 'Home 1 - Featured Categories', 'so_html_content', '{\"action\":\"\",\"name\":\"Home 1 - Featured Categories\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"no-margin\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;block-categories&quot;&gt;\\r\\n\\t&lt;h3 class=&quot;modtitle&quot;&gt;&lt;span&gt;Featured Categories&lt;\\/span&gt;&lt;\\/h3&gt;\\r\\n\\t&lt;div class=&quot;cate-content contentslider&quot; data-rtl=&quot;no&quot; data-autoplay=&quot;no&quot; data-autowidth=&quot;yes&quot; data-delay=&quot;4&quot; data-speed=&quot;0.6&quot; data-margin=&quot;10&quot; data-items_column1=&quot;1&quot; data-items_column2=&quot;1&quot; data-items_column3=&quot;2&quot; data-items_column4=&quot;2&quot; data-arrows=&quot;yes&quot; data-pagination=&quot;no&quot; data-lazyload=&quot;no&quot; data-loop=&quot;yes&quot; data-hoverpause=&quot;yes&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate1&quot;&gt;\\r\\n\\t\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate1.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Watch&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate2&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate2.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Bags&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate3&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate3.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Swimwear&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate4&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate4.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Shoes&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate5&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate5.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Fashion&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t&lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"},\"2\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;block-categories&quot;&gt;\\r\\n\\t&lt;h3 class=&quot;modtitle&quot;&gt;&lt;span&gt;Featured Categories&lt;\\/span&gt;&lt;\\/h3&gt;\\r\\n\\t&lt;div class=&quot;cate-content contentslider&quot; data-rtl=&quot;yes&quot; data-autoplay=&quot;no&quot; data-autowidth=&quot;yes&quot; data-delay=&quot;4&quot; data-speed=&quot;0.6&quot; data-margin=&quot;10&quot; data-items_column1=&quot;1&quot; data-items_column2=&quot;1&quot; data-items_column3=&quot;2&quot; data-items_column4=&quot;2&quot; data-arrows=&quot;yes&quot; data-pagination=&quot;no&quot; data-lazyload=&quot;no&quot; data-loop=&quot;yes&quot; data-hoverpause=&quot;yes&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate1&quot;&gt;\\r\\n\\t\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate1.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Watch&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate2&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate2.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Bags&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate3&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate3.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Swimwear&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate4&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate4.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Shoes&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate5&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate5.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;#&quot;&gt;Fashion&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t&lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"}},\"moduleid\":\"22\"}'),
(11, 'Mobile - Header Menu', 'so_html_content', '{\"action\":\"save_edit\",\"name\":\"Mobile - Header Menu\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;header-menu-page pull-left&quot;&gt;\\r\\n\\t&lt;div class=&quot;wrapper_menu&quot;&gt;\\r\\n\\t\\t&lt;ul id=&quot;menu-menu-mobile-1&quot; class=&quot;nav menu-mobile1 contentslider&quot; data-rtl=&quot;no&quot; data-autoplay=&quot;no&quot; data-autoheight=&quot;no&quot; data-autowidth=&quot;yes&quot; data-delay=&quot;4&quot; data-speed=&quot;0.6&quot; data-margin=&quot;10&quot; data-items_column3=&quot;4&quot; data-items_column4=&quot;4&quot; data-arrows=&quot;yes&quot; data-pagination=&quot;no&quot; data-lazyload=&quot;yes&quot; data-loop=&quot;no&quot; data-hoverpause=&quot;yes&quot;&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-new-arrivals&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;#&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;New Arrivals&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-promotions&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;#&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;Best Sellers&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-blog&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;index.php?route=simple_blog\\/category&amp;amp;simple_blog_category_id=5&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;Blog&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-about-us&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;index.php?route=information\\/information&amp;amp;information_id=4&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;About Us&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-contact-us&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;index.php?route=information\\/contact&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;Contact Us&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;\\/ul&gt;\\t\\t\\t\\t\\t\\t\\r\\n\\t&lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"},\"2\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;header-menu-page pull-left&quot;&gt;\\r\\n\\t&lt;div class=&quot;wrapper_menu&quot;&gt;\\r\\n\\t\\t&lt;ul id=&quot;menu-menu-mobile-1&quot; class=&quot;nav menu-mobile1 contentslider&quot; data-rtl=&quot;no&quot; data-autoplay=&quot;no&quot; data-autoheight=&quot;no&quot; data-autowidth=&quot;yes&quot; data-delay=&quot;4&quot; data-speed=&quot;0.6&quot; data-margin=&quot;10&quot; data-items_column3=&quot;4&quot; data-items_column4=&quot;4&quot; data-arrows=&quot;yes&quot; data-pagination=&quot;no&quot; data-lazyload=&quot;yes&quot; data-loop=&quot;no&quot; data-hoverpause=&quot;yes&quot;&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-new-arrivals&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;#&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;New Arrivals&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-promotions&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;#&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;Best Sellers&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-blog&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;index.php?route=simple_blog\\/category&amp;amp;simple_blog_category_id=5&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;Blog&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-about-us&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;index.php?route=information\\/information&amp;amp;information_id=4&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;About Us&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t\\t&lt;li class=&quot;menu-contact-us&quot;&gt;&lt;a class=&quot;item-link&quot; href=&quot;index.php?route=information\\/contact&quot;&gt;&lt;span class=&quot;menu-title&quot;&gt;Contact Us&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n\\t\\t&lt;\\/ul&gt;\\t\\t\\t\\t\\t\\t\\r\\n\\t&lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"}},\"moduleid\":\"11\"}'),
(12, 'Mobile - Slide - Home 1', 'so_home_slider', '{\"name\":\"Mobile - Slide - Home 1\",\"module_description\":{\"1\":{\"head_name\":\"Slidershow\"},\"2\":{\"head_name\":\"Slidershow\"}},\"head_name\":\"Slidershow\",\"disp_title_module\":\"0\",\"status\":\"1\",\"class_suffix\":\"\",\"item_link_target\":\"_self\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"width\":\"480\",\"height\":\"130\",\"center\":\"0\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"1\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"1\",\"dots\":\"1\",\"navs\":\"0\",\"animateOut\":\"fadeOut\",\"animateIn\":\"fadeIn\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"image\":\"\",\"slide_link\":\"\",\"slide_status\":\"1\",\"slide_description\":{\"1\":{\"slide_title\":\"\",\"language_id\":\"1\",\"slide_caption\":\"\",\"slide_desciption\":\" \"},\"2\":{\"slide_title\":\"\",\"language_id\":\"2\",\"slide_caption\":\"\",\"slide_desciption\":\" \"}},\"moduleid\":\"12\"}'),
(13, 'Mobile - Best Sellers', 'so_extra_slider', '{\"action\":\"save_edit\",\"name\":\"Mobile - Best Sellers\",\"module_description\":{\"1\":{\"head_name\":\"Best Sellers\"},\"2\":{\"head_name\":\"Best Sellers\"}},\"head_name\":\"Best Sellers\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"mobile_deals\",\"item_link_target\":\"_self\",\"button_page\":\"top\",\"products_style\":\"style1\",\"nb_column0\":\"4\",\"nb_column1\":\"4\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"nb_row\":\"1\",\"type_data\":\"category\",\"product_feature\":\"\",\"category\":[\"33\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"limitation\":\"6\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_readmore_link\":\"0\",\"readmore_text\":\"Readmore\",\"display_add_to_cart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"160\",\"height\":\"160\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"10\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"effect\":\"none\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"loop\":\"1\",\"navs\":\"1\",\"navSpeed\":\"500\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"13\"}'),
(14, 'Mobile - Top Deals', 'so_deals', '{\"action\":\"\",\"name\":\"Mobile - Top Deals\",\"module_description\":{\"1\":{\"head_name\":\"Top Deals\"},\"2\":{\"head_name\":\"Top Deals\"}},\"head_name\":\"Top Deals\",\"disp_title_module\":\"1\",\"status\":\"1\",\"class_suffix\":\"mobile_deals \",\"item_link_target\":\"_self\",\"nb_column0\":\"4\",\"nb_column1\":\"4\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"nb_row\":\"1\",\"category\":[\"25\",\"33\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"6\",\"display_feature\":\"0\",\"product_feature\":\"\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_countdown\":\"1\",\"display_price\":\"1\",\"display_addtocart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"227\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"160\",\"height\":\"160\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"10\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"1\",\"button_page\":\"top\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"navs\":\"1\",\"navSpeed\":\"500\",\"effect\":\"none\",\"duration\":\"800\",\"delay\":\"500\",\"store_layout\":\"default\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"14\"}'),
(15, 'Mobile - Categories Featured', 'so_html_content', '{\"action\":\"save_edit\",\"name\":\"Mobile - Categories Featured\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"no-margin\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"module_description\":{\"1\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;block-categories&quot;&gt;\\r\\n\\t&lt;h3 class=&quot;modtitle&quot;&gt;&lt;span&gt;Featured Categories&lt;\\/span&gt;&lt;\\/h3&gt;\\r\\n\\t&lt;div class=&quot;cate-content&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate1&quot;&gt;\\r\\n\\t\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate1.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Watch&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate2&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate2.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Bags&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate3&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate3.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Swimwear&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate4&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate4.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Shoes&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate5&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate5.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Fashion&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t&lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"},\"2\":{\"title\":\"\",\"description\":\"&lt;div class=&quot;block-categories&quot;&gt;\\r\\n\\t&lt;h3 class=&quot;modtitle&quot;&gt;&lt;span&gt;Featured Categories&lt;\\/span&gt;&lt;\\/h3&gt;\\r\\n\\t&lt;div class=&quot;cate-content&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate1&quot;&gt;\\r\\n\\t\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate1.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Watch&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate2&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate2.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Bags&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate3&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate3.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Swimwear&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate4&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate4.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Shoes&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t\\t&lt;div class=&quot;cate cate5&quot;&gt;\\r\\n\\t\\t&lt;div class=&quot;inner&quot;&gt;&lt;img src=&quot;image\\/catalog\\/demo\\/banners\\/home1\\/cate5.jpg&quot; alt=&quot;Static Image&quot;&gt;&lt;a href=&quot;index.php?route=mobile\\/home&quot;&gt;Fashion&lt;\\/a&gt;&lt;\\/div&gt;\\r\\n\\t\\t&lt;\\/div&gt;\\r\\n\\t&lt;\\/div&gt;\\r\\n&lt;\\/div&gt;\"}},\"moduleid\":\"15\"}'),
(18, 'Mobile -  Slide - Home 2', 'so_home_slider', '{\"name\":\"Mobile -  Slide - Home 2\",\"module_description\":{\"1\":{\"head_name\":\"Slide\"},\"2\":{\"head_name\":\"Slide\"}},\"head_name\":\"Slide\",\"disp_title_module\":\"0\",\"status\":\"1\",\"class_suffix\":\"\",\"item_link_target\":\"_self\",\"nb_column0\":\"1\",\"nb_column1\":\"1\",\"nb_column2\":\"1\",\"nb_column3\":\"1\",\"nb_column4\":\"1\",\"width\":\"480\",\"height\":\"160\",\"center\":\"0\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"1\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"loop\":\"0\",\"dots\":\"1\",\"navs\":\"0\",\"animateOut\":\"bounceOut\",\"animateIn\":\"bounceIn\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"image\":\"\",\"slide_link\":\"\",\"slide_status\":\"1\",\"slide_description\":{\"1\":{\"slide_title\":\"\",\"language_id\":\"1\",\"slide_caption\":\"\",\"slide_desciption\":\" \"},\"2\":{\"slide_title\":\"\",\"language_id\":\"2\",\"slide_caption\":\"\",\"slide_desciption\":\" \"}},\"moduleid\":\"18\"}'),
(19, 'Mobile - Bestseller', 'so_listing_tabs', '{\"action\":\"save_edit\",\"name\":\"Mobile - Bestseller\",\"module_description\":{\"1\":{\"head_name\":\"Bestseller\"},\"2\":{\"head_name\":\"Bestseller\"}},\"head_name\":\"Bestseller\",\"disp_title_module\":\"0\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"mobile_listing\",\"item_link_target\":\"_self\",\"nb_column0\":\"4\",\"nb_column1\":\"4\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"2\",\"type_show\":\"slider\",\"nb_row\":\"1\",\"type_source\":\"1\",\"category\":[\"33\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"source_limit\":\"5\",\"catid_preload\":\"*\",\"field_product_tab\":[\"p_date_added\",\"sell\"],\"field_preload\":\"sell\",\"tab_all_display\":\"1\",\"tab_max_characters\":\"25\",\"tab_icon_display\":\"1\",\"cat_order_by\":\"name\",\"imgcfgcat_width\":\"30\",\"imgcfgcat_height\":\"30\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_add_to_cart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"7\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"160\",\"height\":\"160\",\"product_placeholder_path\":\"nophoto.png\",\"display_banner_image\":\"0\",\"banner_image\":\"no_image.png\",\"banner_width\":\"150\",\"banner_height\":\"250\",\"banner_image_url\":\"\",\"effect\":\"none\",\"margin\":\"10\",\"duration\":\"800\",\"delay\":\"500\",\"autoplay\":\"0\",\"display_nav\":\"1\",\"display_loop\":\"1\",\"touchdrag\":\"1\",\"mousedrag\":\"1\",\"pausehover\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplaySpeed\":\"1000\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"19\"}'),
(23, 'Mobile - New Arrivals', 'so_extra_slider', '{\"action\":\"\",\"name\":\"Mobile - New Arrivals\",\"module_description\":{\"1\":{\"head_name\":\"New Arrivals\"},\"2\":{\"head_name\":\"New Arrivals\"}},\"head_name\":\"New Arrivals\",\"disp_title_module\":\"1\",\"status\":\"1\",\"type_layout\":\"0\",\"class_suffix\":\"mobile_deals\",\"item_link_target\":\"_self\",\"button_page\":\"top\",\"products_style\":\"style1\",\"nb_column0\":\"4\",\"nb_column1\":\"4\",\"nb_column2\":\"3\",\"nb_column3\":\"2\",\"nb_column4\":\"1\",\"nb_row\":\"1\",\"type_data\":\"category\",\"product_feature\":\"\",\"category\":[\"25\",\"79\"],\"child_category\":\"1\",\"category_depth\":\"1\",\"product_sort\":\"p.price\",\"product_ordering\":\"ASC\",\"limitation\":\"6\",\"display_title\":\"1\",\"title_maxlength\":\"50\",\"display_description\":\"0\",\"description_maxlength\":\"100\",\"display_price\":\"1\",\"display_readmore_link\":\"0\",\"readmore_text\":\"Readmore\",\"display_add_to_cart\":\"0\",\"display_wishlist\":\"0\",\"display_compare\":\"0\",\"display_rating\":\"0\",\"display_sale\":\"1\",\"display_new\":\"1\",\"date_day\":\"7\",\"product_image_num\":\"1\",\"product_image\":\"1\",\"product_get_image_data\":\"1\",\"product_get_image_image\":\"1\",\"width\":\"160\",\"height\":\"160\",\"placeholder_path\":\"nophoto.png\",\"margin\":\"10\",\"slideBy\":\"1\",\"autoplay\":\"0\",\"autoplayTimeout\":\"5000\",\"autoplayHoverPause\":\"0\",\"autoplaySpeed\":\"1000\",\"startPosition\":\"0\",\"mouseDrag\":\"1\",\"touchDrag\":\"1\",\"effect\":\"none\",\"dots\":\"0\",\"dotsSpeed\":\"500\",\"loop\":\"1\",\"navs\":\"1\",\"navSpeed\":\"500\",\"duration\":\"800\",\"delay\":\"500\",\"pre_text\":\"\",\"post_text\":\"\",\"use_cache\":\"0\",\"cache_time\":\"3600\",\"moduleid\":\"23\"}'),
(341, 'Form tư vấn', 'pageform', '{\"name\":\"Form t\\u01b0 v\\u1ea5n\",\"page_form_id\":\"1\",\"status\":\"1\"}'),
(342, 'Form Tuyển dụng', 'pageform', '{\"name\":\"Form Tuy\\u1ec3n d\\u1ee5ng\",\"page_form_id\":\"2\",\"status\":\"1\"}'),
(343, 'Đăng ký Điều trị', 'pageform', '{\"name\":\"\\u0110\\u0103ng k\\u00fd \\u0110i\\u1ec1u tr\\u1ecb\",\"page_form_id\":\"3\",\"status\":\"1\"}'),
(344, 'Tin tức mới nhất', 'blog_latest', '{\"name\":\"Tin t\\u1ee9c m\\u1edbi nh\\u1ea5t\",\"limit\":\"5\",\"columns\":\"1 list\",\"carousel\":\"0\",\"characters\":\"0\",\"thumb\":\"1\",\"width\":\"400\",\"height\":\"200\",\"status\":\"1\"}');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_option`
--

CREATE TABLE `wbc_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_option`
--

INSERT INTO `wbc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_option_description`
--

CREATE TABLE `wbc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_option_description`
--

INSERT INTO `wbc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size'),
(1, 2, 'Radio'),
(2, 2, 'Điều trị '),
(4, 2, 'Text'),
(6, 2, 'Textarea'),
(8, 2, 'Date'),
(7, 2, 'File'),
(5, 2, 'Select'),
(9, 2, 'Time'),
(10, 2, 'Date &amp; Time'),
(12, 2, 'Delivery Date'),
(11, 2, 'Size'),
(2, 1, 'Điều trị ');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_option_value`
--

CREATE TABLE `wbc_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_option_value`
--

INSERT INTO `wbc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(24, 2, '', 2),
(23, 2, '', 1),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_option_value_description`
--

CREATE TABLE `wbc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_option_value_description`
--

INSERT INTO `wbc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(24, 1, 2, 'Điều trị  2'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(24, 2, 2, 'Điều trị  2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(43, 2, 1, 'Large'),
(32, 2, 1, 'Small'),
(23, 1, 2, 'Điều trị 1'),
(31, 2, 1, 'Medium'),
(42, 2, 5, 'Yellow'),
(41, 2, 5, 'Green'),
(39, 2, 5, 'Red'),
(40, 2, 5, 'Blue'),
(23, 2, 2, 'Điều trị 1'),
(48, 2, 11, 'Large'),
(47, 2, 11, 'Medium'),
(46, 2, 11, 'Small'),
(44, 2, 2, 'Điều trị  3'),
(44, 1, 2, 'Điều trị  3'),
(45, 2, 2, 'Điều trị  4'),
(45, 1, 2, 'Điều trị  4');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_order`
--

CREATE TABLE `wbc_order` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_order_custom_field`
--

CREATE TABLE `wbc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_order_history`
--

CREATE TABLE `wbc_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_order_option`
--

CREATE TABLE `wbc_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_order_product`
--

CREATE TABLE `wbc_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_order_recurring`
--

CREATE TABLE `wbc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_order_recurring_transaction`
--

CREATE TABLE `wbc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_order_status`
--

CREATE TABLE `wbc_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_order_status`
--

INSERT INTO `wbc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(1, 1, 'Pending'),
(16, 1, 'Voided'),
(15, 1, 'Processed'),
(14, 1, 'Expired'),
(2, 2, 'Processing'),
(3, 2, 'Shipped'),
(7, 2, 'Canceled'),
(5, 2, 'Complete'),
(8, 2, 'Denied'),
(9, 2, 'Canceled Reversal'),
(10, 2, 'Failed'),
(11, 2, 'Refunded'),
(12, 2, 'Reversed'),
(13, 2, 'Chargeback'),
(1, 2, 'Pending'),
(16, 2, 'Voided'),
(15, 2, 'Processed'),
(14, 2, 'Expired');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_order_total`
--

CREATE TABLE `wbc_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_order_voucher`
--

CREATE TABLE `wbc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_page_form`
--

CREATE TABLE `wbc_page_form` (
  `page_form_id` int(11) NOT NULL,
  `show_guest` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `customer_email_status` tinyint(4) NOT NULL,
  `admin_email_status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `top` tinyint(4) NOT NULL,
  `bottom` tinyint(4) NOT NULL,
  `captcha` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_page_form`
--

INSERT INTO `wbc_page_form` (`page_form_id`, `show_guest`, `status`, `customer_email_status`, `admin_email_status`, `sort_order`, `top`, `bottom`, `captcha`) VALUES
(1, 1, 1, 0, 1, 0, 0, 0, 0),
(2, 1, 1, 0, 0, 0, 0, 0, 0),
(3, 1, 1, 0, 1, 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_page_form_customer_group`
--

CREATE TABLE `wbc_page_form_customer_group` (
  `page_form_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_page_form_customer_group`
--

INSERT INTO `wbc_page_form_customer_group` (`page_form_id`, `customer_group_id`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_page_form_description`
--

CREATE TABLE `wbc_page_form_description` (
  `page_form_id` int(11) NOT NULL,
  `admin_subject` varchar(255) NOT NULL,
  `admin_message` text NOT NULL,
  `customer_subject` varchar(255) NOT NULL,
  `customer_message` text NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `success_title` varchar(255) NOT NULL,
  `success_description` text NOT NULL,
  `fieldset_title` varchar(255) NOT NULL,
  `submit_button` varchar(255) NOT NULL,
  `guest_error` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_page_form_description`
--

INSERT INTO `wbc_page_form_description` (`page_form_id`, `admin_subject`, `admin_message`, `customer_subject`, `customer_message`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`, `success_title`, `success_description`, `fieldset_title`, `submit_button`, `guest_error`) VALUES
(2, '', '', '', '', 2, 'TUYỂN DỤNG', '', 'TUYỂN DỤNG', '', '', 'Tuyển dụng', '', '', 'Đăng ký', ''),
(2, '', '', '', '', 1, 'TUYỂN DỤNG', '', 'TUYỂN DỤNG', '', '', 'Tuyển dụng', '', '', 'Submit', ''),
(1, 'Yêu cầu tư vấn', '&lt;p&gt;{STORE_NAME}&lt;/p&gt;\r\n\r\n&lt;p&gt;{INFORMATION}&lt;/p&gt;\r\n', '', '', 2, 'BẠN CẦN TƯ VẤN?', '', 'BẠN CẦN TƯ VẤN?', '', '', 'BẠN CẦN TƯ VẤN?', '', '', '', ''),
(1, 'Yêu cầu tư vấn', '&lt;p&gt;{STORE_NAME}&lt;/p&gt;\r\n\r\n&lt;p&gt;{INFORMATION}&lt;/p&gt;\r\n', '', '', 1, 'BẠN CẦN TƯ VẤN?', '', 'BẠN CẦN TƯ VẤN?', '', '', 'BẠN CẦN TƯ VẤN?', '', '', '', ''),
(3, 'Đăng ký để nhận thêm thông tin từ GrassRoots', '&lt;table&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;{INFORMATION}&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', '', '', 2, 'Đăng ký để nhận thêm thông tin từ GrassRoots', '&lt;p&gt;Điền vào biểu mẫu này để nhận bản tin và thông tin định kỳ từ GrassRoots quảng bá sản phẩm và dịch vụ của chúng tôi.&lt;/p&gt;\r\n', 'Đăng ký để nhận thêm thông tin từ GrassRoots', '', '', 'Đăng ký để nhận thêm thông tin từ GrassRoots', '', '', '', ''),
(3, 'Đăng ký để nhận thêm thông tin từ GrassRoots', '&lt;table&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td&gt;{INFORMATION}&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n', '', '', 1, 'Đăng ký để nhận thêm thông tin từ GrassRoots', '&lt;p&gt;Điền vào biểu mẫu này để nhận bản tin và thông tin định kỳ từ GrassRoots quảng bá sản phẩm và dịch vụ của chúng tôi.&lt;/p&gt;\r\n', 'Đăng ký để nhận thêm thông tin từ GrassRoots', '', '', 'Đăng ký để nhận thêm thông tin từ GrassRoots', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_page_form_option`
--

CREATE TABLE `wbc_page_form_option` (
  `page_form_option_id` int(11) NOT NULL,
  `page_form_id` int(11) NOT NULL,
  `required` tinyint(4) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_page_form_option`
--

INSERT INTO `wbc_page_form_option` (`page_form_option_id`, `page_form_id`, `required`, `type`, `status`, `sort_order`) VALUES
(1, 1, 1, 'text', 1, 1),
(2, 2, 1, 'text', 1, 1),
(3, 2, 1, 'telephone', 1, 2),
(7, 2, 1, 'text', 1, 3),
(8, 2, 1, 'email', 1, 4),
(10, 2, 1, 'select', 1, 5),
(11, 2, 1, 'textarea', 1, 6),
(12, 1, 1, 'text', 1, 2),
(13, 1, 1, 'email', 1, 3),
(14, 1, 1, 'telephone', 1, 4),
(15, 1, 1, 'text', 1, 5),
(16, 1, 1, 'textarea', 1, 6),
(17, 3, 1, 'text', 1, 1),
(18, 3, 1, 'email', 1, 2),
(19, 3, 0, 'text', 1, 3),
(20, 3, 1, 'text', 1, 4),
(21, 3, 1, 'country', 1, 5),
(22, 3, 1, 'zone', 1, 6),
(23, 3, 1, 'telephone', 1, 7),
(24, 3, 1, 'select', 1, 8),
(25, 3, 1, 'text', 1, 9),
(26, 3, 1, 'text', 1, 10),
(27, 3, 1, 'textarea', 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_page_form_option_description`
--

CREATE TABLE `wbc_page_form_option_description` (
  `page_form_id` int(11) NOT NULL,
  `page_form_option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `field_value` varchar(255) NOT NULL,
  `field_error` varchar(255) NOT NULL,
  `field_placeholder` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_page_form_option_description`
--

INSERT INTO `wbc_page_form_option_description` (`page_form_id`, `page_form_option_id`, `language_id`, `field_name`, `field_value`, `field_error`, `field_placeholder`) VALUES
(2, 2, 2, 'Họ và tên', '', 'Vui lòng nhập họ và tên', 'Họ và tên'),
(2, 2, 1, 'Full name', '', 'Please enter Full name', 'Full name'),
(2, 3, 2, 'Số điện thoại', '', 'Vui lòng nhập đúng số điên thoại', 'Số điện thoại'),
(2, 3, 1, 'Telephone', '', '', ''),
(2, 7, 2, 'Địa chỉ', '', '', 'Địa chỉ'),
(2, 7, 1, 'Address', '', '', 'Address'),
(2, 8, 2, 'Email ', '', '', 'Email '),
(2, 8, 1, 'Email ', '', '', 'Email '),
(2, 10, 2, 'Vị trí', '', '', ''),
(2, 10, 1, 'Vị trí', '', '', ''),
(2, 11, 2, 'Nội dung', '', '', 'Nội dung'),
(2, 11, 1, 'Nội dung', '', '', 'Nội dung'),
(1, 1, 2, 'Họ tên', '', '', 'Họ tên'),
(1, 1, 1, 'Full name', '', '', 'Full name'),
(1, 12, 2, 'Địa chỉ', '', '', 'Địa chỉ'),
(1, 12, 1, 'Địa chỉ', '', '', ''),
(1, 13, 2, 'Email ', '', '', ''),
(1, 13, 1, 'Email ', '', '', ''),
(1, 14, 2, 'Điện thoại', '', '', ''),
(1, 14, 1, 'Điện thoại', '', '', ''),
(1, 15, 2, 'Tiêu đề', '', '', ''),
(1, 15, 1, 'Tiêu đề', '', '', ''),
(1, 16, 2, 'Nội dung', '', '', ''),
(1, 16, 1, 'Nội dung', '', '', ''),
(3, 17, 2, 'Tên của bạn', '', '', ''),
(3, 17, 1, 'Tên của bạn', '', '', ''),
(3, 18, 2, 'Email của bạn', '', '', 'Email của bạn'),
(3, 18, 1, 'Email của bạn', '', '', 'Email của bạn'),
(3, 19, 2, 'Tên thực hành', '', '', 'Tên thực hành'),
(3, 19, 1, 'Tên thực hành', '', '', ''),
(3, 20, 2, 'Địa chỉ nhà', '', '', 'Địa chỉ nhà'),
(3, 20, 1, 'Địa chỉ nhà', '', '', 'Địa chỉ nhà'),
(3, 21, 2, 'Thành phố', '', '', 'Thành phố'),
(3, 21, 1, 'Thành phố', '', '', 'Thành phố'),
(3, 22, 2, 'Quận huyện', '', '', ''),
(3, 22, 1, 'Quận huyện', '', '', ''),
(3, 23, 2, 'Số điện thoại', '', '', 'Số điện thoại'),
(3, 23, 1, 'Số điện thoại', '', '', 'Số điện thoại'),
(3, 24, 2, 'Chuyên ngành', '', '', 'Chuyên ngành'),
(3, 24, 1, 'Chuyên ngành', '', '', 'Chuyên ngành'),
(3, 25, 2, 'Sở thích sản phẩm', '', '', 'Sở thích sản phẩm'),
(3, 25, 1, 'Sở thích sản phẩm', '', '', 'Sở thích sản phẩm'),
(3, 26, 2, 'Quyền lợi điều trị', '', '', 'Quyền lợi điều trị'),
(3, 26, 1, 'Quyền lợi điều trị', '', '', 'Quyền lợi điều trị'),
(3, 27, 2, 'Bình luận', '', '', 'Bình luận'),
(3, 27, 1, 'Bình luận', '', '', 'Bình luận');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_page_form_option_value`
--

CREATE TABLE `wbc_page_form_option_value` (
  `page_form_option_value_id` int(11) NOT NULL,
  `page_form_option_id` int(11) NOT NULL,
  `page_form_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_page_form_option_value`
--

INSERT INTO `wbc_page_form_option_value` (`page_form_option_value_id`, `page_form_option_id`, `page_form_id`, `sort_order`) VALUES
(5, 10, 2, 0),
(6, 10, 2, 0),
(7, 24, 3, 1),
(8, 24, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_page_form_option_value_description`
--

CREATE TABLE `wbc_page_form_option_value_description` (
  `page_form_option_value_id` int(11) NOT NULL,
  `page_form_option_id` int(11) NOT NULL,
  `page_form_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_page_form_option_value_description`
--

INSERT INTO `wbc_page_form_option_value_description` (`page_form_option_value_id`, `page_form_option_id`, `page_form_id`, `language_id`, `name`) VALUES
(7, 24, 3, 2, 'Chuyên ngành 1'),
(5, 10, 2, 1, 'Vị trí 1'),
(5, 10, 2, 2, 'Vị trí 1'),
(6, 10, 2, 2, 'Vị trí 2'),
(6, 10, 2, 1, 'Vị trí 2'),
(7, 24, 3, 1, 'Chuyên ngành 1'),
(8, 24, 3, 2, 'Chuyên ngành 2'),
(8, 24, 3, 1, 'Chuyên ngành 2');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_page_form_store`
--

CREATE TABLE `wbc_page_form_store` (
  `page_form_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_page_form_store`
--

INSERT INTO `wbc_page_form_store` (`page_form_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_page_request`
--

CREATE TABLE `wbc_page_request` (
  `page_request_id` int(11) NOT NULL,
  `page_form_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `page_form_title` varchar(255) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_page_request`
--

INSERT INTO `wbc_page_request` (`page_request_id`, `page_form_id`, `customer_id`, `firstname`, `lastname`, `customer_group_id`, `store_id`, `language_id`, `user_agent`, `page_form_title`, `ip`, `date_added`) VALUES
(1, 2, 0, 'Guest', '', 0, 0, 2, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', 'TUYỂN DỤNG', '::1', '2017-06-02 13:35:05'),
(2, 1, 0, 'Guest', '', 0, 0, 2, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', 'BẠN CẦN TƯ VẤN?', '::1', '2017-06-02 14:15:54');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_page_request_option`
--

CREATE TABLE `wbc_page_request_option` (
  `page_request_option_id` int(11) NOT NULL,
  `page_request_id` int(11) NOT NULL,
  `page_form_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_page_request_option`
--

INSERT INTO `wbc_page_request_option` (`page_request_option_id`, `page_request_id`, `page_form_id`, `name`, `value`, `type`) VALUES
(1, 1, 2, 'Họ và tên', 'đasadsad', 'text'),
(2, 1, 2, 'Số điện thoại', 'dsadsadsadsa', 'telephone'),
(3, 2, 1, 'Họ tên', 'Họ tên Họ tên', 'text'),
(4, 2, 1, 'Địa chỉ', 'Địa chỉ Địa chỉ', 'text'),
(5, 2, 1, 'Email ', 'dsdas@email.com', 'email'),
(6, 2, 1, 'Điện thoại', 'Điện thoại', 'telephone'),
(7, 2, 1, 'Tiêu đề', 'Tiêu đề', 'text'),
(8, 2, 1, 'Nội dung', 'Nội dung', 'textarea');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_product`
--

CREATE TABLE `wbc_product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(25) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `meta_robots` varchar(40) NOT NULL,
  `mfilter_tags` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_product`
--

INSERT INTO `wbc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`, `meta_robots`, `mfilter_tags`) VALUES
(28, 'Product 1', '', '', '', '', '', '', '', 939, 7, 'catalog/demo/htc_touch_hd_1.jpg', 5, 1, '100.0000', 200, 9, '2009-02-03', '146.40000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 16:06:50', '2011-09-30 01:05:39', '', ''),
(29, 'Product 2', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/palm_treo_pro_1.jpg', 6, 1, '279.9900', 0, 9, '2009-02-03', '133.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 16:42:17', '2011-09-30 01:06:08', '', ''),
(30, 'Product 3', '', '', '', '', '', '', '', 7, 6, 'catalog/demo/canon_eos_5d_1.jpg', 9, 1, '100.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 45, '2009-02-03 16:59:00', '2017-06-01 16:04:35', '', ''),
(31, 'Product 4', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/nikon_d300_1.jpg', 0, 1, '80.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 17:00:10', '2011-09-30 01:06:00', '', ''),
(32, 'Product 5', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/ipod_touch_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 17:07:26', '2011-09-30 01:07:22', '', ''),
(33, 'Product 6', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/samsung_syncmaster_941bw.jpg', 0, 1, '200.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 17:08:31', '2011-09-30 01:06:29', '', ''),
(34, 'Product 7', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/ipod_shuffle_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 1, '2009-02-03 18:07:54', '2011-09-30 01:07:17', '', ''),
(35, 'Product 8', '', '', '', '', '', '', '', 1000, 5, '', 0, 0, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 18:08:31', '2011-09-30 01:06:17', '', ''),
(36, 'Product 9', '', '', '', '', '', '', '', 994, 6, 'catalog/demo/ipod_nano_1.jpg', 8, 0, '100.0000', 100, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:09:19', '2011-09-30 01:07:12', '', ''),
(40, 'product 11', '', '', '', '', '', '', '', 970, 5, 'catalog/demo/iphone_1.jpg', 8, 1, '101.0000', 0, 9, '2009-02-03', '10.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 21:07:12', '2011-09-30 01:06:53', '', ''),
(41, 'Product 14', '', '', '', '', '', '', '', 977, 5, 'catalog/demo/imac_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 1, '2009-02-03 21:07:26', '2011-09-30 01:06:44', '', ''),
(43, 'Product 16', '', '', '', '', '', '', '', 929, 5, 'catalog/demo/macbook_1.jpg', 8, 0, '500.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:07:49', '2011-09-30 01:05:46', '', ''),
(44, 'Product 17', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/macbook_air_1.jpg', 8, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:00', '2011-09-30 01:05:53', '', ''),
(45, 'Product 18', '', '', '', '', '', '', '', 998, 5, 'catalog/demo/macbook_pro_1.jpg', 8, 1, '2000.0000', 0, 100, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:17', '2011-09-15 22:22:01', '', ''),
(46, 'Product 19', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/sony_vaio_1.jpg', 10, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:29', '2011-09-30 01:06:39', '', ''),
(47, 'Product 21', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/hp_1.jpg', 7, 1, '100.0000', 400, 9, '2009-02-03', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 0, 1, 2, '2009-02-03 21:08:40', '2011-09-30 01:05:28', '', ''),
(48, 'product 20', 'test 1', '', '', '', '', '', 'test 2', 995, 5, 'catalog/demo/ipod_classic_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-08', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-08 17:21:51', '2011-09-30 01:07:06', '', ''),
(49, 'SAM1', '', '', '', '', '', '', '', 0, 8, 'catalog/demo/samsung_tab_1.jpg', 0, 1, '199.9900', 0, 9, '2011-04-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2011-04-26 08:57:34', '2011-09-30 01:06:23', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_product_attribute`
--

CREATE TABLE `wbc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_product_attribute`
--

INSERT INTO `wbc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(43, 2, 1, '1'),
(47, 4, 1, '16GB'),
(43, 4, 1, '8gb'),
(47, 2, 1, '4'),
(43, 2, 2, '1'),
(47, 4, 2, '16GB'),
(43, 4, 2, '8gb'),
(47, 2, 2, '4');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_product_description`
--

CREATE TABLE `wbc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `fimage` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `video1` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `html_product_shortdesc` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `html_product_right` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `html_product_tab` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tab_title` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_keyword` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  `seo_h2` varchar(255) NOT NULL,
  `seo_h3` varchar(255) NOT NULL,
  `image_title` varchar(255) NOT NULL,
  `image_alt` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_product_description`
--

INSERT INTO `wbc_product_description` (`product_id`, `language_id`, `name`, `fimage`, `video1`, `html_product_shortdesc`, `html_product_right`, `html_product_tab`, `tab_title`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `seo_keyword`, `seo_h1`, `seo_h2`, `seo_h3`, `image_title`, `image_alt`) VALUES
(35, 1, 'Product 8', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', '', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'product-8', '', '', '', '', ''),
(48, 1, 'iPod Classic', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', '', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'ipod-classic', '', '', '', '', ''),
(40, 1, 'iPhone', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', '', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'iphone', '', '', '', '', ''),
(28, 1, 'HTC Touch HD', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', '', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'htc-touch-hd', '', '', '', '', ''),
(44, 1, 'MacBook Air', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', '', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'macbook-air', '', '', '', '', ''),
(45, 1, 'MacBook Pro', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', '', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'macbook-pro', '', '', '', '', ''),
(29, 1, 'Palm Treo Pro', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', '', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'palm-treo-pro', '', '', '', '', ''),
(36, 1, 'iPod Nano', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', '', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'ipod-nano', '', '', '', '', ''),
(46, 1, 'Sony VAIO', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', '', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'sony-vaio', '', '', '', '', ''),
(47, 1, 'HP LP3065', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', '', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'hp-lp3065', '', '', '', '', ''),
(32, 1, 'iPod Touch', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', '', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'ipod-touch', '', '', '', '', ''),
(41, 1, 'iMac', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', '', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'imac', '', '', '', '', ''),
(33, 1, 'Samsung SyncMaster 941BW', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', '', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'samsung-syncmaster-941bw', '', '', '', '', ''),
(34, 1, 'iPod Shuffle', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', '', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'ipod-shuffle', '', '', '', '', ''),
(43, 1, 'MacBook', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', '', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'macbook', '', '', '', '', ''),
(31, 1, 'Nikon D300', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', '', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'nikon-d300', '', '', '', '', ''),
(49, 1, 'Samsung Galaxy Tab 10.1', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', '', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'samsung-galaxy-tab-10-1', '', '', '', '', '');
INSERT INTO `wbc_product_description` (`product_id`, `language_id`, `name`, `fimage`, `video1`, `html_product_shortdesc`, `html_product_right`, `html_product_tab`, `tab_title`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `seo_keyword`, `seo_h1`, `seo_h2`, `seo_h3`, `image_title`, `image_alt`) VALUES
(35, 2, 'Product 8', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'product-8', '', '', '', '', ''),
(48, 2, 'iPod Classic', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'ipod-classic', '', '', '', '', ''),
(40, 2, 'iPhone', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'iphone', '', '', '', '', ''),
(28, 2, 'HTC Touch HD', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'htc-touch-hd', '', '', '', '', ''),
(44, 2, 'MacBook Air', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'macbook-air', '', '', '', '', ''),
(45, 2, 'MacBook Pro', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'macbook-pro', '', '', '', '', ''),
(29, 2, 'Palm Treo Pro', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'palm-treo-pro', '', '', '', '', ''),
(36, 2, 'iPod Nano', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'ipod-nano', '', '', '', '', ''),
(46, 2, 'Sony VAIO', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'sony-vaio', '', '', '', '', ''),
(47, 2, 'HP LP3065', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'hp-lp3065', '', '', '', '', ''),
(32, 2, 'iPod Touch', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'ipod-touch', '', '', '', '', ''),
(41, 2, 'iMac', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'imac', '', '', '', '', ''),
(33, 2, 'Samsung SyncMaster 941BW', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'samsung-syncmaster-941bw', '', '', '', '', ''),
(34, 2, 'iPod Shuffle', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'ipod-shuffle', '', '', '', '', ''),
(43, 2, 'MacBook', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'macbook', '', '', '', '', ''),
(31, 2, 'Nikon D300', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'nikon-d300', '', '', '', '', ''),
(49, 2, 'Samsung Galaxy Tab 10.1', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'samsung-galaxy-tab-10-1', '', '', '', '', '');
INSERT INTO `wbc_product_description` (`product_id`, `language_id`, `name`, `fimage`, `video1`, `html_product_shortdesc`, `html_product_right`, `html_product_tab`, `tab_title`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `seo_keyword`, `seo_h1`, `seo_h2`, `seo_h3`, `image_title`, `image_alt`) VALUES
(30, 1, 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'thâm quầng  mụn trứng cá  giải pháp cụ thể, product 3, tiêm trẻ hóa', 'thâm-quầng-mụn-trứng-cá-giải-pháp-cụ-thể', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ'),
(30, 2, 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ', '', '', '', '', '', '', '&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;R[II] EYES - RHA™ NÂNG CAO ĐƯỜNG VIỀN MẮT &lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;THÂM QUẦNG - MỤN TRỨNG CÁ GIẢI PHÁP CỤ THỂ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;PHÙ HỢP VỚI DA NHẠY CẢM&lt;/p&gt;\r\n\r\n&lt;p&gt;R II II EYES kết hợp phức hợp chống lão hóa TEOXANE (Công nghệ RHA ™, Dermo-Restructuring Complex và NovHyal) với các thành phần hoạt chất được công nhận để cung cấp một chuyên gia chống mệt mỏi và chống lão hóa giải pháp, phát triển đặc biệt cho vùng mắt đường viền.&lt;/p&gt;\r\n\r\n&lt;p&gt;Một công thức đặc biệt được thiết kế để không mùi thơm cho độ nhạy cảm quanh mắt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chống nhăn và chống sưng tấy, R [II] EYES làm giảm các dấu hiệu lão hóa trong khi làm mịn màng và làm sáng vùng mắt. * Được thiết kế như là sự bổ sung lý tưởng cho sự phun trào TEENSYAL® PURESENSE REDENSITY [II], nó hoàn thành và tăng cường các kết quả của các thủ tục thẩm mỹ.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;THÀNH PHẦN &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;RHA (Resilient Hyaluronic Acid)® Technology&lt;/p&gt;\r\n\r\n&lt;p&gt;+ Dermo-Restructuring Complex&lt;/p&gt;\r\n\r\n&lt;p&gt;+ NovHyal&lt;/p&gt;\r\n\r\n&lt;p&gt;Escine&lt;/p&gt;\r\n\r\n&lt;p&gt;Hamamelis Extract&lt;/p&gt;\r\n\r\n&lt;p&gt;Hyaluronic Acid fragments&lt;/p&gt;\r\n\r\n&lt;p&gt;+ EPS Seafill Pigments + Soft Focus&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;CÁC KẾT QUẢ &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;R [II] EYES ngay lập tức cung cấp một cảm giác tươi mát. Các vòng tròn đen và sưng húp giảm rõ rệt. Được sử dụng thường xuyên, các nếp nhăn và đường mọc đều được lấp đầy. Đường viền mắt được làm sạch và sáng lên cho vùng mắt rõ nét *.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;HƯỚNG DẪN SỬ DỤNG&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Sử dụng vào buổi sáng và buổi tối, nhẹ nhàng chạm vào dụng cụ bằng kim loại dọc theo vùng mắt để tạo ra hiệu quả mới và giảm bớt. Massage nhẹ nhàng cho đến khi hấp thụ. Sử dụng bên ngoài. Da liễu thử nghiệm. * Nghiên cứu in-vivo thực hiện trên 23 tình nguyện viên bởi một phòng thí nghiệm độc lập. ** Tự đánh giá được thực hiện trên 23 tình nguyện viên trong 28 ngày.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n', '', 'sdf', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ - Product 3 - Tiêm trẻ hóa - Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk thi', 'THÂM QUẦNG  MỤN TRỨNG CÁ  GIẢI PHÁP CỤ THỂ, Product 3, Tiêm trẻ hóa', 'canon-eos-5d', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_product_discount`
--

CREATE TABLE `wbc_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_product_filter`
--

CREATE TABLE `wbc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_product_image`
--

CREATE TABLE `wbc_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_product_image`
--

INSERT INTO `wbc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2357, 30, 'catalog/demo/canon_eos_5d_3.jpg', 0),
(2321, 47, 'catalog/demo/hp_3.jpg', 0),
(2035, 28, 'catalog/demo/htc_touch_hd_2.jpg', 0),
(2351, 41, 'catalog/demo/imac_3.jpg', 0),
(1982, 40, 'catalog/demo/iphone_6.jpg', 0),
(2001, 36, 'catalog/demo/ipod_nano_5.jpg', 0),
(2000, 36, 'catalog/demo/ipod_nano_4.jpg', 0),
(2005, 34, 'catalog/demo/ipod_shuffle_5.jpg', 0),
(2004, 34, 'catalog/demo/ipod_shuffle_4.jpg', 0),
(2011, 32, 'catalog/demo/ipod_touch_7.jpg', 0),
(2010, 32, 'catalog/demo/ipod_touch_6.jpg', 0),
(2009, 32, 'catalog/demo/ipod_touch_5.jpg', 0),
(1971, 43, 'catalog/demo/macbook_5.jpg', 0),
(1970, 43, 'catalog/demo/macbook_4.jpg', 0),
(1974, 44, 'catalog/demo/macbook_air_4.jpg', 0),
(1973, 44, 'catalog/demo/macbook_air_2.jpg', 0),
(1977, 45, 'catalog/demo/macbook_pro_2.jpg', 0),
(1976, 45, 'catalog/demo/macbook_pro_3.jpg', 0),
(1986, 31, 'catalog/demo/nikon_d300_3.jpg', 0),
(1985, 31, 'catalog/demo/nikon_d300_2.jpg', 0),
(1988, 29, 'catalog/demo/palm_treo_pro_3.jpg', 0),
(1995, 46, 'catalog/demo/sony_vaio_5.jpg', 0),
(1994, 46, 'catalog/demo/sony_vaio_4.jpg', 0),
(1991, 48, 'catalog/demo/ipod_classic_4.jpg', 0),
(1990, 48, 'catalog/demo/ipod_classic_3.jpg', 0),
(1981, 40, 'catalog/demo/iphone_2.jpg', 0),
(1980, 40, 'catalog/demo/iphone_5.jpg', 0),
(2356, 30, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2320, 47, 'catalog/demo/hp_2.jpg', 0),
(2034, 28, 'catalog/demo/htc_touch_hd_3.jpg', 0),
(2350, 41, 'catalog/demo/imac_2.jpg', 0),
(1979, 40, 'catalog/demo/iphone_3.jpg', 0),
(1978, 40, 'catalog/demo/iphone_4.jpg', 0),
(1989, 48, 'catalog/demo/ipod_classic_2.jpg', 0),
(1999, 36, 'catalog/demo/ipod_nano_2.jpg', 0),
(1998, 36, 'catalog/demo/ipod_nano_3.jpg', 0),
(2003, 34, 'catalog/demo/ipod_shuffle_2.jpg', 0),
(2002, 34, 'catalog/demo/ipod_shuffle_3.jpg', 0),
(2008, 32, 'catalog/demo/ipod_touch_2.jpg', 0),
(2007, 32, 'catalog/demo/ipod_touch_3.jpg', 0),
(2006, 32, 'catalog/demo/ipod_touch_4.jpg', 0),
(1969, 43, 'catalog/demo/macbook_2.jpg', 0),
(1968, 43, 'catalog/demo/macbook_3.jpg', 0),
(1972, 44, 'catalog/demo/macbook_air_3.jpg', 0),
(1975, 45, 'catalog/demo/macbook_pro_4.jpg', 0),
(1984, 31, 'catalog/demo/nikon_d300_4.jpg', 0),
(1983, 31, 'catalog/demo/nikon_d300_5.jpg', 0),
(1987, 29, 'catalog/demo/palm_treo_pro_2.jpg', 0),
(1993, 46, 'catalog/demo/sony_vaio_2.jpg', 0),
(1992, 46, 'catalog/demo/sony_vaio_3.jpg', 0),
(2327, 49, 'catalog/demo/samsung_tab_7.jpg', 0),
(2326, 49, 'catalog/demo/samsung_tab_6.jpg', 0),
(2325, 49, 'catalog/demo/samsung_tab_5.jpg', 0),
(2324, 49, 'catalog/demo/samsung_tab_4.jpg', 0),
(2323, 49, 'catalog/demo/samsung_tab_3.jpg', 0),
(2322, 49, 'catalog/demo/samsung_tab_2.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_product_option`
--

CREATE TABLE `wbc_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_product_option`
--

INSERT INTO `wbc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(227, 34, 2, '', 1),
(228, 47, 2, '', 1),
(236, 44, 2, '', 1),
(235, 43, 2, '', 1),
(234, 32, 2, '', 1),
(233, 36, 2, '', 1),
(232, 48, 2, '', 1),
(231, 40, 2, '', 1),
(230, 41, 2, '', 1),
(229, 28, 2, '', 1),
(237, 45, 2, '', 1),
(238, 31, 2, '', 1),
(239, 29, 2, '', 1),
(240, 35, 2, '', 1),
(241, 49, 2, '', 1),
(242, 33, 2, '', 1),
(243, 46, 2, '', 1),
(244, 30, 2, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_product_option_value`
--

CREATE TABLE `wbc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `upc` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_product_option_value`
--

INSERT INTO `wbc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`, `sku`, `upc`) VALUES
(29, 230, 41, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(28, 229, 28, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(27, 229, 28, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(26, 229, 28, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(25, 229, 28, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(24, 228, 47, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(23, 228, 47, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(22, 228, 47, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(21, 228, 47, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(20, 227, 34, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(17, 227, 34, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(18, 227, 34, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(19, 227, 34, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(30, 230, 41, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(31, 230, 41, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(32, 230, 41, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(33, 231, 40, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(34, 231, 40, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(35, 231, 40, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(36, 231, 40, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(37, 232, 48, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(38, 232, 48, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(39, 232, 48, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(40, 232, 48, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(41, 233, 36, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(42, 233, 36, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(43, 233, 36, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(44, 233, 36, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(45, 234, 32, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(46, 234, 32, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(47, 234, 32, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(48, 234, 32, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(49, 235, 43, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(50, 235, 43, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(51, 235, 43, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(52, 235, 43, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(53, 236, 44, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(54, 236, 44, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(55, 236, 44, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(56, 236, 44, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(57, 237, 45, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(58, 237, 45, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(59, 237, 45, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(60, 237, 45, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(61, 238, 31, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(62, 238, 31, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(63, 238, 31, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(64, 238, 31, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(65, 239, 29, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(66, 239, 29, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(67, 239, 29, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(68, 239, 29, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(69, 240, 35, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(70, 240, 35, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(71, 240, 35, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(72, 240, 35, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(73, 241, 49, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(74, 241, 49, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(75, 241, 49, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(76, 241, 49, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(77, 242, 33, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(78, 242, 33, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(79, 242, 33, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(80, 242, 33, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(81, 243, 46, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(82, 243, 46, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(83, 243, 46, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(84, 243, 46, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(85, 244, 30, 2, 24, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(86, 244, 30, 2, 45, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(87, 244, 30, 2, 44, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', ''),
(88, 244, 30, 2, 23, 1, 1, '0.0000', '+', 0, '+', '0.00000000', '+', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_product_recurring`
--

CREATE TABLE `wbc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_product_related`
--

CREATE TABLE `wbc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_product_reward`
--

CREATE TABLE `wbc_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_product_reward`
--

INSERT INTO `wbc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(519, 47, 1, 300),
(379, 28, 1, 400),
(329, 43, 1, 600),
(339, 29, 1, 0),
(343, 48, 1, 0),
(335, 40, 1, 0),
(548, 30, 1, 200),
(331, 44, 1, 700),
(333, 45, 1, 800),
(337, 31, 1, 0),
(425, 35, 1, 0),
(345, 33, 1, 0),
(347, 46, 1, 0),
(545, 41, 1, 0),
(351, 36, 1, 0),
(353, 34, 1, 0),
(355, 32, 1, 0),
(521, 49, 1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_product_special`
--

CREATE TABLE `wbc_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_product_special`
--

INSERT INTO `wbc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(445, 30, 1, 2, '90.0000', '0000-00-00', '0000-00-00'),
(444, 30, 1, 1, '80.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_product_to_category`
--

CREATE TABLE `wbc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_product_to_category`
--

INSERT INTO `wbc_product_to_category` (`product_id`, `category_id`) VALUES
(28, 17),
(28, 18),
(28, 20),
(28, 25),
(28, 33),
(29, 17),
(29, 18),
(29, 20),
(29, 25),
(29, 33),
(30, 17),
(30, 18),
(30, 20),
(30, 25),
(30, 33),
(31, 17),
(31, 18),
(31, 20),
(31, 25),
(31, 33),
(32, 17),
(32, 18),
(32, 20),
(32, 25),
(32, 33),
(33, 17),
(33, 18),
(33, 20),
(33, 25),
(33, 33),
(34, 17),
(34, 18),
(34, 20),
(34, 25),
(34, 33),
(35, 17),
(35, 18),
(35, 20),
(35, 25),
(35, 33),
(36, 17),
(36, 18),
(36, 20),
(36, 25),
(36, 33),
(40, 17),
(40, 18),
(40, 20),
(40, 25),
(40, 33),
(41, 17),
(41, 18),
(41, 20),
(41, 25),
(41, 33),
(43, 17),
(43, 18),
(43, 20),
(43, 25),
(43, 33),
(44, 17),
(44, 18),
(44, 20),
(44, 25),
(44, 33),
(45, 17),
(45, 18),
(45, 20),
(45, 25),
(45, 33),
(46, 17),
(46, 18),
(46, 20),
(46, 25),
(46, 33),
(47, 17),
(47, 18),
(47, 20),
(47, 25),
(47, 33),
(48, 17),
(48, 18),
(48, 20),
(48, 25),
(48, 33),
(49, 17),
(49, 18),
(49, 20),
(49, 25),
(49, 33);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_product_to_download`
--

CREATE TABLE `wbc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_product_to_layout`
--

CREATE TABLE `wbc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_product_to_layout`
--

INSERT INTO `wbc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(30, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_product_to_store`
--

CREATE TABLE `wbc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_product_to_store`
--

INSERT INTO `wbc_product_to_store` (`product_id`, `store_id`) VALUES
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(40, 0),
(41, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_recruit`
--

CREATE TABLE `wbc_recruit` (
  `recruit_id` int(11) NOT NULL,
  `allow_comment` int(1) NOT NULL DEFAULT '1',
  `count_read` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `date_timeout` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wbc_recruit`
--

INSERT INTO `wbc_recruit` (`recruit_id`, `allow_comment`, `count_read`, `sort_order`, `status`, `author`, `date_added`, `image`, `date_timeout`) VALUES
(16, 1, 10, 0, 1, 'John', '2017-05-06 11:16:20', '', '2017-05-25'),
(17, 1, 28, 0, 1, 'John', '2017-05-06 11:17:08', '', '2017-05-25'),
(18, 1, 0, 0, 1, 'An', '2017-05-09 09:49:29', '', '2017-05-09'),
(19, 1, 5, 0, 1, 'An', '2017-05-09 09:50:14', '', '2017-05-09');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_recruit_category`
--

CREATE TABLE `wbc_recruit_category` (
  `recruit_category_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `wbc_recruit_category`
--

INSERT INTO `wbc_recruit_category` (`recruit_category_id`, `parent_id`, `sort_order`, `date_added`, `status`) VALUES
(49, 0, 3, '2017-05-06 11:14:18', 1),
(53, 0, 0, '2017-05-09 09:48:53', 1),
(51, 0, 1, '2017-05-06 11:15:03', 1),
(52, 0, 0, '2017-05-09 09:46:16', 1),
(54, 0, 0, '2017-05-09 09:49:53', 1),
(55, 0, 0, '2017-06-02 17:34:20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_recruit_category_description`
--

CREATE TABLE `wbc_recruit_category_description` (
  `recruit_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `meta_keywords` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `wbc_recruit_category_description`
--

INSERT INTO `wbc_recruit_category_description` (`recruit_category_id`, `language_id`, `name`, `page_title`, `meta_keywords`, `meta_description`, `description`) VALUES
(49, 2, 'Phòng Dự Án', 'Phòng Dự Án', '', '', ''),
(53, 2, 'Phòng Bán Lẻ', 'Phòng Bán Lẻ', '', '', ''),
(54, 2, 'Quản Lý', '', '', '', ''),
(51, 2, 'Phòng HC-NS', 'Phòng hành chính', '', '', ''),
(52, 2, 'Phòng Đại Lý', '', '', '', ''),
(55, 2, 'Phòng kỹ thuật', '', '', '', ''),
(55, 1, 'Phòng kỹ thuật', '', '', '', ''),
(53, 1, 'Phòng Bán Lẻ', '', '', '', ''),
(52, 1, 'Phòng Đại Lý', '', '', '', ''),
(54, 1, 'Quản Lý', '', '', '', ''),
(51, 1, 'Phòng HC-NS', '', '', '', ''),
(49, 1, 'Phòng Dự Án', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_recruit_category_to_layout`
--

CREATE TABLE `wbc_recruit_category_to_layout` (
  `recruit_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_recruit_category_to_store`
--

CREATE TABLE `wbc_recruit_category_to_store` (
  `recruit_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `wbc_recruit_category_to_store`
--

INSERT INTO `wbc_recruit_category_to_store` (`recruit_category_id`, `store_id`) VALUES
(49, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_recruit_comment`
--

CREATE TABLE `wbc_recruit_comment` (
  `recruit_comment_id` int(11) NOT NULL,
  `recruit_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date_added` datetime DEFAULT '0000-00-00 00:00:00',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wbc_recruit_comment`
--

INSERT INTO `wbc_recruit_comment` (`recruit_comment_id`, `recruit_id`, `name`, `email`, `comment`, `date_added`, `status`) VALUES
(21, 1, 'dsadsad', 'dsad', 'đasadasdsadsad', '2017-05-06 19:27:13', 1),
(22, 1, 'dsadsad', 'dsad', 'đasadasdsadsad', '2017-05-06 19:27:13', 1),
(23, 1, '\\', 'binh@wbc.vn', 'đasadasdsadsad', '2017-05-06 19:27:20', 1),
(24, 1, 'ưe', 'binh@wbc.vn', 'đasadasdsadsad', '2017-05-06 19:27:27', 1),
(25, 1, 'ưeewqewqewqewqeqwe', 'binh@wbc.vn', 'đasadasdsadsad', '2017-05-06 19:27:31', 1),
(26, 1, 'ưeewqewqewqewqeqwe', 'binh@wbc.vn', 'đasadasdsadsad', '2017-05-06 19:27:44', 1),
(27, 1, 'ưeewqewqewqewqeqwe', 'binh@wbc.vn', 'đasadasdsadsad', '2017-05-06 19:28:49', 1),
(28, 1, 'ưeewqewqewqewqeqwe', 'binh@wbc.vn', 'đasadasdsadsad', '2017-05-06 19:29:09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_recruit_description`
--

CREATE TABLE `wbc_recruit_description` (
  `recruit_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  `page_title` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `short_description` text COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `tags` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `wbc_recruit_description`
--

INSERT INTO `wbc_recruit_description` (`recruit_id`, `language_id`, `title`, `page_title`, `meta_keyword`, `meta_description`, `short_description`, `description`, `tags`) VALUES
(17, 2, 'Sales Admin', '', '', 'Nhân viên kinh doanh – Thời vụNhân viên kinh doanh – Thời vụ', '', '&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Mô tả công việc:&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.5in; margin-right:0in; text-align:justify&quot;&gt;&lt;!--[if !supportLists]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;; mso-themecolor:text1&quot;&gt;&lt;span style=&quot;mso-list:Ignore&quot;&gt;-&lt;span style=&quot;font:7.0pt &amp;quot;Times New Roman&amp;quot;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;!--[endif]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Hỗ trợ phòng Dự án trong việc quản lý chứng từ, lập đơn hàng, xuất hàng, theo dõi tiến độ hợp đồng, hồ sơ thanh toán và các công việc hành chánh của phòng.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.5in; margin-right:0in; text-align:justify&quot;&gt;&lt;!--[if !supportLists]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;; mso-themecolor:text1&quot;&gt;&lt;span style=&quot;mso-list:Ignore&quot;&gt;-&lt;span style=&quot;font:7.0pt &amp;quot;Times New Roman&amp;quot;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;!--[endif]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Hỗ trợ xử lý công nợ, hàng mẫu, hợp đồng, báo giá, hồ sơ năng lực,…..&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.5in; margin-right:0in; text-align:justify&quot;&gt;&lt;!--[if !supportLists]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;; mso-themecolor:text1&quot;&gt;&lt;span style=&quot;mso-list:Ignore&quot;&gt;-&lt;span style=&quot;font:7.0pt &amp;quot;Times New Roman&amp;quot;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;!--[endif]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Thống kê báo cáo tồn kho mỗi ngày, kiểm tra tình trạng hàng hóa theo yêu cầu của nhân viên sales và khách hàng.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.5in; margin-right:0in; text-align:justify&quot;&gt;&lt;!--[if !supportLists]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;; mso-themecolor:text1&quot;&gt;&lt;span style=&quot;mso-list:Ignore&quot;&gt;-&lt;span style=&quot;font:7.0pt &amp;quot;Times New Roman&amp;quot;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;!--[endif]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Tổng hợp báo cáo của nhân viên phòng.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.5in; margin-right:0in; text-align:justify&quot;&gt;&lt;!--[if !supportLists]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;; mso-themecolor:text1&quot;&gt;&lt;span style=&quot;mso-list:Ignore&quot;&gt;-&lt;span style=&quot;font:7.0pt &amp;quot;Times New Roman&amp;quot;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;!--[endif]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Báo cáo mức độ hoàn thành công việc của phòng tới BLĐ&lt;/span&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Yêu cầu công việc:&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;!--[if !supportLists]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;; mso-themecolor:text1&quot;&gt;&lt;span style=&quot;mso-list:Ignore&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; -&lt;span style=&quot;font:7.0pt &amp;quot;Times New Roman&amp;quot;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;!--[endif]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Nữ&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.5in; margin-right:0in; text-align:justify&quot;&gt;&lt;!--[if !supportLists]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;; mso-themecolor:text1&quot;&gt;&lt;span style=&quot;mso-list:Ignore&quot;&gt;-&lt;span style=&quot;font:7.0pt &amp;quot;Times New Roman&amp;quot;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;!--[endif]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Tốt nghiệp Đại học trở lên&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.5in; margin-right:0in; text-align:justify&quot;&gt;&lt;!--[if !supportLists]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;; mso-themecolor:text1&quot;&gt;&lt;span style=&quot;mso-list:Ignore&quot;&gt;-&lt;span style=&quot;font:7.0pt &amp;quot;Times New Roman&amp;quot;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;!--[endif]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Tiếng Anh giao tiếp, kỹ năng viết tiếng Anh thương mại tốt.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.5in; margin-right:0in; text-align:justify&quot;&gt;&lt;!--[if !supportLists]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;; mso-themecolor:text1&quot;&gt;&lt;span style=&quot;mso-list:Ignore&quot;&gt;-&lt;span style=&quot;font:7.0pt &amp;quot;Times New Roman&amp;quot;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;!--[endif]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Có kinh nghiệm tối thiểu 2 năm trong việc lưu trữ văn thư, quản lý hợp đồng, bán hàng.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.5in; margin-right:0in; text-align:justify&quot;&gt;&lt;!--[if !supportLists]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;; mso-themecolor:text1&quot;&gt;&lt;span style=&quot;mso-list:Ignore&quot;&gt;-&lt;span style=&quot;font:7.0pt &amp;quot;Times New Roman&amp;quot;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;!--[endif]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Có khả năng quản lý tốt về quỹ thời gian làm việc&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.5in; margin-right:0in; text-align:justify&quot;&gt;&lt;!--[if !supportLists]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;; mso-themecolor:text1&quot;&gt;&lt;span style=&quot;mso-list:Ignore&quot;&gt;-&lt;span style=&quot;font:7.0pt &amp;quot;Times New Roman&amp;quot;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;!--[endif]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Ngoại hình dễ nhìn, kỹ năng giao tiếp tốt, nhanh nhẹn, trung thực&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.5in; margin-right:0in; text-align:justify&quot;&gt;&lt;!--[if !supportLists]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-fareast-font-family:&amp;quot;Times New Roman&amp;quot;; mso-themecolor:text1&quot;&gt;&lt;span style=&quot;mso-list:Ignore&quot;&gt;-&lt;span style=&quot;font:7.0pt &amp;quot;Times New Roman&amp;quot;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;!--[endif]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Có kỹ năng làm việc theo nhóm&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.25in; margin-right:0in&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Mức lương:&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt; thỏa thuận&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.25in&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Thông tin nộp hồ sơ:&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.75in; margin-right:0in&quot;&gt;&lt;!--[if !supportLists]--&gt;&lt;span style=&quot;color:black; font-size:12.0pt; line-height:150%; mso-ascii-font-family:Calibri; mso-bidi-font-family:Calibri; mso-fareast-font-family:Calibri; mso-hansi-font-family:Calibri; mso-themecolor:text1&quot;&gt;&lt;span style=&quot;mso-list:Ignore&quot;&gt;-&lt;span style=&quot;font:7.0pt &amp;quot;Times New Roman&amp;quot;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;!--[endif]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Phòng Nhân Sự - Công ty Cổ Phần Thương Mại Dịch Vụ An Biên&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.75in; margin-right:0in&quot;&gt;&lt;!--[if !supportLists]--&gt;&lt;span style=&quot;color:black; font-size:12.0pt; line-height:150%; mso-ascii-font-family:Calibri; mso-bidi-font-family:Calibri; mso-fareast-font-family:Calibri; mso-hansi-font-family:Calibri; mso-themecolor:text1&quot;&gt;&lt;span style=&quot;mso-list:Ignore&quot;&gt;-&lt;span style=&quot;font:7.0pt &amp;quot;Times New Roman&amp;quot;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;!--[endif]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;SĐT: 08 3620 9888 – ext: &lt;span style=&quot;mso-spacerun:yes&quot;&gt;&amp;nbsp;&lt;/span&gt;- Loan&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.75in; margin-right:0in&quot;&gt;&lt;!--[if !supportLists]--&gt;&lt;span style=&quot;color:black; font-size:12.0pt; line-height:150%; mso-ascii-font-family:Calibri; mso-bidi-font-family:Calibri; mso-fareast-font-family:Calibri; mso-hansi-font-family:Calibri; mso-themecolor:text1&quot;&gt;&lt;span style=&quot;mso-list:Ignore&quot;&gt;-&lt;span style=&quot;font:7.0pt &amp;quot;Times New Roman&amp;quot;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;!--[endif]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Email: &lt;/span&gt;&lt;a href=&quot;mailto:loan-ptc@anbien.com.vn&quot;&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;loan-ptc@anbien.com.vn&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt; (ưu tiên)&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.75in; margin-right:0in&quot;&gt;&lt;!--[if !supportLists]--&gt;&lt;span style=&quot;color:black; font-size:12.0pt; line-height:150%; mso-ascii-font-family:Calibri; mso-bidi-font-family:Calibri; mso-fareast-font-family:Calibri; mso-hansi-font-family:Calibri; mso-themecolor:text1&quot;&gt;&lt;span style=&quot;mso-list:Ignore&quot;&gt;-&lt;span style=&quot;font:7.0pt &amp;quot;Times New Roman&amp;quot;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;!--[endif]--&gt;&lt;span style=&quot;color:black; font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;; font-size:12.0pt; line-height:150%; mso-bidi-font-family:Times; mso-themecolor:text1&quot;&gt;Trực tiếp: 109 Cư Xá Nguyễn Văn Trỗi, đường Nguyễn Văn Trỗi, P.17, Q. Phú Nhuận, Tp. Hồ Chí Minh&lt;/span&gt;&lt;/p&gt;\r\n', ''),
(16, 2, 'Chuyên viên kinh doanh Dự Án', 'Chuyên viên kinh doanh Dự Án', '', '', '', '&lt;p style=&quot;text-align:center&quot;&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Mô tả công việc:&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Lập kế hoạch, tìm kiếm khách hàng, công trình trong khu vực được giao quản lý&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Liên hệ, xây dựng mối quan hệ với khách hàng, tư vấn bán hàng&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Chăm sóc khách hàng sau bán hàng, hỗ trợ khách hàng giải quyết các thắc mắc, khiếu nại&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Thực hiện các công việc tại văn phòng liên quan tới việc bán hàng (báo giá, hợp đồng, xuất phiếu đề nghị giao hàng,..)&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Báo cáo với Quản lý trực tiếp về những khó khăn, yêu cầu được hỗ trợ, thông tin thị trường,..&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Đảm bảo đạt chỉ tiêu doanh số được giao&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Kết hợp với các phòng bán khác để xử lý công việc&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Các yêu cầu khác nếu có yêu cầu&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;strong&gt;&lt;em&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/em&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Yêu cầu công việc:&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;strong&gt;&lt;em&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/em&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Tốt nghiệp Đại học trở lên&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Có kinh nghiệm tối thiểu 2 năm trong lĩnh vực Dự án, ưu tiên trong ngành vật liệu xây dựng&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Kỹ năng vi tính thanh thạo, có khả năng sắp xếp công việc khoa học, quản lý tốt quỹ thời gian làm việc&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Ngoại hình khá trở lên, kỹ năng giao tiếp tốt, nhanh nhẹn, trung thực&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Có khả năng làm việc theo nhóm&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin-left:.25in; margin-right:0in; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.25in; margin-right:0in&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Mức lương:&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt; thỏa thuận&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.25in; margin-right:0in&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.25in&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Thông tin nộp hồ sơ:&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Phòng Nhân Sự - Công ty Cổ Phần Thương Mại Dịch Vụ An Biên&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;SĐT: 08 3620 9888 – ext: &amp;nbsp;- Loan&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Email: &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;a href=&quot;mailto:loan-ptc@anbien.com.vn&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;loan-ptc@anbien.com.vn&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt; (ưu tiên)&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Trực tiếp: 109 Cư Xá Nguyễn Văn Trỗi, đường Nguyễn Văn Trỗi, P.17, Q. Phú Nhuận, Tp. Hồ Chí Minh&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '');
INSERT INTO `wbc_recruit_description` (`recruit_id`, `language_id`, `title`, `page_title`, `meta_keyword`, `meta_description`, `short_description`, `description`, `tags`) VALUES
(18, 2, 'Nhân viên kinh doanh Bán Lẻ', 'Nhân viên kinh doanh Bán Lẻ', '', '', '', '&lt;p style=&quot;margin-left:0.25in&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Mô tả công việc:&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Nắm rõ sản phẩm, chính sách bán hàng mà Công ty đang kinh doanh (Mã hàng, xuất xứ, chất, chất liệu, chiết khấu, chính sách khuyến mãi)&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Tìm kiếm khách hàng dân dụng (Nhà phố, Villa, Khách sạn mini, cao ốc, văn phòng)&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Tiếp khách và tư vấn sản phẩm tại công trình và tại Showroom&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Làm đơn hàng, hợp đồng&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Thực hiện các thủ tục xuất hàng&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Chủ động lập kế hoạch bán hàng cho bản thân&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Đảm bảo doanh thu hàng tháng, quý, năm theo chỉ tiêu được giao.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Hợp tác và hỗ trợ các nhân viên, phòng ban giải quyết các công việc có liên quan.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Báo cáo công việc hằng ngày, tuần, tháng, doanh số, doanh thu cho Trưởng phòng Bán lẻ&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin-left:.25in&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.25in&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Yêu cầu công việc:&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in 1.0in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Tốt nghiệp trung cấp trở lên&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in 1.0in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Có kinh nghiệm tối thiểu 1 năm trong lĩnh vực bán hàng, ưu tiên trong ngành vật liệu xây&amp;nbsp; dựng&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in 1.0in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Ngoại hình ưa nhìn, kỹ năng giao tiếp tốt, nhanh nhẹn, trung thực&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-bottom:.0001pt; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in 1.0in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Có khả năng làm việc theo nhóm &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin-left:.25in; margin-right:0in; text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.25in; margin-right:0in&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Mức lương:&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt; thỏa thuận&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.25in; margin-right:0in&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.25in&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Thông tin nộp hồ sơ:&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Phòng Nhân Sự - Công ty Cổ Phần Thương Mại Dịch Vụ An Biên&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;SĐT: 08 3620 9888 – ext: &amp;nbsp;- Loan&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Email: &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;a href=&quot;mailto:loan-ptc@anbien.com.vn&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;loan-ptc@anbien.com.vn&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt; (ưu tiên)&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Trực tiếp: 109 Cư Xá Nguyễn Văn Trỗi, đường Nguyễn Văn Trỗi, P.17, Q. Phú Nhuận, Tp. Hồ Chí Minh&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list 1.0in&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.25in&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n', ''),
(19, 2, 'Quản Lý Chi Nhánh Nha Trang', 'Quản Lý Chi Nhánh Nha Trang', '', '', '', '&lt;p style=&quot;margin-left:0.25in&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Mô tả công việc:&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Quản lý &amp;amp; chịu trách nhiệm chung về các hoạt động, chức năng liên quan đến lĩnh vực Hành Chánh - Nhân Sự như: &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Quản lý tài sản công cụ, dụng cụ chi nhánh, hoạt động hành chánh tại CN.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Thực hiện việc tuyển dụng, đào tạo nhân viên tại chi nhánh.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Thiết lập và tổ chức thực hiện các quy chế quản lý NỘI BỘ phù hợp với định hướng của HĐQT công ty.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Đánh giá kết quả làm việc của nhân viên toàn chi nhánh.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Động viên và tạo môi trường làm việc hiệu quả cho nhân viên nhằm tối ưu hóa nguồn nhân lực tại chi nhánh.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Điều hành các hoạt động theo cơ cấu tổ chức, quy chế quản lý nội bộ Chi nhánh nhằm đảm bảo kế hoạch thực hiện theo đúng tiến độ và hiệu quả tối ưu.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Điều hành tất cả các vấn đề liên quan đến hoạt động kinh doanh tại Chi nhánh theo đúng nghị quyết, quyết định của Chủ tịch HĐQT, điều lệ của công ty và các quy định của Pháp Luật có liên quan.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Lập &amp;amp; tổ chức triển khai kế hoạch kinh doanh của Chi nhánh.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Tổ chức thu thập, phân tích, đánh giá thông tin thị trường và đưa ra đề xuất kiến nghị và thực hiện các chính sách kinh doanh tại Chi nhánh.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Phê duyệt và kiểm soát các đơn đặt hàng, bán hàng thuộc Chi nhánh theo quy định của Công ty.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Xây dựng, quản lý công tác bán hàng &amp;amp; công nợ khách hàng theo quy định của Công ty.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Tổ chức hệ thống kiểm soát các hoạt động của Chi nhánh thông qua các công cụ quản lý đang áp dụng tại công ty và quy trình hoạt động kinh doanh.&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Yêu cầu công việc:&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Tốt nghiệp Đại Học&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Có kinh nghiệm quản lý, điều hành trong doanh nghiệp. Ưu tiên trong VLXD&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;tab-stops:list .5in&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Times New Roman&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Kỹ năng giao tiếp, phát triển mối quan hệ, lãnh đạo&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;margin-left:.25in; margin-right:0in&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Mức lương:&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt; thỏa thuận&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;margin-left:.25in&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Thông tin nộp hồ sơ:&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Phòng Nhân Sự - Công ty Cổ Phần Thương Mại Dịch Vụ An Biên&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;SĐT: 08 3620 9888 – ext: &amp;nbsp;- Loan&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Email: &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;a href=&quot;mailto:loan-ptc@anbien.com.vn&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;loan-ptc@anbien.com.vn&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt; (ưu tiên)&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n	&lt;li style=&quot;margin-top:0in; margin-right:0in; margin-bottom:.0001pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:12.0pt&quot;&gt;&lt;span style=&quot;line-height:150%&quot;&gt;&lt;span style=&quot;font-family:&amp;quot;Time new roma&amp;quot;,&amp;quot;serif&amp;quot;&quot;&gt;&lt;span style=&quot;color:black&quot;&gt;Trực tiếp: 109 Cư Xá Nguyễn Văn Trỗi, đường Nguyễn Văn Trỗi, P.17, Q. Phú Nhuận, Tp. Hồ Chí Minh&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_recruit_related`
--

CREATE TABLE `wbc_recruit_related` (
  `parent_recruit_id` int(11) NOT NULL DEFAULT '0',
  `child_recruit_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_recruit_to_category`
--

CREATE TABLE `wbc_recruit_to_category` (
  `recruit_id` int(11) NOT NULL,
  `recruit_category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `wbc_recruit_to_category`
--

INSERT INTO `wbc_recruit_to_category` (`recruit_id`, `recruit_category_id`) VALUES
(16, 49),
(17, 49),
(18, 53),
(19, 54);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_recruit_to_layout`
--

CREATE TABLE `wbc_recruit_to_layout` (
  `recruit_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `wbc_recruit_to_layout`
--

INSERT INTO `wbc_recruit_to_layout` (`recruit_id`, `store_id`, `layout_id`) VALUES
(18, 0, 0),
(19, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_recruit_to_store`
--

CREATE TABLE `wbc_recruit_to_store` (
  `recruit_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wbc_recruit_to_store`
--

INSERT INTO `wbc_recruit_to_store` (`recruit_id`, `store_id`) VALUES
(16, 0),
(17, 0),
(18, 0),
(19, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_recurring`
--

CREATE TABLE `wbc_recurring` (
  `recurring_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `cycle` int(10) UNSIGNED NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) UNSIGNED NOT NULL,
  `trial_cycle` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_recurring_description`
--

CREATE TABLE `wbc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_return`
--

CREATE TABLE `wbc_return` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_return_action`
--

CREATE TABLE `wbc_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_return_action`
--

INSERT INTO `wbc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent'),
(1, 2, 'Refunded'),
(2, 2, 'Credit Issued'),
(3, 2, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_return_history`
--

CREATE TABLE `wbc_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_return_reason`
--

CREATE TABLE `wbc_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_return_reason`
--

INSERT INTO `wbc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details'),
(1, 2, 'Dead On Arrival'),
(2, 2, 'Received Wrong Item'),
(3, 2, 'Order Error'),
(4, 2, 'Faulty, please supply details'),
(5, 2, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_return_status`
--

CREATE TABLE `wbc_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_return_status`
--

INSERT INTO `wbc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products'),
(1, 2, 'Pending'),
(3, 2, 'Complete'),
(2, 2, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_review`
--

CREATE TABLE `wbc_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_revslider_attachment_images`
--

CREATE TABLE `wbc_revslider_attachment_images` (
  `ID` int(10) NOT NULL,
  `file_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_revslider_css`
--

CREATE TABLE `wbc_revslider_css` (
  `id` int(9) NOT NULL,
  `handle` text NOT NULL,
  `settings` text,
  `hover` text,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_revslider_css`
--

INSERT INTO `wbc_revslider_css` (`id`, `handle`, `settings`, `hover`, `params`) VALUES
(1, '.tp-caption.lightgrey_divider', NULL, NULL, '{\"text-decoration\":\"none\",\"background-color\":\"rgba(235, 235, 235, 1)\",\"width\":\"370px\",\"height\":\"3px\",\"background-position\":\"initial initial\",\"background-repeat\":\"initial initial\",\"border-width\":\"0px\",\"border-color\":\"rgb(34, 34, 34)\",\"border-style\":\"none\"}'),
(2, '.tp-caption.contrast_font_heading', NULL, NULL, '{\"font-size\":\"60px\",\"color\":\"#ffffff\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(3, '.tp-caption.contrast_font_heading_dark', NULL, NULL, '{\"font-size\":\"60px\",\"color\":\"#222222\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(4, '.tp-caption.contrast_font_heading_primary', NULL, NULL, '{\"font-size\":\"60px\",\"color\":\"#d6a916\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(5, '.tp-caption.contrast_font_heading_secondary', NULL, NULL, '{\"font-size\":\"60px\",\"line-height\":\"56px\",\"color\":\"#276658\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(6, '.tp-caption.contrast_font_heading2', NULL, NULL, '{\"font-size\":\"48px\",\"color\":\"#ffffff\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(7, '.tp-caption.contrast_font_heading2_dark', NULL, NULL, '{\"font-size\":\"48px\",\"color\":\"#222222\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(8, '.tp-caption.contrast_font_heading2_primary', NULL, NULL, '{\"font-size\":\"48px\",\"color\":\"#d6a916\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(9, '.tp-caption.contrast_font_heading2_secondary', NULL, NULL, '{\"font-size\":\"48px\",\"line-height\":\"56px\",\"color\":\"#276658\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(10, '.tp-caption.contrast_font_sub_heading', NULL, NULL, '{\"font-size\":\"30px\",\"color\":\"#ffffff\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(11, '.tp-caption.contrast_font_sub_heading_dark', NULL, NULL, '{\"font-size\":\"30px\",\"color\":\"#222222\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(12, '.tp-caption.contrast_font_sub_heading_primary', NULL, NULL, '{\"font-size\":\"30px\",\"color\":\"#d6a916\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(13, '.tp-caption.contrast_font_sub_heading_secondary', NULL, NULL, '{\"font-size\":\"30px\",\"line-height\":\"56px\",\"color\":\"#276658\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(14, '.tp-caption.contrast_font', NULL, NULL, '{\"font-size\":\"17px\",\"color\":\"rgb(255, 255, 255)\",\"font-family\":\"\\\"Roboto Slab\\\",serif\",\"border-width\":\"0px\",\"border-color\":\"rgb(255, 255, 255)\",\"border-style\":\"none\"}'),
(15, '.tp-caption.contrast_font_dark', NULL, NULL, '{\"font-size\":\"17px\",\"color\":\"#222222\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(16, '.tp-caption.contrast_font_primary', NULL, NULL, '{\"font-size\":\"17px\",\"color\":\"#d6a916\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(17, '.tp-caption.contrast_font_secondary', NULL, NULL, '{\"font-size\":\"17px\",\"color\":\"#276658\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(18, '.tp-caption.contrast_font_slider_button', '{\"hover\":\"true\"}', '{\"border-color\":\"#ffffff\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}', '{\"color\":\"#ffffff\",\"border\":\"2px solid\",\"border-color\":\"transparent\",\"border-top-color\":\"#ffffff\",\"display\":\"inline-block\",\"padding\":\"12px 25px\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(19, '.tp-caption.contrast_font_slider_button_dark', '{\"hover\":\"true\"}', '{\"border-color\":\"#222222\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}', '{\"color\":\"#222222\",\"border\":\"2px solid\",\"border-color\":\"transparent\",\"border-top-color\":\"#222222\",\"display\":\"inline-block\",\"padding\":\"12px 25px\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(20, '.tp-caption.contrast_font_slider_button_primary', '{\"hover\":\"true\"}', '{\"border-color\":\"#d6a916\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}', '{\"color\":\"#d6a916\",\"border\":\"2px solid\",\"border-color\":\"transparent\",\"border-top-color\":\"#d6a916\",\"display\":\"inline-block\",\"padding\":\"12px 25px\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(21, '.tp-caption.contrast_font_slider_button_secondary', '{\"hover\":\"true\"}', '{\"border-color\":\"#276658\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}', '{\"color\":\"#276658\",\"border\":\"2px solid\",\"border-color\":\"transparent\",\"border-top-color\":\"#276658\",\"display\":\"inline-block\",\"padding\":\"12px 25px\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto Slab\\\", serif\"}'),
(22, '.tp-caption.main_font_heading', NULL, NULL, '{\"font-size\":\"60px\",\"color\":\"#ffffff\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(23, '.tp-caption.main_font_heading_dark', NULL, NULL, '{\"font-size\":\"60px\",\"color\":\"#222222\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(24, '.tp-caption.main_font_heading_primary', NULL, NULL, '{\"font-size\":\"60px\",\"color\":\"#d6a916\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(25, '.tp-caption.main_font_heading_secondary', NULL, NULL, '{\"font-size\":\"60px\",\"line-height\":\"56px\",\"color\":\"#276658\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(26, '.tp-caption.main_font_heading2', NULL, NULL, '{\"font-size\":\"48px\",\"color\":\"#ffffff\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(27, '.tp-caption.main_font_heading2_dark', NULL, NULL, '{\"font-size\":\"48px\",\"color\":\"#222222\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(28, '.tp-caption.main_font_heading2_primary', NULL, NULL, '{\"font-size\":\"48px\",\"color\":\"#d6a916\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(29, '.tp-caption.main_font_heading2_secondary', NULL, NULL, '{\"font-size\":\"48px\",\"line-height\":\"56px\",\"color\":\"#276658\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(30, '.tp-caption.main_font_sub_heading', NULL, NULL, '{\"font-size\":\"30px\",\"color\":\"#ffffff\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(31, '.tp-caption.main_font_sub_heading_dark', NULL, NULL, '{\"font-size\":\"30px\",\"color\":\"#222222\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(32, '.tp-caption.main_font_sub_heading_primary', NULL, NULL, '{\"font-size\":\"30px\",\"color\":\"#d6a916\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(33, '.tp-caption.main_font_sub_heading_secondary', NULL, NULL, '{\"font-size\":\"30px\",\"line-height\":\"56px\",\"color\":\"#276658\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(34, '.tp-caption.main_font', NULL, NULL, '{\"font-size\":\"17px\",\"color\":\"#ffffff\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(35, '.tp-caption.main_font_dark', NULL, NULL, '{\"font-size\":\"17px\",\"color\":\"#222222\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(36, '.tp-caption.main_font_primary', NULL, NULL, '{\"font-size\":\"17px\",\"color\":\"#d6a916\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(37, '.tp-caption.main_font_secondary', NULL, NULL, '{\"font-size\":\"17px\",\"color\":\"#276658\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(38, '.tp-caption.main_font_slider_button', '{\"hover\":\"true\"}', '{\"border-color\":\"#ffffff\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}', '{\"color\":\"#ffffff\",\"border\":\"2px solid\",\"border-color\":\"transparent\",\"border-top-color\":\"#ffffff\",\"display\":\"inline-block\",\"padding\":\"12px 25px\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(39, '.tp-caption.main_font_slider_button_dark', '{\"hover\":\"true\"}', '{\"border-color\":\"#222222\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}', '{\"color\":\"#222222\",\"border\":\"2px solid\",\"border-color\":\"transparent\",\"border-top-color\":\"#222222\",\"display\":\"inline-block\",\"padding\":\"12px 25px\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(40, '.tp-caption.main_font_slider_button_primary', '{\"hover\":\"true\"}', '{\"border-color\":\"#d6a916\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}', '{\"color\":\"#d6a916\",\"border\":\"2px solid\",\"border-color\":\"transparent\",\"border-top-color\":\"#d6a916\",\"display\":\"inline-block\",\"padding\":\"12px 25px\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(41, '.tp-caption.main_font_slider_button_secondary', '{\"hover\":\"true\"}', '{\"border-color\":\"#276658\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}', '{\"color\":\"#276658\",\"border\":\"2px solid\",\"border-color\":\"transparent\",\"border-top-color\":\"#276658\",\"display\":\"inline-block\",\"padding\":\"12px 25px\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(42, '.tp-caption.Title', NULL, NULL, '{\"font-size\":\"28px\",\"line-height\":\"33px\",\"font-weight\":\"700\",\"font-family\":\"Roboto, serif\",\"color\":\"rgb(255, 255, 255)\",\"text-decoration\":\"none\",\"background-color\":\"transparent\",\"border-width\":\"0px\",\"border-color\":\"rgb(255, 255, 255)\",\"border-style\":\"none\"}'),
(43, '.tp-caption.mota', NULL, NULL, '{\"font-size\":\"18px\",\"line-height\":\"25px\",\"font-weight\":\"500\",\"font-family\":\"Roboto, serif\",\"color\":\"rgb(209, 211, 212)\",\"text-decoration\":\"none\",\"background-color\":\"transparent\",\"border-width\":\"0px\",\"border-color\":\"rgb(255, 255, 255)\",\"border-style\":\"none\"}');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_revslider_layer_animations`
--

CREATE TABLE `wbc_revslider_layer_animations` (
  `id` int(9) NOT NULL,
  `handle` text NOT NULL,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_revslider_settings`
--

CREATE TABLE `wbc_revslider_settings` (
  `id` int(9) NOT NULL,
  `general` text NOT NULL,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_revslider_sliders`
--

CREATE TABLE `wbc_revslider_sliders` (
  `id` int(9) NOT NULL,
  `title` tinytext NOT NULL,
  `alias` tinytext,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_revslider_sliders`
--

INSERT INTO `wbc_revslider_sliders` (`id`, `title`, `alias`, `params`) VALUES
(1, 'home slideshow', 'homeslider', '{\"title\":\"home slideshow\",\"alias\":\"homeslider\",\"source_type\":\"gallery\",\"post_types\":\"product\",\"post_category\":\"category_20\",\"post_sortby\":\"ID\",\"prd_img_width\":\"880\",\"prd_img_height\":\"345\",\"posts_sort_direction\":\"DESC\",\"max_slider_posts\":\"30\",\"excerpt_limit\":\"55\",\"slider_template_id\":\"\",\"posts_list\":\"\",\"slider_type\":\"fullwidth\",\"fullscreen_offset_container\":\"\",\"fullscreen_offset_size\":\"\",\"fullscreen_min_height\":\"\",\"full_screen_align_force\":\"off\",\"auto_height\":\"on\",\"force_full_width\":\"on\",\"min_height\":\"0\",\"width\":\"1170\",\"height\":\"500\",\"responsitive_w1\":\"940\",\"responsitive_sw1\":\"770\",\"responsitive_w2\":\"780\",\"responsitive_sw2\":\"500\",\"responsitive_w3\":\"510\",\"responsitive_sw3\":\"310\",\"responsitive_w4\":\"0\",\"responsitive_sw4\":\"0\",\"responsitive_w5\":\"0\",\"responsitive_sw5\":\"0\",\"responsitive_w6\":\"0\",\"responsitive_sw6\":\"0\",\"delay\":\"9000\",\"shuffle\":\"off\",\"lazy_load\":\"off\",\"use_wpml\":\"off\",\"enable_static_layers\":\"off\",\"next_slide_on_window_focus\":\"off\",\"simplify_ie8_ios4\":\"off\",\"stop_slider\":\"off\",\"stop_after_loops\":0,\"stop_at_slide\":2,\"show_timerbar\":\"hide\",\"loop_slide\":\"loop\",\"position\":\"center\",\"margin_top\":0,\"margin_bottom\":0,\"margin_left\":0,\"margin_right\":0,\"shadow_type\":\"0\",\"padding\":0,\"background_color\":\"#E9E9E9\",\"background_dotted_overlay\":\"none\",\"show_background_image\":\"false\",\"background_image\":\"\",\"bg_fit\":\"cover\",\"bg_repeat\":\"no-repeat\",\"bg_position\":\"center top\",\"stop_on_hover\":\"off\",\"keyboard_navigation\":\"off\",\"navigation_style\":\"preview4\",\"navigaion_type\":\"bullet\",\"navigation_arrows\":\"solo\",\"navigaion_always_on\":\"false\",\"hide_thumbs\":200,\"navigaion_align_hor\":\"center\",\"navigaion_align_vert\":\"bottom\",\"navigaion_offset_hor\":\"0\",\"navigaion_offset_vert\":20,\"leftarrow_align_hor\":\"left\",\"leftarrow_align_vert\":\"center\",\"leftarrow_offset_hor\":20,\"leftarrow_offset_vert\":0,\"rightarrow_align_hor\":\"right\",\"rightarrow_align_vert\":\"center\",\"rightarrow_offset_hor\":20,\"rightarrow_offset_vert\":0,\"thumb_width\":100,\"thumb_height\":50,\"thumb_amount\":5,\"use_spinner\":\"0\",\"spinner_color\":\"#FFFFFF\",\"use_parallax\":\"on\",\"disable_parallax_mobile\":\"off\",\"parallax_type\":\"mouse\",\"parallax_bg_freeze\":\"off\",\"parallax_level_1\":\"5\",\"parallax_level_2\":\"10\",\"parallax_level_3\":\"15\",\"parallax_level_4\":\"20\",\"parallax_level_5\":\"25\",\"parallax_level_6\":\"30\",\"parallax_level_7\":\"35\",\"parallax_level_8\":\"40\",\"parallax_level_9\":\"45\",\"parallax_level_10\":\"50\",\"touchenabled\":\"on\",\"swipe_velocity\":75,\"swipe_min_touches\":1,\"drag_block_vertical\":\"false\",\"disable_on_mobile\":\"off\",\"disable_kenburns_on_mobile\":\"off\",\"hide_slider_under\":0,\"hide_defined_layers_under\":0,\"hide_all_layers_under\":0,\"hide_arrows_on_mobile\":\"off\",\"hide_bullets_on_mobile\":\"off\",\"hide_thumbs_on_mobile\":\"off\",\"hide_thumbs_under_resolution\":0,\"hide_thumbs_delay_mobile\":1500,\"start_with_slide\":\"1\",\"first_transition_active\":\"false\",\"first_transition_type\":\"fade\",\"first_transition_duration\":300,\"first_transition_slot_amount\":7,\"reset_transitions\":\"\",\"reset_transition_duration\":0,\"0\":\"Execute settings on all slides\",\"jquery_noconflict\":\"off\",\"js_to_body\":\"false\",\"output_type\":\"none\",\"custom_css\":\"\",\"custom_javascript\":\"\",\"template\":\"false\"}');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_revslider_slides`
--

CREATE TABLE `wbc_revslider_slides` (
  `id` int(9) NOT NULL,
  `slider_id` int(9) NOT NULL,
  `slide_order` int(11) NOT NULL,
  `params` text NOT NULL,
  `layers` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_revslider_slides`
--

INSERT INTO `wbc_revslider_slides` (`id`, `slider_id`, `slide_order`, `params`, `layers`) VALUES
(1, 1, 1, '{\"background_type\":\"image\",\"image\":\"http:\\/\\/grassroots.dev\\/image\\/catalog\\/slideshow\\/slider.jpg\"}', '');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_revslider_static_slides`
--

CREATE TABLE `wbc_revslider_static_slides` (
  `id` int(9) NOT NULL,
  `slider_id` int(9) NOT NULL,
  `params` text NOT NULL,
  `layers` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_setting`
--

CREATE TABLE `wbc_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` longtext NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_setting`
--

INSERT INTO `wbc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(22843, 0, 'config', 'config_compression', '0', 0),
(22844, 0, 'config', 'config_secure', '0', 0),
(22845, 0, 'config', 'config_password', '1', 0),
(22846, 0, 'config', 'config_shared', '0', 0),
(22847, 0, 'config', 'config_encryption', 'IkVdL0gcQNrG4Op30TevLN2vXptmGC8eVfMVEzE8moAfs7OxtzwbMDl6Qp6jpya3XIgepFz2HdrGtnmxrmUSwohn0v2tc05g6Tjje33xcTXfcuFCWg19pkIGFxOG29YqtvMSDHb8WIOwDrQDfFWtCYc45dJZW96GGBsbwpBUE9y6C44uhR3xsBejhcKMQlelWdh6qh5HJ4hVVpT9yK0cs8k35NTahh0QfOTSr6fTeRnKFFW2cufsly5HBjqDGmwqpIVbxo8Q0xSGjz2HJgBY3aT6DEAJiJHjNMHVKTCh18ENrnDXUiYtYpz01H7JrXszykwUnfbEzIDTL6VxRJona7wlohAltzocxTh7BytMBgBDri5AXKIlgxmt6kGYEEIqoU7PqPp3clpTHtkRsXyRd0TrnhhoWwHNniS6HlzlmWOipA9tRFTHULUmqnjiLTUwn7KMnyldln8rN1Nnu1XFnSfzWuUvQB3z6b5pVWGhfQazHPZKZ4sDyj0yuiy5RRcaJlM55awEYJv8AtZ2iW9LClQR8qJ95ALYIU38Dvw8HubedviJDYltWZDbvWfjrd1f9gshP7adQ1jkCMjd6fhIeOXakI7D4ywQ6l4QR9SMspWpOamvRHxacBZhvCrMesgf5q8NNYFgpdTGhdhyUydLqUCRo9rH9SCfLppYGpD2I46vcQdSA1hKOtBu5ofV30C1AUJOXdRitrA0F8kSbN82Gpq24jHYdAaEbm3D2mVjIxbdPJa5gxRXC9vCQJBLuqDsV2kMUuuHP10M7wY9COI50aB4KOYQqGXoKzTMgjeXRx3fI9v9t8xRsVXZaFK4rhkoK4t1MFuLSCGlo6wOoTW3BJFRRcNNoINxRQaM5dluLrMuSPLtO7TXlh0N7Hexxs7a7JVIT76BIB58NSQBJqHWptDiWo7N2y7eODb12kLiCFD4jHIXRq3GsfeT5SP5PGbsQMfiWb3gPj3wp2iCVf8fdBx0TFRx036XOrXD6WkYqRpJAvqgxKSLEpqAy5YuIYCl', 0),
(4, 0, 'voucher', 'voucher_sort_order', '8', 0),
(5, 0, 'voucher', 'voucher_status', '1', 0),
(22823, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(22824, 0, 'config', 'config_ftp_hostname', 'grassroots.dev', 0),
(22825, 0, 'config', 'config_ftp_port', '21', 0),
(22826, 0, 'config', 'config_ftp_username', '', 0),
(22827, 0, 'config', 'config_ftp_password', '', 0),
(22828, 0, 'config', 'config_ftp_root', '', 0),
(22829, 0, 'config', 'config_ftp_status', '0', 0),
(22830, 0, 'config', 'config_whoapos_status', '0', 0),
(22831, 0, 'config', 'config_mail_protocol', 'smtp', 0),
(22832, 0, 'config', 'config_mail_parameter', '', 0),
(22833, 0, 'config', 'config_mail_smtp_hostname', 'tls://smtp.gmail.com', 0),
(22834, 0, 'config', 'config_mail_smtp_username', 'binh@wbc.vn', 0),
(22835, 0, 'config', 'config_mail_smtp_password', 'aprlcdbabohnsvaw', 0),
(22836, 0, 'config', 'config_mail_smtp_port', '587', 0),
(22837, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(22838, 0, 'config', 'config_mail_alert', '[\"order\"]', 1),
(22839, 0, 'config', 'config_mail_alert_email', '', 0),
(22840, 0, 'config', 'config_maintenance', '0', 0),
(22841, 0, 'config', 'config_seo_url', '0', 0),
(22842, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(22822, 0, 'config', 'config_logo', 'catalog/logo_white.png', 0),
(22821, 0, 'config', 'config_captcha_page', '[\"review\",\"return\",\"contact\"]', 1),
(22820, 0, 'config', 'config_captcha', '', 0),
(22819, 0, 'config', 'config_return_status_id', '2', 0),
(22818, 0, 'config', 'config_return_id', '0', 0),
(22817, 0, 'config', 'config_affiliate_id', '4', 0),
(22816, 0, 'config', 'config_affiliate_commission', '5', 0),
(22815, 0, 'config', 'config_affiliate_auto', '0', 0),
(22814, 0, 'config', 'config_affiliate_approval', '0', 0),
(22813, 0, 'config', 'config_stock_checkout', '0', 0),
(22812, 0, 'config', 'config_stock_warning', '0', 0),
(22811, 0, 'config', 'config_stock_display', '0', 0),
(22810, 0, 'config', 'config_api_id', '1', 0),
(22809, 0, 'config', 'config_fraud_status_id', '7', 0),
(22808, 0, 'config', 'config_complete_status', '[\"5\",\"3\"]', 1),
(22807, 0, 'config', 'config_processing_status', '[\"5\",\"1\",\"2\",\"12\",\"3\"]', 1),
(22806, 0, 'config', 'config_order_status_id', '1', 0),
(22805, 0, 'config', 'config_checkout_id', '5', 0),
(22804, 0, 'config', 'config_checkout_guest', '1', 0),
(22803, 0, 'config', 'config_cart_weight', '1', 0),
(22802, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(22801, 0, 'config', 'config_account_id', '3', 0),
(22800, 0, 'config', 'config_login_attempts', '5', 0),
(22799, 0, 'config', 'config_customer_price', '0', 0),
(22798, 0, 'config', 'config_customer_group_display', '[\"1\"]', 1),
(22797, 0, 'config', 'config_customer_group_id', '1', 0),
(22796, 0, 'config', 'config_customer_search', '0', 0),
(22795, 0, 'config', 'config_customer_activity', '0', 0),
(95, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(96, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(97, 0, 'shipping', 'shipping_sort_order', '3', 0),
(98, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(99, 0, 'sub_total', 'sub_total_status', '1', 0),
(100, 0, 'tax', 'tax_status', '1', 0),
(101, 0, 'total', 'total_sort_order', '9', 0),
(102, 0, 'total', 'total_status', '1', 0),
(103, 0, 'tax', 'tax_sort_order', '5', 0),
(104, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(105, 0, 'cod', 'cod_sort_order', '5', 0),
(106, 0, 'cod', 'cod_total', '0.01', 0),
(107, 0, 'cod', 'cod_order_status_id', '1', 0),
(108, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(109, 0, 'cod', 'cod_status', '1', 0),
(110, 0, 'shipping', 'shipping_status', '1', 0),
(111, 0, 'shipping', 'shipping_estimator', '1', 0),
(112, 0, 'coupon', 'coupon_sort_order', '4', 0),
(113, 0, 'coupon', 'coupon_status', '1', 0),
(114, 0, 'flat', 'flat_sort_order', '1', 0),
(115, 0, 'flat', 'flat_status', '1', 0),
(116, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(117, 0, 'flat', 'flat_tax_class_id', '9', 0),
(118, 0, 'flat', 'flat_cost', '5.00', 0),
(119, 0, 'credit', 'credit_sort_order', '7', 0),
(120, 0, 'credit', 'credit_status', '1', 0),
(121, 0, 'reward', 'reward_sort_order', '2', 0),
(122, 0, 'reward', 'reward_status', '1', 0),
(21819, 0, 'ckeditorfull', 'ckeditorfull_height', '200', 0),
(22213, 0, 'theme_default', 'theme_default_image_location_height', '50', 0),
(21706, 0, 'so_sociallogin', 'so_sociallogin_googlesecretapi', 'COYNPrxaLq42QdIM2XBPASna', 0),
(21705, 0, 'so_sociallogin', 'so_sociallogin_googleapikey', '21690390667-tco9t3ca2o89d3sshkb2fmppoioq5mfq.apps.googleusercontent.com', 0),
(21703, 0, 'so_sociallogin', 'so_sociallogin_googletitle', 'Google Login', 0),
(21704, 0, 'so_sociallogin', 'so_sociallogin_googleimage', 'catalog/sociallogin/google.png', 0),
(21702, 0, 'so_sociallogin', 'so_sociallogin_twitstatus', '1', 0),
(21701, 0, 'so_sociallogin', 'so_sociallogin_twitsecretapi', 'i7kGpUlhPsEmb4AkmaSQ2kFqgBM2U1nYs7ijHGk2f65J0672mP', 0),
(21699, 0, 'so_sociallogin', 'so_sociallogin_twitimage', 'catalog/sociallogin/twitter.png', 0),
(21700, 0, 'so_sociallogin', 'so_sociallogin_twitapikey', 'EEJ3pjetfaHXrOw54ZyjATQGw', 0),
(21698, 0, 'so_sociallogin', 'so_sociallogin_twittertitle', 'Twitter Login', 0),
(21697, 0, 'so_sociallogin', 'so_sociallogin_fbstatus', '1', 0),
(21696, 0, 'so_sociallogin', 'so_sociallogin_fbsecretapi', '88d0f814891d4d1a9b173647291a911e', 0),
(21695, 0, 'so_sociallogin', 'so_sociallogin_fbapikey', '442675926063537', 0),
(21694, 0, 'so_sociallogin', 'so_sociallogin_fbimage', 'catalog/sociallogin/fb.png', 0),
(150, 0, 'dashboard_activity', 'dashboard_activity_status', '1', 0),
(151, 0, 'dashboard_activity', 'dashboard_activity_sort_order', '7', 0),
(152, 0, 'dashboard_sale', 'dashboard_sale_status', '1', 0),
(153, 0, 'dashboard_sale', 'dashboard_sale_width', '3', 0),
(154, 0, 'dashboard_chart', 'dashboard_chart_status', '1', 0),
(155, 0, 'dashboard_chart', 'dashboard_chart_width', '6', 0),
(156, 0, 'dashboard_customer', 'dashboard_customer_status', '1', 0),
(157, 0, 'dashboard_customer', 'dashboard_customer_width', '3', 0),
(158, 0, 'dashboard_map', 'dashboard_map_status', '1', 0),
(159, 0, 'dashboard_map', 'dashboard_map_width', '6', 0),
(160, 0, 'dashboard_online', 'dashboard_online_status', '1', 0),
(161, 0, 'dashboard_online', 'dashboard_online_width', '3', 0),
(162, 0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0),
(163, 0, 'dashboard_order', 'dashboard_order_status', '1', 0),
(164, 0, 'dashboard_order', 'dashboard_order_width', '3', 0),
(165, 0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0),
(166, 0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0),
(167, 0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0),
(168, 0, 'dashboard_map', 'dashboard_map_sort_order', '5', 0),
(169, 0, 'dashboard_chart', 'dashboard_chart_sort_order', '6', 0),
(170, 0, 'dashboard_recent', 'dashboard_recent_status', '1', 0),
(171, 0, 'dashboard_recent', 'dashboard_recent_sort_order', '8', 0),
(172, 0, 'dashboard_activity', 'dashboard_activity_width', '4', 0),
(173, 0, 'dashboard_recent', 'dashboard_recent_width', '8', 0),
(22794, 0, 'config', 'config_customer_online', '0', 0),
(22793, 0, 'config', 'config_tax_customer', 'shipping', 0),
(22792, 0, 'config', 'config_tax_default', 'shipping', 0),
(22791, 0, 'config', 'config_tax', '1', 0),
(22790, 0, 'config', 'config_voucher_max', '1000', 0),
(22789, 0, 'config', 'config_voucher_min', '1', 0),
(22788, 0, 'config', 'config_review_guest', '1', 0),
(22787, 0, 'config', 'config_review_status', '1', 0),
(22786, 0, 'config', 'config_limit_admin', '20', 0),
(22785, 0, 'config', 'config_product_count', '1', 0),
(22784, 0, 'config', 'config_weight_class_id', '1', 0),
(22783, 0, 'config', 'config_length_class_id', '1', 0),
(22782, 0, 'config', 'config_currency_auto', '1', 0),
(22781, 0, 'config', 'config_currency', 'USD', 0),
(22780, 0, 'config', 'config_admin_language', 'vi-vn', 0),
(22779, 0, 'config', 'config_language', 'vi-vn', 0),
(22212, 0, 'theme_default', 'theme_default_image_location_width', '268', 0),
(22210, 0, 'theme_default', 'theme_default_image_cart_width', '74', 0),
(22211, 0, 'theme_default', 'theme_default_image_cart_height', '74', 0),
(22209, 0, 'theme_default', 'theme_default_image_wishlist_height', '47', 0),
(22208, 0, 'theme_default', 'theme_default_image_wishlist_width', '47', 0),
(22206, 0, 'theme_default', 'theme_default_image_compare_width', '90', 0),
(22207, 0, 'theme_default', 'theme_default_image_compare_height', '90', 0),
(22205, 0, 'theme_default', 'theme_default_image_related_height', '270', 0),
(22204, 0, 'theme_default', 'theme_default_image_related_width', '270', 0),
(22203, 0, 'theme_default', 'theme_default_image_additional_height', '460', 0),
(22202, 0, 'theme_default', 'theme_default_image_additional_width', '460', 0),
(22200, 0, 'theme_default', 'theme_default_image_product_width', '270', 0),
(22201, 0, 'theme_default', 'theme_default_image_product_height', '270', 0),
(22199, 0, 'theme_default', 'theme_default_image_popup_height', '1000', 0),
(22198, 0, 'theme_default', 'theme_default_image_popup_width', '1000', 0),
(22197, 0, 'theme_default', 'theme_default_image_thumb_height', '460', 0),
(22195, 0, 'theme_default', 'theme_default_image_category_height', '265', 0),
(21710, 0, 'so_sociallogin', 'so_sociallogin_linkdinapikey', '78b7xin6x0kjj3', 0),
(21711, 0, 'so_sociallogin', 'so_sociallogin_linkdinsecretapi', 'qvTyRdKakj6WFmWs', 0),
(21712, 0, 'so_sociallogin', 'so_sociallogin_linkstatus', '1', 0),
(21715, 0, 'currency_switch', 'currency_switch_status', '1', 0),
(21716, 0, 'language_switch', 'language_switch_status', '1', 0),
(21717, 0, 'pim', 'pim_status', '1', 0),
(21718, 0, 'pim', 'pim_miu', '0', 0),
(21719, 0, 'pim', 'pim_deletedef', '0', 0),
(21720, 0, 'pim', 'pim_copyOverwrite', '0', 0),
(21721, 0, 'pim', 'pim_uploadOverwrite', '0', 0),
(21722, 0, 'pim', 'pim_uploadMaxSize', '999', 0),
(21723, 0, 'pim', 'pim_uploadMaxType', 'M', 0),
(21724, 0, 'pim', 'pim_language', '', 0),
(21725, 0, 'pim', 'pim_width', '800', 0),
(21726, 0, 'pim', 'pim_height', '400', 0),
(21820, 0, 'ckeditorfull', 'ckeditorfull_apikey', 'AIzaSyC4GtHbmLs08NzlyMvaBGM5AllZ4VkTg6o', 0),
(21821, 0, 'ckeditorfull', 'ckeditorfull_acf', 'false', 0),
(21707, 0, 'so_sociallogin', 'so_sociallogin_googlestatus', '1', 0),
(21708, 0, 'so_sociallogin', 'so_sociallogin_linkedintitle', 'Linkedin Login', 0),
(21709, 0, 'so_sociallogin', 'so_sociallogin_linkdinimage', 'catalog/sociallogin/linkedin.png', 0),
(22196, 0, 'theme_default', 'theme_default_image_thumb_width', '460', 0),
(22194, 0, 'theme_default', 'theme_default_image_category_width', '870', 0),
(22193, 0, 'theme_default', 'theme_default_product_description_length', '200', 0),
(22192, 0, 'theme_default', 'theme_default_product_limit', '12', 0),
(22190, 0, 'theme_default', 'theme_default_directory', 'so-revo', 0),
(22191, 0, 'theme_default', 'theme_default_status', '1', 0),
(22070, 0, 'so_mobile', 'mobile_general', '{\"mobilelayout\":\"1\",\"nameColor\":\"blue\",\"colorHex\":\"#ff5e00\",\"listcolor\":\"blue\",\"platforms_mobile\":\"1\",\"logomobile\":\"catalog\\/demo\\/logo\\/logo-default.png\",\"barnav\":\"1\",\"copyright\":\"Copyright \\u00a9 2017 by &lt;a href=&quot;http:\\/\\/www.opencartworks.com\\/&quot; target=&quot;_blank&quot;  title=&quot;OpenCartWorks&quot;&gt;OpenCartWorks.com&lt;\\/a&gt;. All Rights Reserved.\",\"mobileheader\":\"1\",\"imgpayment\":\"catalog\\/demo\\/payment\\/payment_method_mob.png\",\"phone_status\":\"1\",\"phone_text\":\"12345678\",\"email_status\":\"1\",\"email_text\":\"Support@revo.com\",\"customfooter_status\":\"1\",\"customfooter_text\":\"&lt;p&gt;&lt;a href=&quot;javascript:void(0);&quot;&gt;FIND US ON&lt;\\/a&gt;&lt;\\/p&gt;\\r\\n\\r\\n&lt;ul class=&quot;list-inline&quot;&gt;\\r\\n\\t&lt;li&gt;&amp;nbsp;&lt;\\/li&gt;\\r\\n\\t&lt;li&gt;&amp;nbsp;&lt;\\/li&gt;\\r\\n\\t&lt;li&gt;&amp;nbsp;&lt;\\/li&gt;\\r\\n&lt;\\/ul&gt;\\r\\n\",\"menufooter_status\":\"1\",\"footermenus\":[{\"name\":\"Gift Certificates\",\"link\":\"index.php?route=account\\/voucher\",\"sort\":\"1\"},{\"name\":\"Wishlist\",\"link\":\"index.php?route=account\\/wishlist\",\"sort\":\"2\"},{\"name\":\"Affiliate\",\"link\":\"index.php?route=affiliate\\/login\",\"sort\":\"3\"},{\"name\":\"Special\",\"link\":\"index.php?route=product\\/special\",\"sort\":\"4\"},{\"name\":\"Manufacturer\",\"link\":\"?route=product\\/manufacturer\",\"sort\":\"5\"},{\"name\":\"About Us\",\"link\":\"index.php?route=information\\/information&amp;information_id=4\",\"sort\":\"6\"},{\"name\":\"Blogs\",\"link\":\"index.php?route=simple_blog\\/article\",\"sort\":\"7\"},{\"name\":\"Contact\",\"link\":\"index.php?route=information\\/contact\",\"sort\":\"\"},{\"name\":\"Site Map\",\"link\":\"index.php?route=information\\/sitemap\",\"sort\":\"\"},{\"name\":\"Order History\",\"link\":\"index.php?route=account\\/order\",\"sort\":\"\"}],\"barmore_status\":\"1\",\"listmenus\":[{\"name\":\"Home\",\"link\":\"http:\\/\\/dev.ytcvn.com\\/ytc_templates\\/opencart\\/so23_revo\",\"sort\":\"1\"},{\"name\":\"Home 2\",\"link\":\"http:\\/\\/dev.ytcvn.com\\/ytc_templates\\/opencart\\/so23_revo\\/layout2\\/\",\"sort\":\"2\"},{\"name\":\"Home 3\",\"link\":\"http:\\/\\/dev.ytcvn.com\\/ytc_templates\\/opencart\\/so23_revo\\/layout3\",\"sort\":\"3\"}],\"barsearch_status\":\"1\",\"barwistlist_status\":\"1\",\"barcompare_status\":\"1\",\"barcurenty_status\":\"1\",\"barlanguage_status\":\"1\",\"category_more\":\"1\",\"compare_status\":\"1\",\"wishlist_status\":\"1\",\"addcart_status\":\"1\",\"body_status\":\"google\",\"normal_body\":\"inherit\",\"url_body\":\"https:\\/\\/fonts.googleapis.com\\/css?family=Open+Sans:400,600,700\",\"family_body\":\"Open Sans, sans-serif;\",\"selector_body\":\"body\",\"heading_status\":\"google\",\"normal_heading\":\"inherit\",\"url_heading\":\"https:\\/\\/fonts.googleapis.com\\/css?family=Raleway:600,700\",\"family_heading\":\"Raleway, sans-serif;\",\"selector_heading\":\".font-ct, h1, h2, h3, .static-menu a.main-menu, .container-megamenu.vertical .vertical-wrapper ul li &gt; a strong, .container-megamenu.vertical .vertical-wrapper ul.megamenu li .sub-menu .content .static-menu .menu ul li a.main-menu, .horizontal ul.megamenu &gt; li &gt; a, .footertitle, .module h3.modtitle span, .breadcrumb li a,  .right-block .caption, .item-title a, .best-seller-custom .item-info, .product-box-desc, .product_page_price .price-new, .list-group-item a\",\"scsscompile\":\"0\",\"scssformat\":\"Expanded\",\"compilemuticolor\":\"0\"}', 1),
(23040, 0, 'recruitsetting', 'recruitsetting_recruits_per_page', '10', 0),
(23041, 0, 'recruitsetting', 'recruitsetting_layout', '1', 0),
(23042, 0, 'recruitsetting', 'recruitsetting_thumbs_w', '100', 0),
(23039, 0, 'recruitsetting', 'recruitsetting_home_meta_keyword', '{\"2\":\"\",\"1\":\"\"}', 1),
(21693, 0, 'so_sociallogin', 'so_sociallogin_fbtitle', 'Facebook Login', 0),
(21692, 0, 'so_sociallogin', 'so_sociallogin_popuplogin', '1', 0),
(21691, 0, 'so_sociallogin', 'so_sociallogin_status', '1', 0),
(22778, 0, 'config', 'config_zone_id', '', 0),
(22777, 0, 'config', 'config_country_id', '92', 0),
(22776, 0, 'config', 'config_comment', '', 0),
(22775, 0, 'config', 'config_open', '', 0),
(22774, 0, 'config', 'config_image', '', 0),
(22773, 0, 'config', 'config_fax', '', 0),
(22772, 0, 'config', 'config_telephone', '123456789', 0),
(22771, 0, 'config', 'config_email', 'binh@wbc.vn', 0),
(22770, 0, 'config', 'config_geocode', '', 0),
(22769, 0, 'config', 'config_address', 'Address 1', 0),
(22768, 0, 'config', 'config_owner', 'Your Name', 0),
(22767, 0, 'config', 'config_name', 'Your Store', 0),
(22766, 0, 'config', 'config_layout_id', '4', 0),
(22765, 0, 'config', 'config_theme', 'theme_default', 0),
(22764, 0, 'config', 'config_meta_keyword', '', 0),
(21687, 0, 'so_sociallogin', 'so_sociallogin_name', 'So Social Login', 0),
(21688, 0, 'so_sociallogin', 'so_sociallogin_width', '130', 0),
(21689, 0, 'so_sociallogin', 'so_sociallogin_height', '35', 0),
(21690, 0, 'so_sociallogin', 'so_sociallogin_button', 'icon', 0),
(22763, 0, 'config', 'config_meta_description', 'My Store', 0),
(22762, 0, 'config', 'config_meta_title', 'Your Store', 0),
(21818, 0, 'ckeditorfull', 'ckeditorfull_skin', 'moono', 0),
(23038, 0, 'recruitsetting', 'recruitsetting_home_meta_description', '{\"2\":\"\",\"1\":\"\"}', 1),
(22943, 0, 'blogsetting', 'blogsetting_author_change', '0', 0),
(22942, 0, 'blogsetting', 'blogsetting_comment_notification', '0', 0),
(22941, 0, 'blogsetting', 'blogsetting_comment_approve', '0', 0),
(22940, 0, 'blogsetting', 'blogsetting_comment_per_page', '12', 0),
(22939, 0, 'blogsetting', 'blogsetting_rel_characters', '80', 0),
(22937, 0, 'blogsetting', 'blogsetting_rel_thumbs_w', '700', 0),
(22938, 0, 'blogsetting', 'blogsetting_rel_thumbs_h', '350', 0),
(22936, 0, 'blogsetting', 'blogsetting_rel_thumb', '0', 0),
(22852, 0, 'config', 'config_error_log', '1', 0),
(22853, 0, 'config', 'config_error_filename', 'error.log', 0),
(22851, 0, 'config', 'config_error_display', '1', 0),
(22848, 0, 'config', 'config_file_max_size', '300000', 0),
(22849, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(22850, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(22761, 0, 'mlseo', 'mlseo_default_lang', 'vi-vn', 0),
(22760, 0, 'mlseo', 'mlseo_lang_to_store', '{\"vi-vn\":{\"config_url\":\"http:\\/\\/grassroots.dev\",\"config_ssl\":\"http:\\/\\/grassroots.dev\"}}', 1),
(22759, 0, 'mlseo', 'mlseo_lang_codes', '{\"2\":\"vi-vn\",\"1\":\"en-gb\"}', 1),
(22758, 0, 'mlseo', 'mlseo_ml_mode', '1', 0),
(22757, 0, 'mlseo', 'mlseo_manufacturer_url_pattern', '[name]', 0),
(22756, 0, 'mlseo', 'mlseo_information_full_desc_pattern', '[name]', 0),
(22754, 0, 'mlseo', 'mlseo_information_keyword_pattern', '[name] [desc]', 0),
(22755, 0, 'mlseo', 'mlseo_information_description_pattern', '[name] - [desc]', 0),
(22753, 0, 'mlseo', 'mlseo_information_title_pattern', '[name]', 0),
(22752, 0, 'mlseo', 'mlseo_information_h3_pattern', '[name]', 0),
(22750, 0, 'mlseo', 'mlseo_information_h1_pattern', '[name]', 0),
(22751, 0, 'mlseo', 'mlseo_information_h2_pattern', '[name]', 0),
(22747, 0, 'mlseo', 'mlseo_category_description_pattern', '[name] - [desc]', 0),
(22749, 0, 'mlseo', 'mlseo_information_url_pattern', '[name]', 0),
(22748, 0, 'mlseo', 'mlseo_category_full_desc_pattern', '[name]', 0),
(22935, 0, 'blogsetting', 'blogsetting_rel_blog_per_row', '1', 0),
(22934, 0, 'blogsetting', 'blogsetting_post_thumbs_h', '350', 0),
(22933, 0, 'blogsetting', 'blogsetting_post_thumbs_w', '700', 0),
(22932, 0, 'blogsetting', 'blogsetting_post_thumb', '0', 0),
(22931, 0, 'blogsetting', 'blogsetting_share', '0', 0),
(22928, 0, 'blogsetting', 'blogsetting_post_comments_count', '0', 0),
(22929, 0, 'blogsetting', 'blogsetting_post_page_view', '0', 0),
(22930, 0, 'blogsetting', 'blogsetting_post_author', '0', 0),
(22926, 0, 'blogsetting', 'blogsetting_author', '0', 0),
(22927, 0, 'blogsetting', 'blogsetting_post_date_added', '0', 0),
(22924, 0, 'blogsetting', 'blogsetting_comments_count', '0', 0),
(22925, 0, 'blogsetting', 'blogsetting_page_view', '0', 0),
(22923, 0, 'blogsetting', 'blogsetting_date_added', '1', 0),
(22922, 0, 'blogsetting', 'blogsetting_thumbs_h', '350', 0),
(22921, 0, 'blogsetting', 'blogsetting_thumbs_w', '700', 0),
(22920, 0, 'blogsetting', 'blogsetting_layout', '4', 0),
(22919, 0, 'blogsetting', 'blogsetting_blogs_per_page', '12', 0),
(22918, 0, 'blogsetting', 'blogsetting_home_meta_keyword', '{\"2\":\"\",\"1\":\"\"}', 1),
(22057, 0, 'dieutrisetting', 'dieutrisetting_post_thumbs_w', '400', 0),
(22058, 0, 'dieutrisetting', 'dieutrisetting_post_thumbs_h', '300', 0),
(22056, 0, 'dieutrisetting', 'dieutrisetting_post_thumb', '0', 0),
(22055, 0, 'dieutrisetting', 'dieutrisetting_share', '0', 0),
(22054, 0, 'dieutrisetting', 'dieutrisetting_post_author', '0', 0),
(22053, 0, 'dieutrisetting', 'dieutrisetting_post_page_view', '0', 0),
(22052, 0, 'dieutrisetting', 'dieutrisetting_post_comments_count', '0', 0),
(22051, 0, 'dieutrisetting', 'dieutrisetting_post_date_added', '0', 0),
(22050, 0, 'dieutrisetting', 'dieutrisetting_author', '0', 0),
(22049, 0, 'dieutrisetting', 'dieutrisetting_page_view', '0', 0),
(22048, 0, 'dieutrisetting', 'dieutrisetting_comments_count', '0', 0),
(22047, 0, 'dieutrisetting', 'dieutrisetting_date_added', '0', 0),
(22046, 0, 'dieutrisetting', 'dieutrisetting_thumbs_h', '300', 0),
(22045, 0, 'dieutrisetting', 'dieutrisetting_thumbs_w', '400', 0),
(22044, 0, 'dieutrisetting', 'dieutrisetting_layout', '3', 0),
(22043, 0, 'dieutrisetting', 'dieutrisetting_dieutris_per_page', '12', 0),
(22042, 0, 'dieutrisetting', 'dieutrisetting_home_meta_keyword', '{\"2\":\"\",\"1\":\"\"}', 1),
(22041, 0, 'dieutrisetting', 'dieutrisetting_home_meta_description', '{\"2\":\"\",\"1\":\"\"}', 1),
(22040, 0, 'dieutrisetting', 'dieutrisetting_home_description', '{\"2\":\"\",\"1\":\"\"}', 1),
(22039, 0, 'dieutrisetting', 'dieutrisetting_home_page_title', '{\"2\":\"\\u0110i\\u1ec1u tr\\u1ecb\",\"1\":\"\\u0110i\\u1ec1u tr\\u1ecb\"}', 1),
(22038, 0, 'dieutrisetting', 'dieutrisetting_home_title', '{\"2\":\"\\u0110i\\u1ec1u tr\\u1ecb\",\"1\":\"\\u0110i\\u1ec1u tr\\u1ecb\"}', 1),
(22059, 0, 'dieutrisetting', 'dieutrisetting_rel_dieutri_per_row', '1', 0),
(22060, 0, 'dieutrisetting', 'dieutrisetting_rel_thumb', '0', 0),
(22061, 0, 'dieutrisetting', 'dieutrisetting_rel_thumbs_w', '400', 0),
(22062, 0, 'dieutrisetting', 'dieutrisetting_rel_thumbs_h', '300', 0),
(22063, 0, 'dieutrisetting', 'dieutrisetting_rel_characters', '100', 0),
(22064, 0, 'dieutrisetting', 'dieutrisetting_comment_per_page', '12', 0),
(22065, 0, 'dieutrisetting', 'dieutrisetting_comment_approve', '0', 0),
(22066, 0, 'dieutrisetting', 'dieutrisetting_comment_notification', '0', 0),
(22067, 0, 'dieutrisetting', 'dieutrisetting_author_change', '0', 0),
(22917, 0, 'blogsetting', 'blogsetting_home_meta_description', '{\"2\":\"\",\"1\":\"\"}', 1),
(22914, 0, 'blogsetting', 'blogsetting_home_title', '{\"2\":\"TIn t\\u1ee9c\",\"1\":\"TIn t\\u1ee9c\"}', 1),
(22915, 0, 'blogsetting', 'blogsetting_home_page_title', '{\"2\":\"TIn t\\u1ee9c\",\"1\":\"TIn t\\u1ee9c\"}', 1),
(22916, 0, 'blogsetting', 'blogsetting_home_description', '{\"2\":\"\",\"1\":\"\"}', 1),
(22526, 0, 'aqe', 'aqe_sales_voucher_themes', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"5\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"vt.voucher_theme_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"image\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"10\",\"align\":\"text-center\",\"type\":\"image_qe\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"name\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"15\",\"align\":\"text-left\",\"type\":\"name_qe\",\"sort\":\"vtd.name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"20\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1),
(22746, 0, 'mlseo', 'mlseo_category_keyword_pattern', '[name], [desc]', 0),
(22745, 0, 'mlseo', 'mlseo_category_title_pattern', '[name]', 0),
(22744, 0, 'mlseo', 'mlseo_category_h3_pattern', '[name]', 0),
(22743, 0, 'mlseo', 'mlseo_category_h2_pattern', '[name]', 0),
(22742, 0, 'mlseo', 'mlseo_category_h1_pattern', '[name]', 0),
(22741, 0, 'mlseo', 'mlseo_category_url_pattern', '[name]', 0),
(22740, 0, 'mlseo', 'mlseo_product_related_relevance', '5', 0),
(22739, 0, 'mlseo', 'mlseo_product_related_no', '5', 0),
(22738, 0, 'mlseo', 'mlseo_product_full_desc_pattern', '[name] - [model] - [category]', 0),
(22737, 0, 'mlseo', 'mlseo_product_tag_pattern', '[name], [model], [category]', 0),
(22736, 0, 'mlseo', 'mlseo_product_image_name_pattern', '[name]', 0),
(22735, 0, 'mlseo', 'mlseo_product_image_title_pattern', '[name]', 0),
(22734, 0, 'mlseo', 'mlseo_product_image_alt_pattern', '[name]', 0),
(22733, 0, 'mlseo', 'mlseo_product_description_pattern', '[name] - [model] - [category] - [desc]', 0),
(22680, 0, 'mlseo', 'mlseo_enabled', '1', 0),
(22681, 0, 'mlseo', 'mlseo_friendly', '1', 0),
(22682, 0, 'mlseo', 'mlseo_absolute', '1', 0),
(22683, 0, 'mlseo', 'mlseo_redirect_dynamic', '1', 0),
(22684, 0, 'mlseo', 'mlseo_redirect_canonical', '1', 0),
(22732, 0, 'mlseo', 'mlseo_product_keyword_pattern', '[name], [model], [category]', 0),
(22731, 0, 'mlseo', 'mlseo_product_title_pattern', '[name] - [model]', 0),
(22730, 0, 'mlseo', 'mlseo_product_h3_pattern', '[name]', 0),
(22729, 0, 'mlseo', 'mlseo_product_h2_pattern', '[name]', 0),
(22728, 0, 'mlseo', 'mlseo_product_h1_pattern', '[name]', 0),
(22727, 0, 'mlseo', 'mlseo_product_url_pattern', '[name]', 0),
(22726, 0, 'mlseo', 'mlseo_fpp_cat_canonical', '', 0),
(22725, 0, 'mlseo', 'mlseo_fpp_directcat', '', 0),
(22724, 0, 'mlseo', 'mlseo_fpp_bc_mode', '0', 0),
(22723, 0, 'mlseo', 'mlseo_fpp_breadcrumbs', '0', 0),
(22722, 0, 'mlseo', 'mlseo_fpp_depth', '0', 0),
(22721, 0, 'mlseo', 'mlseo_fpp_mode', '0', 0),
(22720, 0, 'mlseo', 'mlseo_gpublisher_data', '{\"url\":\"\"}', 1),
(22719, 0, 'mlseo', 'mlseo_tcard_data', '{\"nick\":\"\",\"home_type\":\"summary\",\"desc\":\"1\"}', 1),
(22718, 0, 'mlseo', 'mlseo_opengraph_data', '{\"page_id\":\"\",\"desc\":\"1\"}', 1),
(22717, 0, 'mlseo', 'mlseo_microdata_data', '{\"product\":\"1\",\"model\":\"1\",\"brand\":\"1\",\"reviews\":\"1\",\"organization\":\"1\",\"organization_search\":\"1\",\"contact\":[{\"phone\":\"\",\"type\":\"customer support\"},{\"phone\":\"\",\"type\":\"customer support\"},{\"phone\":\"\",\"type\":\"customer support\"}],\"store\":\"1\",\"store_logo\":\"1\",\"store_mail\":\"1\",\"address_street\":\"\",\"address_city\":\"\",\"address_region\":\"\",\"address_code\":\"\",\"address_country\":\"\",\"same_as\":[\"\",\"\",\"\"],\"pricerange\":\"\",\"website\":\"1\",\"website_search\":\"1\",\"gps_lat\":\"\",\"gps_long\":\"\",\"breadcrumbs\":\"1\"}', 1),
(22716, 0, 'mlseo', 'mlseo_store', '{\"02\":{\"seo_title\":\"\",\"description\":\"\",\"keywords\":\"\",\"title\":\"\",\"h2\":\"\",\"h3\":\"\"},\"01\":{\"seo_title\":\"\",\"description\":\"\",\"keywords\":\"\",\"title\":\"\",\"h2\":\"\",\"h3\":\"\"}}', 1),
(22706, 0, 'mlseo', 'mlseo_insertautoimgtitle', '1', 0),
(22707, 0, 'mlseo', 'mlseo_editautoimgtitle', '1', 0),
(22708, 0, 'mlseo', 'mlseo_insertautoimgalt', '1', 0),
(22709, 0, 'mlseo', 'mlseo_editautoimgalt', '1', 0),
(22710, 0, 'mlseo', 'mlseo_insertautotitle', '1', 0),
(22711, 0, 'mlseo', 'mlseo_canonical', '1', 0),
(22712, 0, 'mlseo', 'mlseo_reviews', '25', 0),
(22713, 0, 'mlseo', 'mlseo_header_lm_product', '1', 0),
(22714, 0, 'mlseo', 'mlseo_header_lm_category', '1', 0),
(22715, 0, 'mlseo', 'mlseo_robots_default', '', 0),
(22705, 0, 'mlseo', 'mlseo_editautometadesc', '1', 0),
(22703, 0, 'mlseo', 'mlseo_editautometakeyword', '1', 0),
(22704, 0, 'mlseo', 'mlseo_insertautometadesc', '1', 0),
(22702, 0, 'mlseo', 'mlseo_insertautometakeyword', '1', 0),
(22701, 0, 'mlseo', 'mlseo_editautoseotitle', '1', 0),
(22700, 0, 'mlseo', 'mlseo_insertautoseotitle', '1', 0),
(22699, 0, 'mlseo', 'mlseo_editautourl', '1', 0),
(22698, 0, 'mlseo', 'mlseo_insertautourl', '1', 0),
(22697, 0, 'mlseo', 'mlseo_ascii_1', '1', 0),
(22696, 0, 'mlseo', 'mlseo_ascii_2', '1', 0),
(22695, 0, 'mlseo', 'mlseo_duplicate', '1', 0),
(22694, 0, 'mlseo', 'mlseo_lowercase', '1', 0),
(22693, 0, 'mlseo', 'mlseo_extension', '', 0),
(22692, 0, 'mlseo', 'mlseo_whitespace', '-', 0),
(22691, 0, 'mlseo', 'mlseo_pagination_fix', '1', 0),
(22689, 0, 'mlseo', 'mlseo_store_mode', '', 0),
(22690, 0, 'mlseo', 'mlseo_hreflang', '1', 0),
(22687, 0, 'mlseo', 'mlseo_flag_mode', '', 0),
(22688, 0, 'mlseo', 'mlseo_flag', '', 0),
(22686, 0, 'mlseo', 'mlseo_banners', '1', 0),
(22685, 0, 'mlseo', 'mlseo_cat_slash', '1', 0),
(22524, 0, 'aqe', 'aqe_customer_customers', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"5\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"c.customer_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"name\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"10\",\"align\":\"text-left\",\"type\":\"name_qe\",\"sort\":\"name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"name\",\"value\":\"customer_id\"}}}},\"email\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"15\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"c.email\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"email\",\"value\":\"customer_id\"}}}},\"telephone\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"20\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"c.telephone\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"fax\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"25\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"c.fax\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"newsletter\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"30\",\"align\":\"text-left\",\"type\":\"yes_no_qe\",\"sort\":\"c.newsletter\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"customer_group\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"35\",\"align\":\"text-left\",\"type\":\"group_qe\",\"sort\":\"customer_group\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"status\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"40\",\"align\":\"text-left\",\"type\":\"status_qe\",\"sort\":\"c.status\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"approved\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"45\",\"align\":\"text-left\",\"type\":\"yes_no_qe\",\"sort\":\"c.approved\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"safe\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"50\",\"align\":\"text-left\",\"type\":\"yes_no_qe\",\"sort\":\"c.safe\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"ip\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"55\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"c.ip\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"date_added\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"60\",\"align\":\"text-left\",\"type\":\"date_qe\",\"sort\":\"c.date_added\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"65\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1),
(22522, 0, 'aqe', 'aqe_marketing_affiliates', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"5\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"a.affiliate_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"name\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"10\",\"align\":\"text-left\",\"type\":\"name_qe\",\"sort\":\"name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"name\",\"value\":\"affiliate_id\"}}}},\"email\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"15\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"a.email\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"email\",\"value\":\"affiliate_id\"}}}},\"telephone\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"20\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"a.telephone\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"fax\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"25\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"a.fax\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"company\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"30\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"a.company\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"address_1\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"35\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"a.address_1\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"address_2\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"40\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"a.address_2\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"city\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"45\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"a.city\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"postcode\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"50\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"a.postcode\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"country\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"55\",\"align\":\"text-left\",\"type\":\"country_qe\",\"sort\":\"country\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"region\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"60\",\"align\":\"text-left\",\"type\":\"region_qe\",\"sort\":\"region\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"tracking_code\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"65\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"a.code\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"commission\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"70\",\"align\":\"text-right\",\"type\":\"number_qe\",\"sort\":\"a.commission\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"tax\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"75\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"a.tax\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"balance\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"80\",\"align\":\"text-right\",\"type\":\"number_qe\",\"sort\":\"balance\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"approved\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"85\",\"align\":\"text-left\",\"type\":\"yes_no_qe\",\"sort\":\"a.approved\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"date_added\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"90\",\"align\":\"text-left\",\"type\":\"date_qe\",\"sort\":\"a.date_added\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"ip\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"95\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"a.ip\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"status\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"100\",\"align\":\"text-left\",\"type\":\"status_qe\",\"sort\":\"a.status\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"105\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1),
(22523, 0, 'aqe', 'aqe_sales_vouchers', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"5\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"v.voucher_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"code\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"10\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"v.code\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"from_name\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"15\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"v.from_name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"from_email\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"20\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"v.from_email\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"to_name\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"25\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"v.to_name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"to_email\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"30\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"v.to_email\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"amount\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"35\",\"align\":\"text-right\",\"type\":\"amount_qe\",\"sort\":\"v.amount\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"theme\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"40\",\"align\":\"text-left\",\"type\":\"theme_qe\",\"sort\":\"theme\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"message\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"45\",\"align\":\"text-left\",\"type\":\"text_qe\",\"sort\":\"\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"status\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"50\",\"align\":\"text-left\",\"type\":\"status_qe\",\"sort\":\"v.status\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"date_added\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"55\",\"align\":\"text-left\",\"type\":\"date_qe\",\"sort\":\"v.date_added\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"60\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1),
(22521, 0, 'aqe', 'aqe_marketing_coupons', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"5\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"c.coupon_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"name\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"10\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"c.name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"code\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"15\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"c.code\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"type\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"20\",\"align\":\"text-left\",\"type\":\"type_qe\",\"sort\":\"c.type\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"total\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"25\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"c.total\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"products\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"30\",\"align\":\"text-left\",\"type\":\"prod_qe\",\"sort\":\"\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"categories\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"35\",\"align\":\"text-left\",\"type\":\"cat_qe\",\"sort\":\"\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"logged\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"40\",\"align\":\"text-left\",\"type\":\"yes_no_qe\",\"sort\":\"c.logged\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"shipping\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"45\",\"align\":\"text-left\",\"type\":\"yes_no_qe\",\"sort\":\"c.shipping\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"discount\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"50\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"c.discount\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"date_start\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"55\",\"align\":\"text-left\",\"type\":\"date_qe\",\"sort\":\"c.date_start\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"date_end\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"60\",\"align\":\"text-left\",\"type\":\"date_qe\",\"sort\":\"c.date_end\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"uses_total\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"65\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"c.uses_total\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"uses_customer\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"70\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"c.uses_customer\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"status\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"75\",\"align\":\"text-left\",\"type\":\"status_qe\",\"sort\":\"c.status\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"80\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1);
INSERT INTO `wbc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(22520, 0, 'aqe', 'aqe_sales_returns', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"5\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"r.return_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"order_id\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"10\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"r.order_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false},\"rel\":[\"date_modified\"]},\"customer_id\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"15\",\"align\":\"text-left\",\"type\":\"customer_qe\",\"sort\":\"customer_name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"full_name\",\"value\":\"customer_id\"}}},\"rel\":[\"date_modified\"]},\"customer\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"20\",\"align\":\"text-left\",\"type\":\"fullname_qe\",\"sort\":\"customer\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"full_name\",\"value\":\"customer_id\"}}},\"rel\":[\"date_modified\"]},\"email\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"25\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"r.email\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false},\"rel\":[\"date_modified\"]},\"telephone\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"30\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"r.telephone\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false},\"rel\":[\"date_modified\"]},\"product_id\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"35\",\"align\":\"text-left\",\"type\":\"product_qe\",\"sort\":\"product_name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"name\",\"value\":\"product_id\"}}},\"rel\":[\"date_modified\"]},\"product\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"40\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"r.product\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"name\",\"value\":\"product_id\"}}},\"rel\":[\"date_modified\"]},\"model\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"45\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"r.model\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false},\"rel\":[\"date_modified\"]},\"quantity\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"50\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"r.quantity\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false},\"rel\":[\"date_modified\"]},\"return_reason\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"55\",\"align\":\"text-left\",\"type\":\"reason_qe\",\"sort\":\"return_reason\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false},\"rel\":[\"date_modified\"]},\"opened\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"60\",\"align\":\"text-left\",\"type\":\"yes_no_qe\",\"sort\":\"r.opened\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false},\"rel\":[\"date_modified\"]},\"comment\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"65\",\"align\":\"text-left\",\"type\":\"text_qe\",\"sort\":\"r.comment\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false},\"rel\":[\"date_modified\"]},\"return_action\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"70\",\"align\":\"text-left\",\"type\":\"action_qe\",\"sort\":\"return_action\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false},\"rel\":[\"date_modified\"]},\"return_status\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"75\",\"align\":\"text-left\",\"type\":\"status_qe\",\"sort\":\"return_status\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false},\"rel\":[\"date_modified\"]},\"date_ordered\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"80\",\"align\":\"text-left\",\"type\":\"date_qe\",\"sort\":\"r.date_ordered\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false},\"rel\":[\"date_modified\"]},\"date_added\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"85\",\"align\":\"text-left\",\"type\":\"date_qe\",\"sort\":\"r.date_added\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false},\"rel\":[\"date_modified\"]},\"date_modified\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"90\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"r.date_modified\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"95\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1),
(22518, 0, 'aqe', 'aqe_sales_orders', '{\"status\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"0\",\"align\":\"text-left\",\"type\":\"status_qe\",\"sort\":\"\"}}', 1),
(22519, 0, 'aqe', 'aqe_catalog_information', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"5\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"i.information_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"title\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"10\",\"align\":\"text-left\",\"type\":\"title_qe\",\"sort\":\"id.title\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"title\",\"value\":\"information_id\"}}}},\"seo\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"15\",\"align\":\"text-left\",\"type\":\"seo_qe\",\"sort\":\"seo\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"seo\",\"value\":\"information_id\"}}}},\"bottom\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"20\",\"align\":\"text-left\",\"type\":\"yes_no_qe\",\"sort\":\"i.bottom\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"store\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"25\",\"align\":\"text-left\",\"type\":\"store_qe\",\"sort\":\"\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"sort_order\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"30\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"i.sort_order\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"status\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"35\",\"align\":\"text-left\",\"type\":\"status_qe\",\"sort\":\"i.status\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"view_in_store\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":40,\"align\":\"text-left\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"45\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1),
(22516, 0, 'aqe', 'aqe_catalog_downloads', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"5\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"d.download_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"name\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"10\",\"align\":\"text-left\",\"type\":\"name_qe\",\"sort\":\"dd.name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"name\",\"value\":\"download_id\"}}}},\"filename\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"15\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"d.filename\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"mask\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"20\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"d.mask\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"date_added\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"25\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"d.date_added\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"30\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1),
(22517, 0, 'aqe', 'aqe_catalog_reviews', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"5\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"r.review_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"product\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"10\",\"align\":\"text-left\",\"type\":\"product_qe\",\"sort\":\"pd.name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"product\",\"value\":\"product_id\"}}},\"rel\":[\"date_modified\"]},\"author\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"15\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"r.author\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false},\"rel\":[\"date_modified\"]},\"text\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"20\",\"align\":\"text-left\",\"type\":\"text_qe\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false},\"rel\":[\"date_modified\"]},\"rating\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"25\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"r.rating\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false},\"rel\":[\"date_modified\"]},\"status\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"30\",\"align\":\"text-left\",\"type\":\"status_qe\",\"sort\":\"r.status\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false},\"rel\":[\"date_modified\"]},\"date_added\":{\"display\":1,\"qe_status\":0,\"editable\":1,\"index\":\"35\",\"align\":\"text-left\",\"type\":\"date_qe\",\"sort\":\"r.date_added\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false},\"rel\":[\"date_modified\"]},\"date_modified\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"40\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"r.date_modified\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"45\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1),
(22514, 0, 'aqe', 'aqe_catalog_filters', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"5\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"fg.filter_group_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"group_name\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"10\",\"align\":\"text-left\",\"type\":\"name_qe\",\"sort\":\"fgd.name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"name\",\"value\":\"filter_group_id\"}}}},\"filter\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"15\",\"align\":\"text-left\",\"type\":\"filter_qe\",\"sort\":\"\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"name\",\"value\":\"filter_id\"}}}},\"sort_order\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"20\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"fg.sort_order\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"25\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1),
(22515, 0, 'aqe', 'aqe_catalog_manufacturers', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"5\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"m.manufacturer_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"image\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"10\",\"align\":\"text-center\",\"type\":\"image_qe\",\"sort\":\"\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"name\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"15\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"m.name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"name\",\"value\":\"manufacturer_id\"}}}},\"seo\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"20\",\"align\":\"text-left\",\"type\":\"seo_qe\",\"sort\":\"seo\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"seo\",\"value\":\"manufacturer_id\"}}}},\"store\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"25\",\"align\":\"text-left\",\"type\":\"store_qe\",\"sort\":\"\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"sort_order\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"30\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"m.sort_order\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"view_in_store\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":35,\"align\":\"text-left\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"40\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1),
(22511, 0, 'aqe', 'aqe_catalog_categories', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"1\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"cp.category_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"image\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"2\",\"align\":\"text-center\",\"type\":\"image_qe\",\"sort\":\"\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"parent\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"4\",\"align\":\"text-left\",\"type\":\"parent_qe\",\"sort\":\"path\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false},\"rel\":[\"name\"]},\"name\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"3\",\"align\":\"text-left\",\"type\":\"name_qe\",\"sort\":\"name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"short_name\",\"value\":\"category_id\"}}}},\"column\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"5\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"c.column\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"top\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"6\",\"align\":\"text-left\",\"type\":\"yes_no_qe\",\"sort\":\"c.top\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"seo\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"7\",\"align\":\"text-left\",\"type\":\"seo_qe\",\"sort\":\"seo\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"seo\",\"value\":\"category_id\"}}}},\"filter\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"8\",\"align\":\"text-left\",\"type\":\"filter_qe\",\"sort\":\"\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"store\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"9\",\"align\":\"text-left\",\"type\":\"store_qe\",\"sort\":\"\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"sort_order\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"10\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"c.sort_order\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"status\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"11\",\"align\":\"text-left\",\"type\":\"status_qe\",\"sort\":\"c.status\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"view_in_store\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":60,\"align\":\"text-left\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"12\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1),
(22512, 0, 'aqe', 'aqe_catalog_attribute_groups', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"5\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"ag.attribute_group_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"name\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"10\",\"align\":\"text-left\",\"type\":\"name_qe\",\"sort\":\"agd.name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"name\",\"value\":\"attribute_group_id\"}}}},\"sort_order\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"15\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"ag.sort_order\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"20\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1),
(22513, 0, 'aqe', 'aqe_catalog_products_actions', '{\"attributes\":{\"display\":1,\"index\":\"0\",\"short\":\"attr\",\"type\":\"attr_qe\",\"class\":\"\",\"rel\":[]},\"discounts\":{\"display\":0,\"index\":\"1\",\"short\":\"dscnt\",\"type\":\"dscnt_qe\",\"class\":\"\",\"rel\":[]},\"images\":{\"display\":1,\"index\":\"2\",\"short\":\"img\",\"type\":\"images_qe\",\"class\":\"\",\"rel\":[]},\"filters\":{\"display\":0,\"index\":\"3\",\"short\":\"fltr\",\"type\":\"filters_qe\",\"class\":\"\",\"rel\":[\"filter\"]},\"options\":{\"display\":1,\"index\":\"4\",\"short\":\"opts\",\"type\":\"option_qe\",\"class\":\"\",\"rel\":[]},\"recurrings\":{\"display\":0,\"index\":\"5\",\"short\":\"rec\",\"type\":\"recur_qe\",\"class\":\"\",\"rel\":[]},\"related\":{\"display\":0,\"index\":\"6\",\"short\":\"rel\",\"type\":\"related_qe\",\"class\":\"\",\"rel\":[]},\"downloads\":{\"display\":0,\"index\":\"7\",\"short\":\"dls\",\"type\":\"dls_qe\",\"class\":\"\",\"rel\":[\"download\"]},\"specials\":{\"display\":0,\"index\":\"8\",\"short\":\"spcl\",\"type\":\"special_qe\",\"class\":\"\",\"rel\":[\"price\"]},\"descriptions\":{\"display\":1,\"index\":\"9\",\"short\":\"desc\",\"type\":\"descr_qe\",\"class\":\"\",\"rel\":[]},\"view\":{\"display\":1,\"index\":\"10\",\"short\":\"vw\",\"type\":\"view\",\"class\":\"\",\"rel\":[]},\"edit\":{\"display\":1,\"index\":\"11\",\"short\":\"ed\",\"type\":\"edit\",\"class\":\"btn-primary\",\"rel\":[]}}', 1),
(22477, 0, 'aqe', 'aqe_alternate_row_colour', '0', 0),
(22478, 0, 'aqe', 'aqe_row_hover_highlighting', '0', 0),
(22479, 0, 'aqe', 'aqe_status', '1', 0),
(22480, 0, 'aqe', 'aqe_match_anywhere', '0', 0),
(22481, 0, 'aqe', 'aqe_installed_version', '5.6.0', 0),
(22482, 0, 'aqe', 'aqe_installed', '1', 0),
(22483, 0, 'aqe', 'aqe_highlight_status', '0', 0),
(22484, 0, 'aqe', 'aqe_interval_filter', '0', 0),
(22485, 0, 'aqe', 'aqe_batch_edit', '0', 0),
(22486, 0, 'aqe', 'aqe_quick_edit_on', 'click', 0),
(22487, 0, 'aqe', 'aqe_list_view_image_width', '40', 0),
(22488, 0, 'aqe', 'aqe_list_view_image_height', '40', 0),
(22489, 0, 'aqe', 'aqe_multilingual_seo', 'language_id', 0),
(22490, 0, 'aqe', 'aqe_single_language_editing', '0', 0),
(22491, 0, 'aqe', 'aqe_catalog_categories_status', '1', 0),
(22492, 0, 'aqe', 'aqe_catalog_products_status', '1', 0),
(22493, 0, 'aqe', 'aqe_catalog_products_filter_sub_category', '0', 0),
(22494, 0, 'aqe', 'aqe_catalog_recurrings_status', '0', 0),
(22495, 0, 'aqe', 'aqe_catalog_filters_status', '0', 0),
(22496, 0, 'aqe', 'aqe_catalog_attributes_status', '0', 0),
(22497, 0, 'aqe', 'aqe_catalog_attribute_groups_status', '0', 0),
(22498, 0, 'aqe', 'aqe_catalog_options_status', '0', 0),
(22499, 0, 'aqe', 'aqe_catalog_manufacturers_status', '0', 0),
(22500, 0, 'aqe', 'aqe_catalog_downloads_status', '0', 0),
(22501, 0, 'aqe', 'aqe_catalog_reviews_status', '0', 0),
(22502, 0, 'aqe', 'aqe_catalog_information_status', '0', 0),
(22503, 0, 'aqe', 'aqe_customer_customers_status', '0', 0),
(22504, 0, 'aqe', 'aqe_sales_orders_status', '0', 0),
(22505, 0, 'aqe', 'aqe_sales_orders_notify_customer', '0', 0),
(22506, 0, 'aqe', 'aqe_sales_returns_status', '0', 0),
(22507, 0, 'aqe', 'aqe_sales_returns_notify_customer', '0', 0),
(22508, 0, 'aqe', 'aqe_catalog_recurrings', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"5\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"r.recurring_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"name\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"10\",\"align\":\"text-left\",\"type\":\"name_qe\",\"sort\":\"rd.name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"sort_order\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"15\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"r.sort_order\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"status\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"20\",\"align\":\"text-left\",\"type\":\"status_qe\",\"sort\":\"r.status\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"price\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"25\",\"align\":\"text-right\",\"type\":\"number_qe\",\"sort\":\"r.price\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"frequency\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"30\",\"align\":\"text-left\",\"type\":\"freq_qe\",\"sort\":\"r.frequency\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"duration\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"35\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"r.duration\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"cycle\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"40\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"r.cycle\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"trial_status\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"45\",\"align\":\"text-left\",\"type\":\"status_qe\",\"sort\":\"r.trial_status\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"trial_price\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"50\",\"align\":\"text-right\",\"type\":\"number_qe\",\"sort\":\"r.trial_price\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"trial_frequency\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"55\",\"align\":\"text-left\",\"type\":\"freq_qe\",\"sort\":\"r.trial_frequency\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"trial_duration\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"60\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"r.trial_duration\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"trial_cycle\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"65\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"r.trial_cycle\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"70\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1),
(22509, 0, 'aqe', 'aqe_catalog_options', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"5\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"o.option_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"name\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"10\",\"align\":\"text-left\",\"type\":\"name_qe\",\"sort\":\"od.name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"name\",\"value\":\"option_id\"}}}},\"type\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"15\",\"align\":\"text-left\",\"type\":\"type_qe\",\"sort\":\"o.type\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false},\"rel\":[\"option_value\"]},\"option_value\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"20\",\"align\":\"text-left\",\"type\":\"opt_val_qe\",\"sort\":\"\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"name\",\"value\":\"option_value_id\"}}}},\"sort_order\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"25\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"o.sort_order\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"30\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1),
(22188, 0, 'category', 'category_status', '1', 0),
(22189, 0, 'manufacturer', 'manufacturer_status', '1', 0),
(22510, 0, 'aqe', 'aqe_catalog_attributes', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"5\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"a.attribute_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"name\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"10\",\"align\":\"text-left\",\"type\":\"name_qe\",\"sort\":\"ad.name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"name\",\"value\":\"attribute_id\"}}}},\"attribute_group\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"15\",\"align\":\"text-left\",\"type\":\"group_qe\",\"sort\":\"attribute_group\",\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"sort_order\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"20\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"a.sort_order\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"25\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1),
(22525, 0, 'aqe', 'aqe_marketing_campaigns', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"5\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"m.marketing_id\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"name\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"10\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"m.name\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"description\":{\"display\":0,\"qe_status\":1,\"editable\":1,\"index\":\"15\",\"align\":\"text-left\",\"type\":\"text_qe\",\"sort\":\"m.description\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"code\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"20\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"m.code\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"clicks\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"25\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"m.clicks\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"orders\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"30\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"orders\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"date_added\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"35\",\"align\":\"text-left\",\"type\":\"date_qe\",\"sort\":\"m.date_added\",\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"40\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1),
(22470, 0, 'aqe', 'aqe_sales_voucher_themes_status', '0', 0),
(22471, 0, 'aqe', 'aqe_sales_vouchers_status', '0', 0),
(22472, 0, 'aqe', 'aqe_marketing_campaigns_status', '0', 0),
(22473, 0, 'aqe', 'aqe_marketing_affiliates_status', '0', 0),
(22474, 0, 'aqe', 'aqe_marketing_coupons_status', '0', 0),
(22475, 0, 'aqe', 'aqe_services', 'W10=', 0),
(22476, 0, 'aqe', 'aqe_catalog_products', '{\"selector\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"0\",\"align\":\"text-center\",\"type\":\"\",\"sort\":\"\",\"rel\":[],\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"id\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"5\",\"align\":\"text-left\",\"type\":\"\",\"sort\":\"p.product_id\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"image\":{\"display\":1,\"qe_status\":0,\"editable\":1,\"index\":\"10\",\"align\":\"text-center\",\"type\":\"image_qe\",\"sort\":\"\",\"rel\":[],\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"category\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"20\",\"align\":\"text-left\",\"type\":\"cat_qe\",\"sort\":\"\",\"rel\":[],\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"manufacturer\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"30\",\"align\":\"text-left\",\"type\":\"manufac_qe\",\"sort\":\"m.name\",\"rel\":[],\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"name\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"40\",\"align\":\"text-left\",\"type\":\"name_qe\",\"sort\":\"pd.name\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"name\",\"value\":\"product_id\"}}}},\"tag\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"50\",\"align\":\"text-left\",\"type\":\"tag_qe\",\"sort\":\"\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"model\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"60\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"p.model\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"model\",\"value\":\"product_id\"}}}},\"price\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"70\",\"align\":\"text-right\",\"type\":\"price_qe\",\"sort\":\"p.price\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"quantity\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"80\",\"align\":\"text-right\",\"type\":\"qty_qe\",\"sort\":\"p.quantity\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"sku\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"90\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"p.sku\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"sku\",\"value\":\"product_id\"}}}},\"upc\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"100\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"p.upc\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"upc\",\"value\":\"product_id\"}}}},\"ean\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"110\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"p.ean\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"ean\",\"value\":\"product_id\"}}}},\"jan\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"120\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"p.jan\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"jan\",\"value\":\"product_id\"}}}},\"isbn\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"130\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"p.isbn\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"isbn\",\"value\":\"product_id\"}}}},\"mpn\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"140\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"p.mpn\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"mpn\",\"value\":\"product_id\"}}}},\"location\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"150\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"p.location\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"location\",\"value\":\"location\"}}}},\"seo\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"160\",\"align\":\"text-left\",\"type\":\"seo_qe\",\"sort\":\"seo\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":{\"return\":{\"label\":\"seo\",\"value\":\"product_id\"}}}},\"tax_class\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"170\",\"align\":\"text-left\",\"type\":\"tax_cls_qe\",\"sort\":\"tc.title\",\"rel\":[],\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"minimum\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"180\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"p.minimum\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"subtract\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"190\",\"align\":\"text-center\",\"type\":\"yes_no_qe\",\"sort\":\"p.subtract\",\"rel\":[],\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"stock_status\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"200\",\"align\":\"text-left\",\"type\":\"stock_qe\",\"sort\":\"ss.name\",\"rel\":[],\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"requires_shipping\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"210\",\"align\":\"text-center\",\"type\":\"yes_no_qe\",\"sort\":\"p.shipping\",\"rel\":[],\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"date_added\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"215\",\"align\":\"text-left\",\"type\":\"datetime_qe\",\"sort\":\"p.date_added\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"date_available\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"220\",\"align\":\"text-left\",\"type\":\"date_qe\",\"sort\":\"p.date_available\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"date_modified\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":\"230\",\"align\":\"text-left\",\"type\":\"datetime_qe\",\"sort\":\"p.date_modified\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"length\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"240\",\"align\":\"text-left\",\"type\":\"qe\",\"sort\":\"p.length\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"width\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"250\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"p.width\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"height\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"260\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"p.height\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"weight\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"270\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"p.weight\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"length_class\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"280\",\"align\":\"text-left\",\"type\":\"length_qe\",\"sort\":\"lc.title\",\"rel\":[],\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"weight_class\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"290\",\"align\":\"text-left\",\"type\":\"weight_qe\",\"sort\":\"wc.title\",\"rel\":[],\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"points\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"300\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"p.points\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"filter\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"310\",\"align\":\"text-left\",\"type\":\"filter_qe\",\"sort\":\"\",\"rel\":[],\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"download\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"320\",\"align\":\"text-left\",\"type\":\"dl_qe\",\"sort\":\"\",\"rel\":[],\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"store\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"330\",\"align\":\"text-left\",\"type\":\"store_qe\",\"sort\":\"\",\"rel\":[],\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"sort_order\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"340\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"p.sort_order\",\"rel\":[],\"filter\":{\"show\":1,\"type\":0,\"autocomplete\":false}},\"status\":{\"display\":1,\"qe_status\":1,\"editable\":1,\"index\":\"350\",\"align\":\"text-center\",\"type\":\"status_qe\",\"sort\":\"p.status\",\"rel\":[],\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"viewed\":{\"display\":0,\"qe_status\":0,\"editable\":1,\"index\":\"360\",\"align\":\"text-right\",\"type\":\"qe\",\"sort\":\"p.viewed\",\"rel\":[],\"filter\":{\"show\":1,\"type\":1,\"autocomplete\":false}},\"view_in_store\":{\"display\":0,\"qe_status\":0,\"editable\":0,\"index\":370,\"align\":\"text-left\",\"type\":\"\",\"sort\":\"\",\"rel\":[],\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}},\"action\":{\"display\":1,\"qe_status\":0,\"editable\":0,\"index\":\"380\",\"align\":\"text-right\",\"type\":\"\",\"sort\":\"\",\"rel\":[],\"filter\":{\"show\":0,\"type\":0,\"autocomplete\":false}}}', 1),
(23037, 0, 'recruitsetting', 'recruitsetting_home_description', '{\"2\":\"&lt;p&gt;T\\u1ea1i GRASSROOTS ph\\u00f2ng kinh doanh s\\u1ebd &amp;nbsp;\\u0111\\u01b0\\u1ee3c l\\u00e0m vi\\u1ec7c trong m\\u00f4i tr\\u01b0\\u1eddng l\\u00e0m vi\\u1ec7c n\\u0103ng \\u0111\\u1ed9ng. C\\u00f4ng ty th\\u01b0\\u1eddng xuy\\u00ean t\\u1ed5 ch\\u1ee9c c\\u00e1c cu\\u1ed9c h\\u1ed9i ngh\\u1ecb v\\u00e0 h\\u1ed9i th\\u1ea3o quy m\\u00f4 trong v\\u00e0 ngo\\u00e0i n\\u01b0\\u1edbc nh\\u1eb1m gi\\u00fap c\\u00e1c b\\u1ea1n c\\u00f3 \\u0111i\\u1ec1u ki\\u1ec7n b\\u1ed3i d\\u01b0\\u1ee1ng n\\u00e2ng cao ki\\u1ebfn th\\u1ee9c, tay ngh\\u1ec1 chuy\\u00ean m\\u00f4n v\\u00e0 c\\u00f3 c\\u01a1 h\\u1ed9i giao l\\u01b0u b\\u1eb1ng ti\\u1ebfng Anh, ti\\u1ebfng Ph\\u00e1p, ti\\u1ebfng Nh\\u1eadt... v\\u1edbi c\\u00e1c \\u0111\\u1ed1i t\\u00e1c n\\u01b0\\u1edbc ngo\\u00e0i.&lt;\\/p&gt;\\r\\n\",\"1\":\"&lt;p&gt;T\\u1ea1i GRASSROOTS ph\\u00f2ng kinh doanh s\\u1ebd &amp;nbsp;\\u0111\\u01b0\\u1ee3c l\\u00e0m vi\\u1ec7c trong m\\u00f4i tr\\u01b0\\u1eddng l\\u00e0m vi\\u1ec7c n\\u0103ng \\u0111\\u1ed9ng. C\\u00f4ng ty th\\u01b0\\u1eddng xuy\\u00ean t\\u1ed5 ch\\u1ee9c c\\u00e1c cu\\u1ed9c h\\u1ed9i ngh\\u1ecb v\\u00e0 h\\u1ed9i th\\u1ea3o quy m\\u00f4 trong v\\u00e0 ngo\\u00e0i n\\u01b0\\u1edbc nh\\u1eb1m gi\\u00fap c\\u00e1c b\\u1ea1n c\\u00f3 \\u0111i\\u1ec1u ki\\u1ec7n b\\u1ed3i d\\u01b0\\u1ee1ng n\\u00e2ng cao ki\\u1ebfn th\\u1ee9c, tay ngh\\u1ec1 chuy\\u00ean m\\u00f4n v\\u00e0 c\\u00f3 c\\u01a1 h\\u1ed9i giao l\\u01b0u b\\u1eb1ng ti\\u1ebfng Anh, ti\\u1ebfng Ph\\u00e1p, ti\\u1ebfng Nh\\u1eadt... v\\u1edbi c\\u00e1c \\u0111\\u1ed1i t\\u00e1c n\\u01b0\\u1edbc ngo\\u00e0i.&lt;\\/p&gt;\\r\\n\"}', 1),
(23036, 0, 'recruitsetting', 'recruitsetting_home_page_title', '{\"2\":\"Tuy\\u1ec3n d\\u1ee5ng\",\"1\":\"Tuy\\u1ec3n d\\u1ee5ng\"}', 1),
(23035, 0, 'recruitsetting', 'recruitsetting_home_title', '{\"2\":\"Tuy\\u1ec3n d\\u1ee5ng\",\"1\":\"Tuy\\u1ec3n d\\u1ee5ng\"}', 1),
(23034, 0, 'recruit_category', 'recruit_category_status', '1', 0),
(23043, 0, 'recruitsetting', 'recruitsetting_thumbs_h', '100', 0),
(23044, 0, 'recruitsetting', 'recruitsetting_date_added', '0', 0),
(23045, 0, 'recruitsetting', 'recruitsetting_comments_count', '0', 0),
(23046, 0, 'recruitsetting', 'recruitsetting_page_view', '0', 0),
(23047, 0, 'recruitsetting', 'recruitsetting_author', '0', 0),
(23048, 0, 'recruitsetting', 'recruitsetting_post_date_added', '0', 0),
(23049, 0, 'recruitsetting', 'recruitsetting_post_comments_count', '0', 0),
(23050, 0, 'recruitsetting', 'recruitsetting_post_page_view', '0', 0),
(23051, 0, 'recruitsetting', 'recruitsetting_post_author', '0', 0),
(23052, 0, 'recruitsetting', 'recruitsetting_share', '0', 0),
(23053, 0, 'recruitsetting', 'recruitsetting_post_thumb', '0', 0),
(23054, 0, 'recruitsetting', 'recruitsetting_post_thumbs_w', '100', 0),
(23055, 0, 'recruitsetting', 'recruitsetting_post_thumbs_h', '100', 0),
(23056, 0, 'recruitsetting', 'recruitsetting_rel_recruit_per_row', '1', 0),
(23057, 0, 'recruitsetting', 'recruitsetting_rel_thumb', '0', 0),
(23058, 0, 'recruitsetting', 'recruitsetting_rel_thumbs_w', '100', 0),
(23059, 0, 'recruitsetting', 'recruitsetting_rel_thumbs_h', '100', 0),
(23060, 0, 'recruitsetting', 'recruitsetting_rel_characters', '100', 0),
(23061, 0, 'recruitsetting', 'recruitsetting_comment_per_page', '10', 0),
(23062, 0, 'recruitsetting', 'recruitsetting_comment_approve', '0', 0),
(23063, 0, 'recruitsetting', 'recruitsetting_comment_notification', '0', 0),
(23064, 0, 'recruitsetting', 'recruitsetting_author_change', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_simple_blog_category`
--

CREATE TABLE `wbc_simple_blog_category` (
  `simple_blog_category_id` int(16) NOT NULL,
  `image` text NOT NULL,
  `parent_id` int(16) NOT NULL,
  `top` tinyint(1) NOT NULL,
  `blog_category_column` int(16) NOT NULL,
  `external_link` text NOT NULL,
  `column` int(8) NOT NULL,
  `sort_order` int(8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_simple_blog_category`
--

INSERT INTO `wbc_simple_blog_category` (`simple_blog_category_id`, `image`, `parent_id`, `top`, `blog_category_column`, `external_link`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(1, '', 0, 0, 2, '', 6, 0, 1, '2015-10-01 09:01:25', '2016-11-28 15:08:29'),
(2, '', 0, 0, 0, '', 5, 0, 1, '2015-10-01 16:12:40', '2017-03-06 16:47:32'),
(3, '', 0, 0, 0, '', 5, 0, 1, '2015-10-01 16:13:05', '2017-04-11 10:32:48'),
(4, '', 0, 0, 0, '', 5, 0, 1, '2015-10-01 16:13:27', '2017-04-11 10:32:41'),
(5, '', 0, 0, 0, '', 5, 0, 1, '2015-10-01 16:45:07', '2017-04-11 10:33:44'),
(6, '', 0, 0, 0, '', 10, 0, 1, '2017-03-31 14:44:19', '2017-03-31 14:44:19');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_simple_blog_category_description`
--

CREATE TABLE `wbc_simple_blog_category_description` (
  `simple_blog_category_description_id` int(16) NOT NULL,
  `simple_blog_category_id` int(16) NOT NULL,
  `language_id` int(16) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(256) NOT NULL,
  `meta_keyword` varchar(256) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_simple_blog_category_description`
--

INSERT INTO `wbc_simple_blog_category_description` (`simple_blog_category_description_id`, `simple_blog_category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES
(51, 1, 1, 'Our Blog', '&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(52, 1, 2, 'Our Blog', '&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(55, 2, 1, 'Demo Category 2', '&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(56, 2, 2, 'Demo Category 2', '&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(59, 6, 1, 'Demo Category 5', '', '', ''),
(60, 6, 2, 'Demo Category 5', '', '', ''),
(63, 4, 1, 'Demo Category 4', '&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(64, 4, 2, 'Demo Category 4', '&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(65, 3, 1, 'Demo Category 3', '&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(66, 3, 2, 'Demo Category 3', '&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(67, 5, 1, 'Demo Category 1', '&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '', ''),
(68, 5, 2, 'Demo Category 1', '&lt;p&gt;&lt;span style=&quot;font-size: 13px; line-height: 22px;&quot;&gt;Ac tincidunt Suspendisse malesuada velit in Nullam elit magnis netus Vestibulum.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_soconfig`
--

CREATE TABLE `wbc_soconfig` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_soconfig`
--

INSERT INTO `wbc_soconfig` (`id`, `store_id`, `key`, `value`, `serialized`) VALUES
(62211, 0, 'soconfig_general_store', '{\"typelayout\":\"7\",\"themecolor\":\"green\",\"preloader\":\"0\",\"preloader_animation\":\"cube-move\",\"imgpreloader\":\"\",\"layouts\":\"1\",\"backtop\":\"1\",\"scroll_animation\":\"1\",\"copyright\":\"Grassroots \\u00a9 2016 - {year}. All Rights Reserved.\",\"typeheader\":\"7\",\"toppanel_status\":\"0\",\"toppanel_type\":\"2\",\"phone_status\":\"1\",\"contact_number\":{\"2\":\"\",\"1\":\"&lt;div class=&quot;contact-us&quot;&gt; Hotline:&lt;a class=&quot;phone&quot; href=&quot;tel:08.3838.6706&quot;&gt;08.3838.6706&lt;\\/a&gt;&lt;a href=&quot;#&quot; target=&quot;_blank&quot;&gt;&lt;i class=&quot;fa fa-google-plus&quot; aria-hidden=&quot;true&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt; \\t\\t\\t\\t\\t\\t\\t\\t\\t\\t&lt;a href=&quot;#&quot; target=&quot;_blank&quot;&gt;&lt;i class=&quot;fa fa-facebook&quot; aria-hidden=&quot;true&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt; \\t\\t\\t\\t\\t\\t\\t\\t\\t\\t&lt;a href=&quot;#&quot; target=&quot;_blank&quot;&gt;&lt;i class=&quot;fa fa-instagram&quot; aria-hidden=&quot;true&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt; &lt;\\/div&gt;\"},\"welcome_message_status\":\"0\",\"welcome_message\":{\"2\":\"\",\"1\":\"Free 3 day delirery and free returns within the US\"},\"wishlist_status\":\"1\",\"checkout_status\":\"1\",\"lang_status\":\"1\",\"typefooter\":\"1\",\"imgpayment_status\":\"1\",\"imgpayment\":\"catalog\\/bocongthuong.png\",\"type_banner\":\"1\",\"contentbg\":\"\"}', 1),
(62212, 0, 'soconfig_advanced_store', '{\"name_color\":\"green\",\"theme_color\":\"#86c654\",\"scsscompile\":\"0\",\"scssformat\":\"Expanded\",\"compileMutiColor\":\"0\",\"minify_css\":\"0\",\"minify_js\":\"0\"}', 1),
(62213, 0, 'soconfig_layout_store', '{\"layoutstyle\":\"full\",\"general_bgcolor\":\"\",\"pattern\":\"none\",\"content_bg_mode\":\"repeat\",\"content_attachment\":\"scroll\"}', 1),
(62214, 0, 'soconfig_pages_store', '{\"product_catalog_refine\":\"0\",\"product_catalog_refine_col_lg\":\"6\",\"product_catalog_refine_col_md\":\"5\",\"product_catalog_refine_col_sm\":\"3\",\"product_catalog_refine_col_xs\":\"1\",\"deals_today\":\"0\",\"lstimg_cate_status\":\"1\",\"product_catalog_mode\":\"0\",\"product_catalog_column_lg\":\"3\",\"product_catalog_column_md\":\"4\",\"product_catalog_column_sm\":\"3\",\"product_catalog_column_xs\":\"2\",\"other_catalog_column_lg\":\"4\",\"other_catalog_column_md\":\"3\",\"other_catalog_column_sm\":\"2\",\"other_catalog_column_xs\":\"2\",\"secondimg\":\"2\",\"rating_status\":\"1\",\"lstdescription_status\":\"0\",\"sale_status\":\"0\",\"sale_text\":{\"2\":\"\",\"1\":\"Sale\"},\"new_status\":\"0\",\"new_text\":{\"2\":\"\",\"1\":\"New\"},\"days\":\"\",\"quick_status\":\"0\",\"quick_view_text\":{\"2\":\"\",\"1\":\"Quick view\"},\"discount_status\":\"0\",\"countdown_status\":\"0\",\"radio_style\":\"1\",\"check_style\":\"1\",\"product_gallerysize\":\"large\",\"thumbnails_position\":\"bottom\",\"product_enablezoom\":\"1\",\"product_zoommode\":\"inner\",\"product_zoomlenssize\":\"250\",\"tabs_position\":\"2\",\"product_page_button\":\"0\",\"product_socialshare\":{\"2\":\"\",\"1\":\"\"},\"related_status\":\"1\",\"related_position\":\"horizontal\",\"product_related_column_lg\":\"4\",\"product_related_column_md\":\"3\",\"product_related_column_sm\":\"2\",\"product_related_column_xs\":\"1\"}', 1),
(62215, 0, 'soconfig_fonts_store', '{\"body_status\":\"standard\",\"normal_body\":\"Arial, Helvetica, sans-serif\",\"url_body\":\"https:\\/\\/fonts.googleapis.com\\/css?family=Open+Sans:400,600,700\",\"family_body\":\"Open Sans, sans-serif;\",\"selector_body\":\"body\",\"menu_status\":\"standard\",\"normal_menu\":\"inherit\",\"url_menu\":\"https:\\/\\/fonts.googleapis.com\\/css?family=Raleway:600,700\",\"family_menu\":\"Raleway, sans-serif;\",\"selector_menu\":\".font-ct, h1, h2, h3, .static-menu a.main-menu, .container-megamenu.vertical .vertical-wrapper ul li &gt; a strong, .container-megamenu.vertical .vertical-wrapper ul.megamenu li .sub-menu .content .static-menu .menu ul li a.main-menu, .horizontal ul.megamenu &gt; li &gt; a, .footertitle, .module h3.modtitle span, .breadcrumb li a, .right-block .caption, .item-title a, .best-seller-custom .item-info, .product-box-desc, .product_page_price .price-new, .list-group-item a\",\"heading_status\":\"standard\",\"normal_heading\":\"inherit\",\"url_heading\":\"\",\"family_heading\":\"\",\"selector_heading\":\"\"}', 1),
(62216, 0, 'soconfig_social_store', '{\"social_fb_status\":\"0\",\"facebook\":\"\",\"social_twitter_status\":\"0\",\"twitter\":\"\",\"social_custom_status\":\"0\",\"video_code\":{\"2\":\"\",\"1\":\"\"}}', 1),
(62217, 0, 'soconfig_custom_store', '{\"cssinput_status\":\"0\",\"custom_css\":\"\",\"cssfile_status\":\"1\",\"cssfile\":[\"catalog\\/view\\/theme\\/so-revo\\/css\\/custom.css\"],\"jsinput_status\":\"0\",\"custom_js\":\"\",\"jsfile_status\":\"0\",\"jsfile\":[\"catalog\\/view\\/theme\\/so-hurama\\/js\\/custom.js\"]}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_so_homeslider`
--

CREATE TABLE `wbc_so_homeslider` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_so_homeslider`
--

INSERT INTO `wbc_so_homeslider` (`id`, `module_id`, `url`, `position`, `image`, `status`) VALUES
(23, 219, '#', 18, 'catalog/demo/slideshow/home4/id4-slide1.jpg', 1),
(22, 206, '#', 17, 'catalog/demo/slideshow/home3/slide3.jpg', 1),
(21, 206, '#', 16, 'catalog/demo/slideshow/home3/slide2.jpg', 1),
(20, 206, '#', 15, 'catalog/demo/slideshow/home3/slide1.jpg', 1),
(19, 195, '#', 14, 'catalog/demo/slideshow/home2/id2-slide3.jpg', 1),
(18, 195, '#', 13, 'catalog/demo/slideshow/home2/id2-slide2.jpg', 1),
(17, 195, '#', 12, 'catalog/demo/slideshow/home2/id2-slide1.jpg', 1),
(16, 194, '#', 11, 'catalog/demo/slideshow/home1/slide3.jpg', 1),
(15, 194, '#', 10, 'catalog/demo/slideshow/home1/slide2.jpg', 1),
(14, 194, '#', 9, 'catalog/demo/slideshow/home1/slide1.jpg', 1),
(13, 158, '#', 8, 'catalog/slideshow/home-v2/02.jpg', 1),
(12, 158, '#', 7, 'catalog/slideshow/home-v2/01.jpg', 1),
(7, 127, '#', 5, 'catalog/slideshow/home-v1/02.jpg', 1),
(8, 127, '#', 6, 'catalog/slideshow/home-v1/03.jpg', 1),
(4, 127, '#', 4, 'catalog/slideshow/home-v1/01.jpg', 1),
(3, 126, '#', 3, 'catalog/slideshow/slider-3.png', 1),
(2, 126, '#', 2, 'catalog/slideshow/slider-2.png', 1),
(1, 126, '#', 1, 'catalog/slideshow/slider-1.png', 1),
(24, 219, '#', 19, 'catalog/demo/slideshow/home4/id4-slide2.jpg', 1),
(25, 219, '#', 20, 'catalog/demo/slideshow/home4/id4-slide3.jpg', 1),
(29, 282, '#', 21, 'catalog/demo/slideshow/home5/slide1-home5.jpg', 1),
(30, 282, '#', 22, 'catalog/demo/slideshow/home5/slide2-home5.jpg', 1),
(31, 296, '#', 23, 'catalog/demo/slideshow/home6/1.jpg', 1),
(32, 296, '#', 24, 'catalog/demo/slideshow/home6/2.jpg', 1),
(33, 296, '#', 25, 'catalog/demo/slideshow/home6/3.jpg', 1),
(34, 301, '#', 26, 'catalog/demo/slideshow/home7/1.jpg', 1),
(35, 301, '#', 27, 'catalog/demo/slideshow/home7/2.jpg', 1),
(36, 301, '#', 28, 'catalog/demo/slideshow/home7/3.jpg', 1),
(37, 312, 'index.php?route=mobile/home', 29, 'catalog/demo-mobile/slider/banner-mobile-1.png', 1),
(38, 312, 'index.php?route=mobile/home', 30, 'catalog/demo-mobile/slider/banner-mobile-2.jpg', 1),
(39, 312, 'index.php?route=mobile/home', 31, 'catalog/demo-mobile/slider/banner-mobile-3.jpg', 1),
(40, 318, '#', 32, 'catalog/demo-mobile/slider/home2/banner-mobile-1.jpg', 1),
(41, 321, '#', 33, 'catalog/demo-mobile/slider/home3/slider3-1.jpg', 1),
(42, 321, '#', 34, 'catalog/demo-mobile/slider/home3/slider3-2.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_so_homeslider_description`
--

CREATE TABLE `wbc_so_homeslider_description` (
  `homeslider_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_so_homeslider_description`
--

INSERT INTO `wbc_so_homeslider_description` (`homeslider_id`, `language_id`, `title`, `caption`, `description`) VALUES
(12, 2, 'Title slider 1', '', '   '),
(12, 1, 'Title slider 1', '', '   '),
(8, 2, 'Title slider 3', '', ' '),
(13, 2, 'Title slider 2', '', '  '),
(7, 2, 'Title slider 2', '', '    '),
(8, 1, 'Title slider 3', '', ' '),
(7, 1, 'Title slider 2', '', '    '),
(4, 2, 'Title slider 1', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;    '),
(4, 1, 'Title slider 1', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;    '),
(3, 2, 'Title slider 1', 'Caption', 'Watch music videos and streaming content in awe-inspiring high definition '),
(3, 1, 'Title slider 1', 'Caption', 'Watch music videos and streaming content in awe-inspiring high definition '),
(2, 2, 'Title slider 1', 'Caption', 'Watch music videos and streaming content in awe-inspiring high definition '),
(2, 1, 'Title slider 2', 'Caption', 'Watch music videos and streaming content in awe-inspiring high definition '),
(1, 2, 'Title slider 1', 'Caption', 'Watch music videos and streaming content in awe-inspiring high definition '),
(1, 1, 'Title slider 1', 'Caption', 'Watch music videos and streaming content in awe-inspiring high definition '),
(13, 1, 'Title slider 2', '', '  '),
(14, 1, 'Slider 1-1', '', '&lt;span class=&quot;title-slider image-sl11 pos-left font-ct&quot;&gt; The Shopping List&lt;/span&gt;\n\n\n\n&lt;div class=&quot;text pos-right text-sl11 font-ct&quot;&gt;\n\n\n\n&lt;h3 class=&quot;tilte modtitle-sl11 &quot;&gt;5 Look We Love&lt;br&gt; This Month&lt;/h3&gt;\n\n\n\n&lt;a class=&quot;des des-sl11&quot; href=&quot;#&quot;&gt;&lt;i class=&quot;fa fa-caret-right&quot;&gt;&lt;/i&gt;see more&lt;/a&gt;      \n\n\n\n&lt;/div&gt;     '),
(14, 2, 'Slider 1-1', '', '&lt;span class=&quot;title-slider image-sl11 pos-left font-ct&quot;&gt; The Shopping List&lt;/span&gt;\n\n\n\n&lt;div class=&quot;text pos-right text-sl11 font-ct&quot;&gt;\n\n\n\n&lt;h3 class=&quot;tilte modtitle-sl11 &quot;&gt;5 Look We Love This Month&lt;/h3&gt;\n\n\n\n&lt;a class=&quot;des des-sl11&quot; href=&quot;#&quot;&gt;&lt;i class=&quot;fa fa-caret-right&quot;&gt;&lt;/i&gt;see more&lt;/a&gt;      \n\n\n\n&lt;/div&gt;     '),
(15, 1, 'Slider 1-2', '', '&lt;div class=&quot;text pos-left text-sl12&quot;&gt;\n\n&lt;a href=&quot;#&quot; class=&quot;des des-sl11&quot;&gt;&lt;i class=&quot;fa fa-caret-right&quot;&gt;&lt;/i&gt;See More&lt;/a&gt;   \n\n\n\n&lt;/div&gt;         '),
(15, 2, 'Slider 1-2', '', '&lt;div class=&quot;text pos-left text-sl12&quot;&gt;\n\n&lt;a href=&quot;#&quot; class=&quot;des des-sl11&quot;&gt;&lt;i class=&quot;fa fa-caret-right&quot;&gt;&lt;/i&gt;See More&lt;/a&gt;   \n\n\n\n&lt;/div&gt;         '),
(16, 1, 'Slider 1-3', '', '&lt;span class=&quot;title-slider image-sl11 pos-left font-ct&quot;&gt; Iphone 6 plus &lt;/span&gt;\n\n\n\n&lt;div class=&quot;text pos-right text-sl11 font-ct&quot;&gt;\n\n\n\n&lt;h3 class=&quot;tilte modtitle-sl11 &quot;&gt;5 Look We Love&lt;br&gt; This Month&lt;/h3&gt;\n\n\n\n&lt;a class=&quot;des des-sl11&quot; href=&quot;#&quot;&gt;&lt;i class=&quot;fa fa-caret-right&quot;&gt;&lt;/i&gt;see more&lt;/a&gt;      \n\n\n\n&lt;/div&gt;      '),
(16, 2, 'Slider 1-3', '', '&lt;span class=&quot;title-slider image-sl11 pos-left font-ct&quot;&gt; Iphone 6 plus &lt;/span&gt;\n\n\n\n&lt;div class=&quot;text pos-right text-sl11 font-ct&quot;&gt;\n\n\n\n&lt;h3 class=&quot;tilte modtitle-sl11 &quot;&gt;5 Look We Love&lt;br&gt; This Month&lt;/h3&gt;\n\n\n\n&lt;a class=&quot;des des-sl11&quot; href=&quot;#&quot;&gt;&lt;i class=&quot;fa fa-caret-right&quot;&gt;&lt;/i&gt;see more&lt;/a&gt;      \n\n\n\n&lt;/div&gt;      '),
(17, 1, 'Slider 2-1', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'),
(29, 2, 'slide1', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'),
(17, 2, 'Slider 2-1', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'),
(29, 1, 'slide1', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'),
(18, 1, 'Slider 2-2', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'),
(18, 2, 'Slider 2-2', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'),
(19, 1, 'Slider 2-3', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'),
(19, 2, 'Slider 2-3', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'),
(20, 1, 'Slider 1-1', '', '&lt;div class=&quot;item-desc-inner font-ct&quot;&gt;\n\n											&lt;h3&gt;FALL AHEAD&lt;/h3&gt; 	&lt;h2&gt;NEW&lt;br&gt;ARRIVALS&lt;/h2&gt;  	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for girls&lt;/a&gt; 	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for boys&lt;/a&gt;										&lt;/div&gt;  '),
(20, 2, 'Slider 1-1', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;  '),
(21, 1, 'slide2', '', '&lt;div class=&quot;item-desc-inner font-ct&quot;&gt;\n\n											&lt;h3&gt;FALL AHEAD&lt;/h3&gt; 	&lt;h2&gt;NEW&lt;br&gt;ARRIVALS&lt;/h2&gt;  	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for girls&lt;/a&gt; 	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for boys&lt;/a&gt;										&lt;/div&gt;  '),
(21, 2, 'slide2', '', '&lt;div class=&quot;item-desc-inner font-ct&quot;&gt;\n\n											&lt;h3&gt;FALL AHEAD&lt;/h3&gt; 	&lt;h2&gt;NEW&lt;br&gt;ARRIVALS&lt;/h2&gt;  	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for girls&lt;/a&gt; 	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for boys&lt;/a&gt;										&lt;/div&gt;  '),
(22, 1, 'slide3', '', '&lt;div class=&quot;item-desc-inner font-ct&quot;&gt;\n\n											&lt;h3&gt;FALL AHEAD&lt;/h3&gt; 	&lt;h2&gt;NEW&lt;br&gt;ARRIVALS&lt;/h2&gt;  	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for girls&lt;/a&gt; 	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for boys&lt;/a&gt;										&lt;/div&gt;  '),
(22, 2, 'slide3', '', '&lt;div class=&quot;item-desc-inner font-ct&quot;&gt;\n\n											&lt;h3&gt;FALL AHEAD&lt;/h3&gt; 	&lt;h2&gt;NEW&lt;br&gt;ARRIVALS&lt;/h2&gt;  	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for girls&lt;/a&gt; 	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for boys&lt;/a&gt;										&lt;/div&gt;  '),
(23, 1, 'slide1', '', '&lt;div class=&quot;item-desc-inner font-ct&quot;&gt;\n\n											&lt;h3&gt;FALL AHEAD&lt;/h3&gt; 	&lt;h2&gt;NEW&lt;br&gt;ARRIVALS&lt;/h2&gt;  	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for girls&lt;/a&gt; 	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for boys&lt;/a&gt;										&lt;/div&gt; '),
(23, 2, 'slide1', '', '&lt;div class=&quot;item-desc-inner font-ct&quot;&gt;\n\n											&lt;h3&gt;FALL AHEAD&lt;/h3&gt; 	&lt;h2&gt;NEW&lt;br&gt;ARRIVALS&lt;/h2&gt;  	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for girls&lt;/a&gt; 	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for boys&lt;/a&gt;										&lt;/div&gt; '),
(24, 1, 'slide2', '', '&lt;div class=&quot;item-desc-inner font-ct&quot;&gt;\n\n											&lt;h3&gt;FALL AHEAD&lt;/h3&gt; 	&lt;h2&gt;NEW&lt;br&gt;ARRIVALS&lt;/h2&gt;  	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for girls&lt;/a&gt; 	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for boys&lt;/a&gt;										&lt;/div&gt;'),
(24, 2, 'slide2', '', '&lt;div class=&quot;item-desc-inner font-ct&quot;&gt;\n\n											&lt;h3&gt;FALL AHEAD&lt;/h3&gt; 	&lt;h2&gt;NEW&lt;br&gt;ARRIVALS&lt;/h2&gt;  	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for girls&lt;/a&gt; 	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for boys&lt;/a&gt;										&lt;/div&gt;'),
(25, 1, 'slide3', '', '&lt;div class=&quot;item-desc-inner font-ct&quot;&gt;\n\n											&lt;h3&gt;FALL AHEAD&lt;/h3&gt; 	&lt;h2&gt;NEW&lt;br&gt;ARRIVALS&lt;/h2&gt;  	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for girls&lt;/a&gt; 	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for boys&lt;/a&gt;										&lt;/div&gt;'),
(25, 2, 'slide3', '', '&lt;div class=&quot;item-desc-inner font-ct&quot;&gt;\n\n											&lt;h3&gt;FALL AHEAD&lt;/h3&gt; 	&lt;h2&gt;NEW&lt;br&gt;ARRIVALS&lt;/h2&gt;  	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for girls&lt;/a&gt; 	&lt;a href=&quot;#&quot; class=&quot;slide-btn&quot;&gt;shop for boys&lt;/a&gt;										&lt;/div&gt;'),
(30, 1, 'slide2', '', ' '),
(30, 2, 'slide2', '', ' '),
(31, 1, 'slide1', '', ' '),
(31, 2, 'slide1', '', ' '),
(32, 1, 'slide2', '', ' '),
(32, 2, 'slide2', '', ' '),
(33, 1, 'slide3', '', ' '),
(33, 2, 'slide3', '', ' '),
(34, 1, 'slide1', '', ' '),
(34, 2, 'slide1', '', ' '),
(35, 1, 'slide2', '', ' '),
(35, 2, 'slide2', '', ' '),
(36, 1, 'slide3', '', ' '),
(36, 2, 'slide3', '', ' '),
(37, 1, 'slider1', '', '   '),
(37, 2, 'slider1', '', '   '),
(38, 1, 'slider2', '', '  '),
(38, 2, 'slider2', '', '  '),
(39, 1, 'slider3', '', '  '),
(39, 2, 'slider3', '', '  '),
(40, 1, 'slider1', '', ' '),
(40, 2, 'slider1', '', ' '),
(41, 1, 'slider1', '', ' '),
(41, 2, 'slide1', '', ' '),
(42, 1, 'slider2', '', ' '),
(42, 2, 'slide2', '', ' ');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_stock_status`
--

CREATE TABLE `wbc_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_stock_status`
--

INSERT INTO `wbc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2-3 Days'),
(7, 2, 'In Stock'),
(8, 2, 'Pre-Order'),
(5, 2, 'Out Of Stock'),
(6, 2, '2-3 Days');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_store`
--

CREATE TABLE `wbc_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_tax_class`
--

CREATE TABLE `wbc_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_tax_class`
--

INSERT INTO `wbc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_tax_rate`
--

CREATE TABLE `wbc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_tax_rate`
--

INSERT INTO `wbc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_tax_rate_to_customer_group`
--

CREATE TABLE `wbc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_tax_rate_to_customer_group`
--

INSERT INTO `wbc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_tax_rule`
--

CREATE TABLE `wbc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_tax_rule`
--

INSERT INTO `wbc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_theme`
--

CREATE TABLE `wbc_theme` (
  `theme_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_translation`
--

CREATE TABLE `wbc_translation` (
  `translation_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_upload`
--

CREATE TABLE `wbc_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_url_404`
--

CREATE TABLE `wbc_url_404` (
  `url_404_id` int(11) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `date_accessed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_url_404`
--

INSERT INTO `wbc_url_404` (`url_404_id`, `query`, `count`, `date_accessed`) VALUES
(25, 'http://grassroots.dev/catalog/view/javascript/jquery/jquery-migrate.min.js', 2, '2017-06-02 04:08:53'),
(26, 'http://grassroots.dev/catalog/view/javascript/wbc_store/images/nophoto.gif', 108, '2017-06-02 07:19:52'),
(27, 'http://grassroots.dev/favicon.ico', 6, '2017-06-02 10:49:32'),
(28, 'http://grassroots.dev/catalog/view/javascript/wbc_store/images/loading_bar.gif', 1, '2017-06-02 04:19:10'),
(29, 'http://grassroots.dev/ban-can-tu-vấan', 1, '2017-06-02 05:20:51'),
(30, 'http://grassroots.dev/admin/view/image/bg-tabs.png', 5, '2017-06-02 07:18:32'),
(31, 'http://grassroots.dev/catalog/view/theme/so-revo/images/i-location.png', 4, '2017-06-02 08:37:42'),
(32, 'http://grassroots.dev/catalog/view/theme/so-revo/images/zoom-out.png', 10, '2017-06-02 08:40:20'),
(33, 'http://grassroots.dev/catalog/view/theme/so-revo/images/zoom-in.png', 10, '2017-06-02 08:40:20'),
(34, 'http://grassroots.dev/catalog/view/theme/shopme/stylesheet/dieutri.css', 42, '2017-06-02 10:22:09'),
(35, 'http://grassroots.dev/catalog/view/theme/shopme/stylesheet/blog.css', 44, '2017-06-02 10:25:22'),
(36, 'http://grassroots.dev/tin-', 1, '2017-06-02 10:19:29'),
(37, 'http://grassroots.dev/tuyen-dung', 1, '2017-06-02 10:25:23'),
(38, 'http://grassroots.dev/catalog/view/javascript/jquery/datetimepicker/locale/vi.js', 19, '2017-06-02 10:51:55'),
(39, 'http://grassroots.dev/image/bg_sub_tuyendung.jpg', 5, '2017-06-02 10:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_url_alias`
--

CREATE TABLE `wbc_url_alias` (
  `url_alias_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_url_alias`
--

INSERT INTO `wbc_url_alias` (`url_alias_id`, `query`, `keyword`, `language_id`) VALUES
(1089, 'route=checkout/voucher', 'voucher', 1),
(1088, 'route=checkout/checkout', 'checkout', 1),
(1030, 'manufacturer_id=8', 'apple', 0),
(1036, 'route=account/account', 'account', 2),
(1037, 'route=account/address', 'account/address', 2),
(1038, 'route=account/download', 'account/download', 2),
(1087, 'route=information/sitemap', 'sitemap', 1),
(1086, 'route=information/contact', 'contact', 1),
(1085, 'route=account/wishlist', 'account/wishlist', 1),
(1084, 'route=account/voucher', 'account/voucher', 1),
(1083, 'route=account/transaction', 'account/transaction', 1),
(1082, 'route=account/reward', 'account/reward', 1),
(1081, 'route=account/return/insert', 'account/return/insert', 1),
(1080, 'route=account/return', 'account/return', 1),
(1079, 'route=account/register', 'account/register', 1),
(1078, 'route=account/password', 'account/password', 1),
(1077, 'route=account/order', 'account/order', 1),
(1076, 'route=account/newsletter', 'account/newsletter', 1),
(1075, 'route=account/logout', 'account/logout', 1),
(1074, 'route=account/login', 'account/login', 1),
(1073, 'route=account/forgotten', 'account/forgotten', 1),
(1072, 'route=account/edit', 'account/edit', 1),
(1071, 'route=account/download', 'account/download', 1),
(1070, 'route=account/address', 'account/address', 1),
(1069, 'route=account/account', 'account', 1),
(1068, 'route=affiliate/transaction', 'affiliate/transaction', 2),
(1031, 'manufacturer_id=9', 'canon', 0),
(1033, 'manufacturer_id=5', 'htc', 0),
(1032, 'manufacturer_id=7', 'hewlett-packard', 0),
(1034, 'manufacturer_id=6', 'palm', 0),
(1035, 'manufacturer_id=10', 'sony', 0),
(1016, 'category_id=33', 'thiết-bị-laser-thẩm-mỹ', 1),
(990, 'dieutri/home', 'dieu-tri', 0),
(1113, 'blog/home', 'tin-tuc-grassroots', 0),
(854, 'blog_id=1', 'entry_keyword', 0),
(849, 'blog_category_id=2', 'entry_keyword2', 0),
(850, 'blog_category_id=3', '', 0),
(1108, 'page_form_id=3', '', 0),
(856, 'product_id=48', 'ipod-classic', 2),
(857, 'product_id=48', 'ipod-classic', 2),
(858, 'product_id=48', 'ipod-classic', 2),
(859, 'product_id=48', 'ipod-classic', 2),
(1042, 'route=account/logout', 'account/logout', 2),
(1043, 'route=account/newsletter', 'account/newsletter', 2),
(998, 'information_id=4', 'about_us', 1),
(1040, 'route=account/forgotten', 'account/forgotten', 2),
(1010, 'category_id=18', 'laptop-notebook', 1),
(1012, 'category_id=25', 'component', 1),
(1048, 'route=account/return/insert', 'account/return/insert', 2),
(1044, 'route=account/order', 'account/order', 2),
(1018, 'category_id=17', 'software', 1),
(1041, 'route=account/login', 'account/login', 2),
(1058, 'route=product/manufacturer', 'manufacturer', 2),
(1052, 'route=account/wishlist', 'account/wishlist', 2),
(1053, 'route=information/contact', 'contact', 2),
(1067, 'route=affiliate/tracking', 'affiliate/tracking', 2),
(1066, 'route=affiliate/register', 'affiliate/register', 2),
(1065, 'route=affiliate/password', 'affiliate/password', 2),
(1039, 'route=account/edit', 'account/edit', 2),
(901, 'product_id=47', 'hp-lp3065', 2),
(902, 'product_id=28', 'htc-touch-hd', 2),
(903, 'product_id=43', 'macbook', 2),
(904, 'product_id=44', 'macbook-air', 2),
(905, 'product_id=45', 'macbook-pro', 2),
(906, 'product_id=31', 'nikon-d300', 2),
(907, 'product_id=29', 'palm-treo-pro', 2),
(908, 'product_id=35', 'product-8', 2),
(909, 'product_id=49', 'samsung-galaxy-tab-10-1', 2),
(910, 'product_id=33', 'samsung-syncmaster-941bw', 2),
(911, 'product_id=46', 'sony-vaio', 2),
(912, 'product_id=41', 'imac', 2),
(913, 'product_id=40', 'iphone', 2),
(914, 'product_id=36', 'ipod-nano', 2),
(915, 'product_id=34', 'ipod-shuffle', 2),
(916, 'product_id=32', 'ipod-touch', 2),
(917, 'information_id=6', 'delivery', 2),
(918, 'information_id=3', 'privacy', 2),
(919, 'information_id=5', 'terms', 2),
(920, 'product_id=48', 'ipod-classic', 2),
(921, 'product_id=48', 'ipod-classic', 2),
(922, 'product_id=48', 'ipod-classic', 2),
(923, 'product_id=48', 'ipod-classic', 1),
(1013, 'category_id=20', 'desktops', 2),
(1014, 'category_id=20', 'desktops', 1),
(997, 'information_id=4', 'gioi-thieu', 2),
(1006, 'product_id=30', 'thâm-quầng-mụn-trứng-cá-giải-pháp-cụ-thể', 1),
(1009, 'category_id=18', 'laptop-notebook', 2),
(1049, 'route=account/reward', 'account/reward', 2),
(1011, 'category_id=25', 'component', 2),
(1047, 'route=account/return', 'account/return', 2),
(1046, 'route=account/register', 'account/register', 2),
(1045, 'route=account/password', 'account/password', 2),
(1017, 'category_id=17', 'software', 2),
(1015, 'category_id=33', 'camera', 2),
(1064, 'route=affiliate/forgotten', 'affiliate/forgotten', 2),
(1063, 'route=affiliate/edit', 'affiliate/edit', 2),
(1062, 'route=affiliate/logout', 'affiliate/logout', 2),
(1061, 'route=affiliate/login', 'affiliate/login', 2),
(1060, 'route=affiliate/account', 'affiliate/account', 2),
(1059, 'route=product/special', 'special', 2),
(1057, 'route=product/compare', 'compare', 2),
(1056, 'route=checkout/voucher', 'voucher', 2),
(1055, 'route=checkout/checkout', 'checkout', 2),
(1054, 'route=information/sitemap', 'sitemap', 2),
(1050, 'route=account/transaction', 'account/transaction', 2),
(1051, 'route=account/voucher', 'account/voucher', 2),
(1005, 'product_id=30', 'canon-eos-5d', 2),
(965, 'product_id=47', 'hp-lp3065', 1),
(966, 'product_id=28', 'htc-touch-hd', 1),
(967, 'product_id=43', 'macbook', 1),
(968, 'product_id=44', 'macbook-air', 1),
(969, 'product_id=45', 'macbook-pro', 1),
(970, 'product_id=31', 'nikon-d300', 1),
(971, 'product_id=29', 'palm-treo-pro', 1),
(972, 'product_id=35', 'product-8', 1),
(973, 'product_id=49', 'samsung-galaxy-tab-10-1', 1),
(974, 'product_id=33', 'samsung-syncmaster-941bw', 1),
(975, 'product_id=46', 'sony-vaio', 1),
(976, 'product_id=41', 'imac', 1),
(977, 'product_id=40', 'iphone', 1),
(978, 'product_id=36', 'ipod-nano', 1),
(979, 'product_id=34', 'ipod-shuffle', 1),
(980, 'product_id=32', 'ipod-touch', 1),
(981, 'information_id=6', 'delivery', 1),
(982, 'information_id=3', 'privacy', 1),
(983, 'information_id=5', 'terms', 1),
(984, 'product_id=48', 'ipod-classic', 1),
(985, 'product_id=48', 'ipod-classic', 1),
(986, 'product_id=48', 'ipod-classic', 1),
(1090, 'route=product/compare', 'compare', 1),
(1091, 'route=product/manufacturer', 'manufacturer', 1),
(1092, 'route=product/special', 'special', 1),
(1093, 'route=affiliate/account', 'affiliate/account', 1),
(1094, 'route=affiliate/login', 'affiliate/login', 1),
(1095, 'route=affiliate/logout', 'affiliate/logout', 1),
(1096, 'route=affiliate/edit', 'affiliate/edit', 1),
(1097, 'route=affiliate/forgotten', 'affiliate/forgotten', 1),
(1098, 'route=affiliate/password', 'affiliate/password', 1),
(1099, 'route=affiliate/register', 'affiliate/register', 1),
(1100, 'route=affiliate/tracking', 'affiliate/tracking', 1),
(1101, 'route=affiliate/transaction', 'affiliate/transaction', 1),
(1102, 'route=information/location', 'agent-system', 1),
(1103, 'route=information/location', 'he-thong-dai-ly', 2),
(1107, 'page_form_id=1', 'ban-can-tu-van', 0),
(1109, 'blog_category_id=49', 'tin-tuc', 0),
(1110, 'blog_category_id=50', 'blog', 0),
(1117, 'recruit/home', 'tuyen-dung', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_url_redirect`
--

CREATE TABLE `wbc_url_redirect` (
  `url_redirect_id` int(11) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `redirect` varchar(1000) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_user`
--

CREATE TABLE `wbc_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_user`
--

INSERT INTO `wbc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'tranbinhcse', '65349f0d2702441c144356cfa8f42e23c2512050', 'RWo50Rw4J', 'John', 'Doe', 'binh@wbc.vn', '', '', '::1', 1, '2017-05-25 11:12:51');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_user_group`
--

CREATE TABLE `wbc_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_user_group`
--

INSERT INTO `wbc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{\"access\":[\"blog\\/blog\",\"blog\\/blog_category\",\"blog\\/blog_comment\",\"blog\\/blog_setting\",\"bts_blog\\/blog\",\"bts_blog\\/category\",\"catalog\\/aqe\\/attribute\",\"catalog\\/aqe\\/attribute_group\",\"catalog\\/aqe\\/category\",\"catalog\\/aqe\\/download\",\"catalog\\/aqe\\/filter\",\"catalog\\/aqe\\/information\",\"catalog\\/aqe\\/manufacturer\",\"catalog\\/aqe\\/option\",\"catalog\\/aqe\\/product\",\"catalog\\/aqe\\/recurring\",\"catalog\\/aqe\\/review\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/mproduct\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/aqe\\/customer\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"dieutri\\/dieutri\",\"dieutri\\/dieutri_category\",\"dieutri\\/dieutri_comment\",\"dieutri\\/dieutri_setting\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/modification_editor\",\"extension\\/module\\/account\",\"extension\\/module\\/admin_quick_edit\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/blog_category\",\"extension\\/module\\/blog_latest\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/ckeditorfull\",\"extension\\/module\\/content_info\",\"extension\\/module\\/currency_switch\",\"extension\\/module\\/dieutri_category\",\"extension\\/module\\/dieutri_latest\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/header\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/language_switch\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/manufacturer\",\"extension\\/module\\/pageform\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pim\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/revslideropencart\",\"extension\\/module\\/revslideroutput\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/simple_blog\",\"extension\\/module\\/simple_blog_category\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/so_basic_products\",\"extension\\/module\\/so_category_slider\",\"extension\\/module\\/so_deals\",\"extension\\/module\\/so_extra_slider\",\"extension\\/module\\/so_filter_shop_by\",\"extension\\/module\\/so_home_slider\",\"extension\\/module\\/so_html_content\",\"extension\\/module\\/so_instagram_gallery\",\"extension\\/module\\/so_latest_blog\",\"extension\\/module\\/so_listing_tabs\",\"extension\\/module\\/so_megamenu\",\"extension\\/module\\/so_newletter_custom_popup\",\"extension\\/module\\/so_onepagecheckout\",\"extension\\/module\\/so_page_builder\",\"extension\\/module\\/so_popular_tags\",\"extension\\/module\\/so_quickview\",\"extension\\/module\\/so_searchpro\",\"extension\\/module\\/so_sociallogin\",\"extension\\/module\\/so_super_category\",\"extension\\/module\\/soconfig\",\"extension\\/module\\/soconfig_mobile\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"feed\\/seopackage_sitemap\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/aqe\\/affiliate\",\"marketing\\/aqe\\/coupon\",\"marketing\\/aqe\\/marketing\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"module\\/complete_seo\",\"module\\/mega_filter\",\"page\\/page_form\",\"page\\/page_request\",\"recruit\\/recruit\",\"recruit\\/recruit_category\",\"recruit\\/recruit_comment\",\"recruit\\/recruit_setting\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/aqe\\/return\",\"sale\\/aqe\\/voucher\",\"sale\\/aqe\\/voucher_theme\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"simple_blog\\/article\",\"simple_blog\\/author\",\"simple_blog\\/category\",\"simple_blog\\/comment\",\"simple_blog\\/install\",\"simple_blog\\/report\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/recruit_category\"],\"modify\":[\"blog\\/blog\",\"blog\\/blog_category\",\"blog\\/blog_comment\",\"blog\\/blog_setting\",\"bts_blog\\/blog\",\"bts_blog\\/category\",\"catalog\\/aqe\\/attribute\",\"catalog\\/aqe\\/attribute_group\",\"catalog\\/aqe\\/category\",\"catalog\\/aqe\\/download\",\"catalog\\/aqe\\/filter\",\"catalog\\/aqe\\/information\",\"catalog\\/aqe\\/manufacturer\",\"catalog\\/aqe\\/option\",\"catalog\\/aqe\\/product\",\"catalog\\/aqe\\/recurring\",\"catalog\\/aqe\\/review\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/mproduct\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\\/column_left\",\"common\\/filemanager\",\"customer\\/aqe\\/customer\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/menu\",\"design\\/theme\",\"design\\/translation\",\"dieutri\\/dieutri\",\"dieutri\\/dieutri_category\",\"dieutri\\/dieutri_comment\",\"dieutri\\/dieutri_setting\",\"event\\/compatibility\",\"event\\/theme\",\"extension\\/analytics\\/google_analytics\",\"extension\\/captcha\\/basic_captcha\",\"extension\\/captcha\\/google_captcha\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/event\",\"extension\\/extension\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/openbaypro\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/modification_editor\",\"extension\\/module\\/account\",\"extension\\/module\\/admin_quick_edit\",\"extension\\/module\\/affiliate\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/blog_category\",\"extension\\/module\\/blog_latest\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/ckeditorfull\",\"extension\\/module\\/content_info\",\"extension\\/module\\/currency_switch\",\"extension\\/module\\/dieutri_category\",\"extension\\/module\\/dieutri_latest\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/ebay_listing\",\"extension\\/module\\/featured\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/header\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/language_switch\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/manufacturer\",\"extension\\/module\\/pageform\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pim\",\"extension\\/module\\/pp_button\",\"extension\\/module\\/pp_login\",\"extension\\/module\\/revslideropencart\",\"extension\\/module\\/revslideroutput\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/simple_blog\",\"extension\\/module\\/simple_blog_category\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/so_basic_products\",\"extension\\/module\\/so_category_slider\",\"extension\\/module\\/so_deals\",\"extension\\/module\\/so_extra_slider\",\"extension\\/module\\/so_filter_shop_by\",\"extension\\/module\\/so_home_slider\",\"extension\\/module\\/so_html_content\",\"extension\\/module\\/so_instagram_gallery\",\"extension\\/module\\/so_latest_blog\",\"extension\\/module\\/so_listing_tabs\",\"extension\\/module\\/so_megamenu\",\"extension\\/module\\/so_newletter_custom_popup\",\"extension\\/module\\/so_onepagecheckout\",\"extension\\/module\\/so_page_builder\",\"extension\\/module\\/so_popular_tags\",\"extension\\/module\\/so_quickview\",\"extension\\/module\\/so_searchpro\",\"extension\\/module\\/so_sociallogin\",\"extension\\/module\\/so_super_category\",\"extension\\/module\\/soconfig\",\"extension\\/module\\/soconfig_mobile\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/openbay\",\"extension\\/openbay\\/amazon\",\"extension\\/openbay\\/amazon_listing\",\"extension\\/openbay\\/amazon_product\",\"extension\\/openbay\\/amazonus\",\"extension\\/openbay\\/amazonus_listing\",\"extension\\/openbay\\/amazonus_product\",\"extension\\/openbay\\/ebay\",\"extension\\/openbay\\/ebay_profile\",\"extension\\/openbay\\/ebay_template\",\"extension\\/openbay\\/etsy\",\"extension\\/openbay\\/etsy_product\",\"extension\\/openbay\\/etsy_shipping\",\"extension\\/openbay\\/etsy_shop\",\"extension\\/openbay\\/fba\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/worldpay\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/citylink\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/store\",\"extension\\/theme\\/theme_default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"feed\\/seopackage_sitemap\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/aqe\\/affiliate\",\"marketing\\/aqe\\/coupon\",\"marketing\\/aqe\\/marketing\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"module\\/complete_seo\",\"module\\/mega_filter\",\"page\\/page_form\",\"page\\/page_request\",\"recruit\\/recruit\",\"recruit\\/recruit_category\",\"recruit\\/recruit_comment\",\"recruit\\/recruit_setting\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/customer_search\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/aqe\\/return\",\"sale\\/aqe\\/voucher\",\"sale\\/aqe\\/voucher_theme\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"simple_blog\\/article\",\"simple_blog\\/author\",\"simple_blog\\/category\",\"simple_blog\\/comment\",\"simple_blog\\/install\",\"simple_blog\\/report\",\"startup\\/compatibility\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/module\\/recruit_category\"]}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_voucher`
--

CREATE TABLE `wbc_voucher` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_voucher_history`
--

CREATE TABLE `wbc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wbc_voucher_theme`
--

CREATE TABLE `wbc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_voucher_theme`
--

INSERT INTO `wbc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_voucher_theme_description`
--

CREATE TABLE `wbc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_voucher_theme_description`
--

INSERT INTO `wbc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General'),
(6, 2, 'Christmas'),
(7, 2, 'Birthday'),
(8, 2, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_weight_class`
--

CREATE TABLE `wbc_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_weight_class`
--

INSERT INTO `wbc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_weight_class_description`
--

CREATE TABLE `wbc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_weight_class_description`
--

INSERT INTO `wbc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz'),
(1, 2, 'Kilogram', 'kg'),
(2, 2, 'Gram', 'g'),
(5, 2, 'Pound ', 'lb'),
(6, 2, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Table structure for table `wbc_zone`
--

CREATE TABLE `wbc_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `location` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_zone`
--

INSERT INTO `wbc_zone` (`zone_id`, `country_id`, `name`, `code`, `location`, `status`) VALUES
(1, 1, 'Quận Ba Đình', '', '21 02 08N, 105 49 38E', 1),
(2, 1, 'Quận Hoàn Kiếm', '', '21 01 53N, 105 51 09E', 1),
(3, 1, 'Quận Tây Hồ', '', '21 04 10N, 105 49 07E', 1),
(4, 1, 'Quận Long Biên', '', '21 02 21N, 105 53 07E', 1),
(5, 1, 'Quận Cầu Giấy', '', '21 01 52N, 105 47 20E', 1),
(6, 1, 'Quận Đống Đa', '', '21 00 56N, 105 49 06E', 1),
(7, 1, 'Quận Hai Bà Trưng', '', '21 00 27N, 105 51 35E', 1),
(8, 1, 'Quận Hoàng Mai', '', '20 58 33N, 105 51 22E', 1),
(9, 1, 'Quận Thanh Xuân', '', '20 59 44N, 105 48 56E', 1),
(16, 1, 'Huyện Sóc Sơn', '', '21 16 55N, 105 49 46E', 1),
(17, 1, 'Huyện Đông Anh', '', '21 08 16N, 105 49 38E', 1),
(18, 1, 'Huyện Gia Lâm', '', '21 01 28N, 105 56 54E', 1),
(19, 1, 'Huyện Từ Liêm', '', '21 02 39N, 105 45 32E', 1),
(20, 1, 'Huyện Thanh Trì', '', '20 56 32N, 105 50 55E', 1),
(24, 2, 'Thị Xã Hà Giang', '', '22 46 23N, 105 02 39E', 1),
(26, 2, 'Huyện Đồng Văn', '', '23 14 34N, 105 15 48E', 1),
(27, 2, 'Huyện Mèo Vạc', '', '23 09 10N, 105 26 38E', 1),
(28, 2, 'Huyện Yên Minh', '', '23 04 20N, 105 10 13E', 1),
(29, 2, 'Huyện Quản Bạ', '', '23 04 03N, 104 58 05E', 1),
(30, 2, 'Huyện Vị Xuyên', '', '22 45 50N, 104 56 26E', 1),
(31, 2, 'Huyện Bắc Mê', '', '22 45 48N, 105 16 26E', 1),
(32, 2, 'Huyện Hoàng Su Phì', '', '22 41 37N, 104 40 06E', 1),
(33, 2, 'Huyện Xín Mần', '', '22 38 05N, 104 28 35E', 1),
(34, 2, 'Huyện Bắc Quang', '', '22 23 42N, 104 55 06E', 1),
(35, 2, 'Huyện Quang Bình', '', '22 23 07N, 104 37 11E', 1),
(40, 4, 'Thị Xã Cao Bằng', '', '22 39 20N, 106 15 20E', 1),
(42, 4, 'Huyện Bảo Lâm', '', '22 52 37N, 105 27 28E', 1),
(43, 4, 'Huyện Bảo Lạc', '', '22 52 31N, 105 42 41E', 1),
(44, 4, 'Huyện Thông Nông', '', '22 49 09N, 105 57 05E', 1),
(45, 4, 'Huyện Hà Quảng', '', '22 53 42N, 106 06 32E', 1),
(46, 4, 'Huyện Trà Lĩnh', '', '22 48 14N, 106 19 47E', 1),
(47, 4, 'Huyện Trùng Khánh', '', '22 49 31N, 106 33 58E', 1),
(48, 4, 'Huyện Hạ Lang', '', '22 42 37N, 106 41 42E', 1),
(49, 4, 'Huyện Quảng Uyên', '', '22 40 15N, 106 27 42E', 1),
(50, 4, 'Huyện Phục Hoà', '', '22 33 52N, 106 30 02E', 1),
(51, 4, 'Huyện Hoà An', '', '22 41 20N, 106 02 05E', 1),
(52, 4, 'Huyện Nguyên Bình', '', '22 38 52N, 105 57 02E', 1),
(53, 4, 'Huyện Thạch An', '', '22 28 51N, 106 19 51E', 1),
(58, 6, 'Thị Xã Bắc Kạn', '', '22 08 00N, 105 51 10E', 1),
(60, 6, 'Huyện Pác Nặm', '', '22 35 46N, 105 40 25E', 1),
(61, 6, 'Huyện Ba Bể', '', '22 23 54N, 105 43 30E', 1),
(62, 6, 'Huyện Ngân Sơn', '', '22 25 50N, 106 01 00E', 1),
(63, 6, 'Huyện Bạch Thông', '', '22 12 04N, 105 51 01E', 1),
(64, 6, 'Huyện Chợ Đồn', '', '22 11 18N, 105 34 43E', 1),
(65, 6, 'Huyện Chợ Mới', '', '21 57 56N, 105 51 29E', 1),
(66, 6, 'Huyện Na Rì', '', '22 09 48N, 106 05 09E', 1),
(70, 8, 'Thị Xã Tuyên Quang', '', '21 49 40N, 105 13 12E', 1),
(72, 8, 'Huyện Nà Hang', '', '22 28 34N, 105 21 03E', 1),
(73, 8, 'Huyện Chiêm Hóa', '', '22 12 49N, 105 14 32E', 1),
(74, 8, 'Huyện Hàm Yên', '', '22 05 46N, 105 00 13E', 1),
(75, 8, 'Huyện Yên Sơn', '', '21 51 53N, 105 18 14E', 1),
(76, 8, 'Huyện Sơn Dương', '', '21 40 22N, 105 22 57E', 1),
(80, 10, 'Thành Phố Lào Cai', '', '22 25 07N, 103 58 43E', 1),
(82, 10, 'Huyện Bát Xát', '', '22 35 50N, 103 44 49E', 1),
(83, 10, 'Huyện Mường Khương', '', '22 41 05N, 104 08 26E', 1),
(84, 10, 'Huyện Si Ma Cai', '', '22 39 46N, 104 16 05E', 1),
(85, 10, 'Huyện Bắc Hà', '', '22 30 08N, 104 18 54E', 1),
(86, 10, 'Huyện Bảo Thắng', '', '22 22 47N, 104 10 00E', 1),
(87, 10, 'Huyện Bảo Yên', '', '22 17 38N, 104 25 02E', 1),
(88, 10, 'Huyện Sa Pa', '', '22 18 54N, 103 54 18E', 1),
(89, 10, 'Huyện Văn Bàn', '', '22 03 48N, 104 10 59E', 1),
(94, 11, 'Thành Phố Điện Biên Phủ', '', '21 24 52N, 103 02 31E', 1),
(95, 11, 'Thị Xã Mường Lay', '', '22 01 47N, 103 07 10E', 1),
(96, 11, 'Huyện Mường Nhé', '', '22 06 11N, 102 30 54E', 1),
(97, 11, 'Huyện Mường Chà', '', '21 50 31N, 103 03 15E', 1),
(98, 11, 'Huyện Tủa Chùa', '', '21 58 19N, 103 23 01E', 1),
(99, 11, 'Huyện Tuần Giáo', '', '21 38 03N, 103 21 06E', 1),
(100, 11, 'Huyện Điện Biên', '', '21 15 19N, 103 03 19E', 1),
(101, 11, 'Huyện Điện Biên Đông', '', '21 14 07N, 103 15 19E', 1),
(102, 11, 'Huyện Mường Ảng', '', '', 1),
(104, 12, 'Thị Xã Lai Châu', '', '22 23 15N, 103 24 22E', 1),
(106, 12, 'Huyện Tam Đường', '', '22 20 16N, 103 32 53E', 1),
(107, 12, 'Huyện Mường Tè', '', '22 24 16N, 102 43 11E', 1),
(108, 12, 'Huyện Sìn Hồ', '', '22 17 21N, 103 18 12E', 1),
(109, 12, 'Huyện Phong Thổ', '', '22 38 24N, 103 22 38E', 1),
(110, 12, 'Huyện Than Uyên', '', '21 59 35N, 103 45 30E', 1),
(111, 12, 'Huyện Tân Uyên', '', '', 1),
(116, 14, 'Thành Phố Sơn La', '', '21 20 39N, 103 54 52E', 1),
(118, 14, 'Huyện Quỳnh Nhai', '', '21 46 34N, 103 39 02E', 1),
(119, 14, 'Huyện Thuận Châu', '', '21 24 54N, 103 39 46E', 1),
(120, 14, 'Huyện Mường La', '', '21 31 38N, 104 02 48E', 1),
(121, 14, 'Huyện Bắc Yên', '', '21 13 23N, 104 22 09E', 1),
(122, 14, 'Huyện Phù Yên', '', '21 13 33N, 104 41 51E', 1),
(123, 14, 'Huyện Mộc Châu', '', '20 49 21N, 104 43 10E', 1),
(124, 14, 'Huyện Yên Châu', '', '20 59 33N, 104 19 51E', 1),
(125, 14, 'Huyện Mai Sơn', '', '21 10 08N, 103 59 36E', 1),
(126, 14, 'Huyện Sông Mã', '', '21 06 04N, 103 43 56E', 1),
(127, 14, 'Huyện Sốp Cộp', '', '20 52 46N, 103 30 38E', 1),
(132, 15, 'Thành Phố Yên Bái', '', '21 44 28N, 104 53 42E', 1),
(133, 15, 'Thị Xã Nghĩa Lộ', '', '21 35 58N, 104 29 22E', 1),
(135, 15, 'Huyện Lục Yên', '', '22 06 44N, 104 43 12E', 1),
(136, 15, 'Huyện Văn Yên', '', '21 55 55N, 104 33 51E', 1),
(137, 15, 'Huyện Mù Cang Chải', '', '21 48 22N, 104 09 01E', 1),
(138, 15, 'Huyện Trấn Yên', '', '21 42 20N, 104 48 56E', 1),
(139, 15, 'Huyện Trạm Tấu', '', '21 30 40N, 104 28 03E', 1),
(140, 15, 'Huyện Văn Chấn', '', '21 34 15N, 104 35 19E', 1),
(141, 15, 'Huyện Yên Bình', '', '21 52 24N, 104 55 16E', 1),
(148, 17, 'Thành Phố Hòa Bình', '', '20 50 36N, 105 19 20E', 1),
(150, 17, 'Huyện Đà Bắc', '', '20 55 58N, 105 04 52E', 1),
(151, 17, 'Huyện Kỳ Sơn', '', '20 54 06N, 105 23 18E', 1),
(152, 17, 'Huyện Lương Sơn', '', '20 53 16N, 105 30 55E', 1),
(153, 17, 'Huyện Kim Bôi', '', '20 40 34N, 105 32 15E', 1),
(154, 17, 'Huyện Cao Phong', '', '20 41 23N, 105 17 48E', 1),
(155, 17, 'Huyện Tân Lạc', '', '20 36 44N, 105 15 03E', 1),
(156, 17, 'Huyện Mai Châu', '', '20 40 56N, 104 59 46E', 1),
(157, 17, 'Huyện Lạc Sơn', '', '20 29 59N, 105 24 57E', 1),
(158, 17, 'Huyện Yên Thủy', '', '20 25 42N, 105 37 59E', 1),
(159, 17, 'Huyện Lạc Thủy', '', '20 29 12N, 105 44 06E', 1),
(164, 19, 'Thành Phố Thái Nguyên', '', '21 33 20N, 105 48 26E', 1),
(165, 19, 'Thị Xã Sông Công', '', '21 29 14N, 105 48 47E', 1),
(167, 19, 'Huyện Định Hóa', '', '21 53 50N, 105 38 01E', 1),
(168, 19, 'Huyện Phú Lương', '', '21 45 57N, 105 43 22E', 1),
(169, 19, 'Huyện Đồng Hỷ', '', '21 41 10N, 105 55 43E', 1),
(170, 19, 'Huyện Võ Nhai', '', '21 47 14N, 106 02 29E', 1),
(171, 19, 'Huyện Đại Từ', '', '21 36 17N, 105 37 28E', 1),
(172, 19, 'Huyện Phổ Yên', '', '21 27 08N, 105 45 19E', 1),
(173, 19, 'Huyện Phú Bình', '', '21 29 36N, 105 57 42E', 1),
(178, 20, 'Thành Phố Lạng Sơn', '', '21 51 19N, 106 44 50E', 1),
(180, 20, 'Huyện Tràng Định', '', '22 18 09N, 106 26 32E', 1),
(181, 20, 'Huyện Bình Gia', '', '22 03 56N, 106 19 01E', 1),
(182, 20, 'Huyện Văn Lãng', '', '22 01 59N, 106 34 17E', 1),
(183, 20, 'Huyện Cao Lộc', '', '21 53 05N, 106 50 34E', 1),
(184, 20, 'Huyện Văn Quan', '', '21 51 04N, 106 33 04E', 1),
(185, 20, 'Huyện Bắc Sơn', '', '21 48 57N, 106 15 28E', 1),
(186, 20, 'Huyện Hữu Lũng', '', '21 34 33N, 106 20 33E', 1),
(187, 20, 'Huyện Chi Lăng', '', '21 40 05N, 106 37 24E', 1),
(188, 20, 'Huyện Lộc Bình', '', '21 40 41N, 106 58 12E', 1),
(189, 20, 'Huyện Đình Lập', '', '21 32 07N, 107 07 25E', 1),
(193, 22, 'Thành Phố Hạ Long', '', '20 52 24N, 107 05 23E', 1),
(194, 22, 'Thành Phố Móng Cái', '', '21 26 31N, 107 55 09E', 1),
(195, 22, 'Thị Xã Cẩm Phả', '', '21 03 42N, 107 17 22E', 1),
(196, 22, 'Thị Xã Uông Bí', '', '21 04 33N, 106 45 07E', 1),
(198, 22, 'Huyện Bình Liêu', '', '21 33 07N, 107 26 24E', 1),
(199, 22, 'Huyện Tiên Yên', '', '21 22 24N, 107 22 50E', 1),
(200, 22, 'Huyện Đầm Hà', '', '21 21 23N, 107 34 32E', 1),
(201, 22, 'Huyện Hải Hà', '', '21 25 50N, 107 41 26E', 1),
(202, 22, 'Huyện Ba Chẽ', '', '21 15 40N, 107 09 52E', 1),
(203, 22, 'Huyện Vân Đồn', '', '20 56 17N, 107 28 02E', 1),
(204, 22, 'Huyện Hoành Bồ', '', '21 06 30N, 107 02 43E', 1),
(205, 22, 'Huyện Đông Triều', '', '21 07 10N, 106 34 36E', 1),
(206, 22, 'Huyện Yên Hưng', '', '20 55 40N, 106 51 05E', 1),
(207, 22, 'Huyện Cô Tô', '', '21 05 01N, 107 49 10E', 1),
(213, 24, 'Thành Phố Bắc Giang', '', '21 17 36N, 106 11 18E', 1),
(215, 24, 'Huyện Yên Thế', '', '21 31 29N, 106 09 27E', 1),
(216, 24, 'Huyện Tân Yên', '', '21 23 23N, 106 05 55E', 1),
(217, 24, 'Huyện Lạng Giang', '', '21 21 58N, 106 15 21E', 1),
(218, 24, 'Huyện Lục Nam', '', '21 18 16N, 106 29 24E', 1),
(219, 24, 'Huyện Lục Ngạn', '', '21 26 15N, 106 39 09E', 1),
(220, 24, 'Huyện Sơn Động', '', '21 19 42N, 106 51 09E', 1),
(221, 24, 'Huyện Yên Dũng', '', '21 12 22N, 106 14 12E', 1),
(222, 24, 'Huyện Việt Yên', '', '21 16 16N, 106 04 59E', 1),
(223, 24, 'Huyện Hiệp Hòa', '', '21 15 51N, 105 57 30E', 1),
(227, 25, 'Thành Phố Việt Trì', '', '21 19 01N, 105 23 35E', 1),
(228, 25, 'Thị Xã Phú Thọ', '', '21 24 54N, 105 13 46E', 1),
(230, 25, 'Huyện Đoan Hùng', '', '21 36 56N, 105 08 42E', 1),
(231, 25, 'Huyện Hạ Hoà', '', '21 35 13N, 105 00 22E', 1),
(232, 25, 'Huyện Thanh Ba', '', '21 27 04N, 105 09 10E', 1),
(233, 25, 'Huyện Phù Ninh', '', '21 26 59N, 105 18 13E', 1),
(234, 25, 'Huyện Yên Lập', '', '21 22 21N, 105 01 25E', 1),
(235, 25, 'Huyện Cẩm Khê', '', '21 23 04N, 105 05 25E', 1),
(236, 25, 'Huyện Tam Nông', '', '21 18 24N, 105 14 59E', 1),
(237, 25, 'Huyện Lâm Thao', '', '21 19 37N, 105 18 09E', 1),
(238, 25, 'Huyện Thanh Sơn', '', '21 08 32N, 105 04 40E', 1),
(239, 25, 'Huyện Thanh Thuỷ', '', '21 07 26N, 105 17 18E', 1),
(240, 25, 'Huyện Tân Sơn', '', '', 1),
(243, 26, 'Thành Phố Vĩnh Yên', '', '21 18 26N, 105 35 33E', 1),
(244, 26, 'Thị Xã Phúc Yên', '', '21 18 55N, 105 43 54E', 1),
(246, 26, 'Huyện Lập Thạch', '', '21 24 45N, 105 25 39E', 1),
(247, 26, 'Huyện Tam Dương', '', '21 21 40N, 105 33 36E', 1),
(248, 26, 'Huyện Tam Đảo', '', '21 27 34N, 105 35 09E', 1),
(249, 26, 'Huyện Bình Xuyên', '', '21 19 48N, 105 39 43E', 1),
(250, 1, 'Huyện Mê Linh', '', '21 10 53N, 105 42 05E', 1),
(251, 26, 'Huyện Yên Lạc', '', '21 13 17N, 105 34 44E', 1),
(252, 26, 'Huyện Vĩnh Tường', '', '21 14 58N, 105 29 37E', 1),
(253, 26, 'Huyện Sông Lô', '', '', 1),
(256, 27, 'Thành Phố Bắc Ninh', '', '21 10 48N, 106 03 58E', 1),
(258, 27, 'Huyện Yên Phong', '', '21 12 40N, 105 59 36E', 1),
(259, 27, 'Huyện Quế Võ', '', '21 08 44N, 106 11 06E', 1),
(260, 27, 'Huyện Tiên Du', '', '21 07 37N, 106 02 19E', 1),
(261, 27, 'Thị Xã Từ Sơn', '', '21 07 12N, 105 57 26E', 1),
(262, 27, 'Huyện Thuận Thành', '', '21 02 24N, 106 04 10E', 1),
(263, 27, 'Huyện Gia Bình', '', '21 03 55N, 106 12 53E', 1),
(264, 27, 'Huyện Lương Tài', '', '21 01 33N, 106 13 28E', 1),
(268, 1, 'Quận Hà Đông', '', '20 57 25N, 105 45 21E', 1),
(269, 1, 'Thị Xã Sơn Tây', '', '21 05 51N, 105 28 27E', 1),
(271, 1, 'Huyện Ba Vì', '', '21 09 40N, 105 22 43E', 1),
(272, 1, 'Huyện Phúc Thọ', '', '21 06 32N, 105 34 52E', 1),
(273, 1, 'Huyện Đan Phượng', '', '21 07 13N, 105 40 49E', 1),
(274, 1, 'Huyện Hoài Đức', '', '21 01 25N, 105 42 03E', 1),
(275, 1, 'Huyện Quốc Oai', '', '20 58 45N, 105 36 43E', 1),
(276, 1, 'Huyện Thạch Thất', '', '21 02 17N, 105 33 05E', 1),
(277, 1, 'Huyện Chương Mỹ', '', '20 52 46N, 105 39 01E', 1),
(278, 1, 'Huyện Thanh Oai', '', '20 51 44N, 105 46 18E', 1),
(279, 1, 'Huyện Thường Tín', '', '20 49 59N, 105 22 19E', 1),
(280, 1, 'Huyện Phú Xuyên', '', '20 43 37N, 105 53 43E', 1),
(281, 1, 'Huyện Ứng Hòa', '', '20 42 41N, 105 47 58E', 1),
(282, 1, 'Huyện Mỹ Đức', '', '20 41 53N, 105 43 31E', 1),
(288, 30, 'Thành Phố Hải Dương', '', '20 56 14N, 106 18 21E', 1),
(290, 30, 'Huyện Chí Linh', '', '21 07 47N, 106 23 46E', 1),
(291, 30, 'Huyện Nam Sách', '', '21 00 15N, 106 20 26E', 1),
(292, 30, 'Huyện Kinh Môn', '', '21 00 04N, 106 30 23E', 1),
(293, 30, 'Huyện Kim Thành', '', '20 55 40N, 106 30 33E', 1),
(294, 30, 'Huyện Thanh Hà', '', '20 53 19N, 106 25 43E', 1),
(295, 30, 'Huyện Cẩm Giàng', '', '20 57 05N, 106 12 29E', 1),
(296, 30, 'Huyện Bình Giang', '', '20 52 36N, 106 11 24E', 1),
(297, 30, 'Huyện Gia Lộc', '', '20 51 01N, 106 17 34E', 1),
(298, 30, 'Huyện Tứ Kỳ', '', '20 49 05N, 106 24 05E', 1),
(299, 30, 'Huyện Ninh Giang', '', '20 45 13N, 106 20 09E', 1),
(300, 30, 'Huyện Thanh Miện', '', '20 46 02N, 106 12 26E', 1),
(303, 31, 'Quận Hồng Bàng', '', '20 52 37N, 106 38 32E', 1),
(304, 31, 'Quận Ngô Quyền', '', '20 51 13N, 106 41 57E', 1),
(305, 31, 'Quận Lê Chân', '', '20 50 12N, 106 40 30E', 1),
(306, 31, 'Quận Hải An', '', '20 49 38N, 106 45 57E', 1),
(307, 31, 'Quận Kiến An', '', '20 48 26N, 106 38 03E', 1),
(308, 31, 'Quận Đồ Sơn', '', '20 42 41N, 106 44 54E', 1),
(309, 31, 'Quận Kinh Dương', '', '', 1),
(311, 31, 'Huyện Thuỷ Nguyên', '', '20 56 36N, 106 39 38E', 1),
(312, 31, 'Huyện An Dương', '', '20 53 06N, 106 35 36E', 1),
(313, 31, 'Huyện An Lão', '', '20 47 54N, 106 33 19E', 1),
(314, 31, 'Huyện Kiến Thụy', '', '20 45 13N, 106 41 47E', 1),
(315, 31, 'Huyện Tiên Lãng', '', '20 42 23N, 106 36 03E', 1),
(316, 31, 'Huyện Vĩnh Bảo', '', '20 40 56N, 106 29 57E', 1),
(317, 31, 'Huyện Cát Hải', '', '20 47 09N, 106 58 07E', 1),
(318, 31, 'Huyện Bạch Long Vĩ', '', '20 08 41N, 107 42 51E', 1),
(323, 33, 'Thành Phố Hưng Yên', '', '20 39 38N, 106 03 08E', 1),
(325, 33, 'Huyện Văn Lâm', '', '20 58 31N, 106 02 51E', 1),
(326, 33, 'Huyện Văn Giang', '', '20 55 51N, 105 57 14E', 1),
(327, 33, 'Huyện Yên Mỹ', '', '20 53 45N, 106 01 21E', 1),
(328, 33, 'Huyện Mỹ Hào', '', '20 55 35N, 106 05 34E', 1),
(329, 33, 'Huyện Ân Thi', '', '20 48 49N, 106 05 30E', 1),
(330, 33, 'Huyện Khoái Châu', '', '20 49 53N, 105 58 28E', 1),
(331, 33, 'Huyện Kim Động', '', '20 44 47N, 106 01 47E', 1),
(332, 33, 'Huyện Tiên Lữ', '', '20 40 05N, 106 07 59E', 1),
(333, 33, 'Huyện Phù Cừ', '', '20 42 51N, 106 11 30E', 1),
(336, 34, 'Thành Phố Thái Bình', '', '20 26 45N, 106 19 56E', 1),
(338, 34, 'Huyện Quỳnh Phụ', '', '20 38 57N, 106 21 16E', 1),
(339, 34, 'Huyện Hưng Hà', '', '20 35 38N, 106 12 42E', 1),
(340, 34, 'Huyện Đông Hưng', '', '20 32 50N, 106 20 15E', 1),
(341, 34, 'Huyện Thái Thụy', '', '20 32 33N, 106 32 32E', 1),
(342, 34, 'Huyện Tiền Hải', '', '20 21 05N, 106 32 45E', 1),
(343, 34, 'Huyện Kiến Xương', '', '20 23 52N, 106 25 22E', 1),
(344, 34, 'Huyện Vũ Thư', '', '20 25 29N, 106 16 43E', 1),
(347, 35, 'Thành Phố Phủ Lý', '', '20 32 19N, 105 54 55E', 1),
(349, 35, 'Huyện Duy Tiên', '', '20 37 33N, 105 58 01E', 1),
(350, 35, 'Huyện Kim Bảng', '', '20 34 19N, 105 50 41E', 1),
(351, 35, 'Huyện Thanh Liêm', '', '20 27 31N, 105 55 09E', 1),
(352, 35, 'Huyện Bình Lục', '', '20 29 23N, 106 02 52E', 1),
(353, 35, 'Huyện Lý Nhân', '', '20 32 55N, 106 04 48E', 1),
(356, 36, 'Thành Phố Nam Định', '', '20 25 07N, 106 09 54E', 1),
(358, 36, 'Huyện Mỹ Lộc', '', '20 27 21N, 106 07 56E', 1),
(359, 36, 'Huyện Vụ Bản', '', '20 22 57N, 106 05 35E', 1),
(360, 36, 'Huyện Ý Yên', '', '20 19 48N, 106 01 55E', 1),
(361, 36, 'Huyện Nghĩa Hưng', '', '20 05 37N, 106 08 59E', 1),
(362, 36, 'Huyện Nam Trực', '', '20 20 08N, 106 12 54E', 1),
(363, 36, 'Huyện Trực Ninh', '', '20 14 42N, 106 12 45E', 1),
(364, 36, 'Huyện Xuân Trường', '', '20 17 53N, 106 21 43E', 1),
(365, 36, 'Huyện Giao Thủy', '', '20 14 45N, 106 28 39E', 1),
(366, 36, 'Huyện Hải Hậu', '', '20 06 26N, 106 16 29E', 1),
(369, 37, 'Thành Phố Ninh Bình', '', '20 14 45N, 105 58 24E', 1),
(370, 37, 'Thị Xã Tam Điệp', '', '20 09 42N, 103 52 43E', 1),
(372, 37, 'Huyện Nho Quan', '', '20 18 46N, 105 42 48E', 1),
(373, 37, 'Huyện Gia Viễn', '', '20 19 50N, 105 52 20E', 1),
(374, 37, 'Huyện Hoa Lư', '', '20 15 04N, 105 55 52E', 1),
(375, 37, 'Huyện Yên Khánh', '', '20 11 26N, 106 04 33E', 1),
(376, 37, 'Huyện Kim Sơn', '', '20 02 07N, 106 05 27E', 1),
(377, 37, 'Huyện Yên Mô', '', '20 07 45N, 105 59 45E', 1),
(380, 38, 'Thành Phố Thanh Hóa', '', '19 48 26N, 105 47 37E', 1),
(381, 38, 'Thị Xã Bỉm Sơn', '', '20 05 21N, 105 51 48E', 1),
(382, 38, 'Thị Xã Sầm Sơn', '', '19 45 11N, 105 54 03E', 1),
(384, 38, 'Huyện Mường Lát', '', '20 30 42N, 104 37 27E', 1),
(385, 38, 'Huyện Quan Hóa', '', '20 29 15N, 104 56 35E', 1),
(386, 38, 'Huyện Bá Thước', '', '20 22 48N, 105 14 50E', 1),
(387, 38, 'Huyện Quan Sơn', '', '20 15 17N, 104 51 58E', 1),
(388, 38, 'Huyện Lang Chánh', '', '20 08 58N, 105 07 40E', 1),
(389, 38, 'Huyện Ngọc Lặc', '', '20 04 08N, 105 22 39E', 1),
(390, 38, 'Huyện Cẩm Thủy', '', '20 12 20N, 105 27 22E', 1),
(391, 38, 'Huyện Thạch Thành', '', '21 12 41N, 105 36 38E', 1),
(392, 38, 'Huyện Hà Trung', '', '20 03 20N, 105 51 20E', 1),
(393, 38, 'Huyện Vĩnh Lộc', '', '20 02 29N, 105 39 28E', 1),
(394, 38, 'Huyện Yên Định', '', '20 00 31N, 105 37 44E', 1),
(395, 38, 'Huyện Thọ Xuân', '', '19 55 39N, 105 29 14E', 1),
(396, 38, 'Huyện Thường Xuân', '', '19 54 55N, 105 10 46E', 1),
(397, 38, 'Huyện Triệu Sơn', '', '19 48 11N, 105 34 03E', 1),
(398, 38, 'Huyện Thiệu Hoá', '', '19 53 56N, 105 40 57E', 1),
(399, 38, 'Huyện Hoằng Hóa', '', '19 51 59N, 105 51 34E', 1),
(400, 38, 'Huyện Hậu Lộc', '', '19 56 02N, 105 53 19E', 1),
(401, 38, 'Huyện Nga Sơn', '', '20 00 16N, 105 59 26E', 1),
(402, 38, 'Huyện Như Xuân', '', '19 5 55N, 105 20 22E', 1),
(403, 38, 'Huyện Như Thanh', '', '19 35 19N, 105 33 09E', 1),
(404, 38, 'Huyện Nông Cống', '', '19 36 58N, 105 40 54E', 1),
(405, 38, 'Huyện Đông Sơn', '', '19 47 44N, 105 42 19E', 1),
(406, 38, 'Huyện Quảng Xương', '', '19 40 53N, 105 48 01E', 1),
(407, 38, 'Huyện Tĩnh Gia', '', '19 27 13N, 105 43 38E', 1),
(412, 40, 'Thành Phố Vinh', '', '18 41 06N, 105 42 05E', 1),
(413, 40, 'Thị Xã Cửa Lò', '', '18 47 26N, 105 43 31E', 1),
(414, 40, 'Thị Xã Thái Hoà', '', '', 1),
(415, 40, 'Huyện Quế Phong', '', '19 42 25N, 104 54 21E', 1),
(416, 40, 'Huyện Quỳ Châu', '', '19 32 16N, 105 03 18E', 1),
(417, 40, 'Huyện Kỳ Sơn', '', '19 24 36N, 104 09 45E', 1),
(418, 40, 'Huyện Tương Dương', '', '19 19 15N, 104 35 41E', 1),
(419, 40, 'Huyện Nghĩa Đàn', '', '19 21 19N, 105 26 33E', 1),
(420, 40, 'Huyện Quỳ Hợp', '', '19 19 24N, 105 09 12E', 1),
(421, 40, 'Huyện Quỳnh Lưu', '', '19 14 01N, 105 37 00E', 1),
(422, 40, 'Huyện Con Cuông', '', '19 03 50N, 107 47 15E', 1),
(423, 40, 'Huyện Tân Kỳ', '', '19 06 11N, 105 14 14E', 1),
(424, 40, 'Huyện Anh Sơn', '', '18 58 04N, 105 04 30E', 1),
(425, 40, 'Huyện Diễn Châu', '', '19 01 20N, 105 34 13E', 1),
(426, 40, 'Huyện Yên Thành', '', '19 01 25N, 105 26 17E', 1),
(427, 40, 'Huyện Đô Lương', '', '18 55 00N, 105 21 03E', 1),
(428, 40, 'Huyện Thanh Chương', '', '18 44 11N, 105 12 59E', 1),
(429, 40, 'Huyện Nghi Lộc', '', '18 47 41N, 105 31 30E', 1),
(430, 40, 'Huyện Nam Đàn', '', '18 40 28N, 105 30 32E', 1),
(431, 40, 'Huyện Hưng Nguyên', '', '18 41 13N, 105 37 41E', 1),
(436, 42, 'Thành Phố Hà Tĩnh', '', '18 21 20N, 105 54 00E', 1),
(437, 42, 'Thị Xã Hồng Lĩnh', '', '18 32 05N, 105 42 40E', 1),
(439, 42, 'Huyện Hương Sơn', '', '18 26 47N, 105 19 36E', 1),
(440, 42, 'Huyện Đức Thọ', '', '18 29 23N, 105 36 39E', 1),
(441, 42, 'Huyện Vũ Quang', '', '18 19 30N, 105 26 38E', 1),
(442, 42, 'Huyện Nghi Xuân', '', '18 38 46N, 105 46 17E', 1),
(443, 42, 'Huyện Can Lộc', '', '18 26 39N, 105 46 13E', 1),
(444, 42, 'Huyện Hương Khê', '', '18 11 36N, 105 41 24E', 1),
(445, 42, 'Huyện Thạch Hà', '', '18 19 29N, 105 52 43E', 1),
(446, 42, 'Huyện Cẩm Xuyên', '', '18 11 32N, 106 00 04E', 1),
(447, 42, 'Huyện Kỳ Anh', '', '18 05 15N, 106 15 49E', 1),
(448, 42, 'Huyện Lộc Hà', '', '', 1),
(450, 44, 'Thành Phố Đồng Hới', '', '17 26 53N, 106 35 15E', 1),
(452, 44, 'Huyện Minh Hóa', '', '17 44 03N, 105 51 45E', 1),
(453, 44, 'Huyện Tuyên Hóa', '', '17 54 04N, 105 58 17E', 1),
(454, 44, 'Huyện Quảng Trạch', '', '17 50 04N, 106 22 24E', 1),
(455, 44, 'Huyện Bố Trạch', '', '17 29 13N, 106 06 54E', 1),
(456, 44, 'Huyện Quảng Ninh', '', '17 15 15N, 106 32 31E', 1),
(457, 44, 'Huyện Lệ Thủy', '', '17 07 35N, 106 41 47E', 1),
(461, 45, 'Thành Phố Đông Hà', '', '16 48 12N, 107 05 12E', 1),
(462, 45, 'Thị Xã Quảng Trị', '', '16 44 37N, 107 11 20E', 1),
(464, 45, 'Huyện Vĩnh Linh', '', '17 01 35N, 106 53 49E', 1),
(465, 45, 'Huyện Hướng Hóa', '', '16 42 19N, 106 40 14E', 1),
(466, 45, 'Huyện Gio Linh', '', '16 54 49N, 106 56 16E', 1),
(467, 45, 'Huyện Đa Krông', '', '16 33 58N, 106 55 49E', 1),
(468, 45, 'Huyện Cam Lộ', '', '16 47 09N, 106 57 52E', 1),
(469, 45, 'Huyện Triệu Phong', '', '16 46 32N, 107 09 12E', 1),
(470, 45, 'Huyện Hải Lăng', '', '16 41 07N, 107 13 34E', 1),
(471, 45, 'Huyện Cồn Cỏ', '', '19 09 39N, 107 19 58E', 1),
(474, 46, 'Thành Phố Huế', '', '16 27 16N, 107 34 29E', 1),
(476, 46, 'Huyện Phong Điền', '', '16 32 42N, 106 16 37E', 1),
(477, 46, 'Huyện Quảng Điền', '', '16 35 21N, 107 29 31E', 1),
(478, 46, 'Huyện Phú Vang', '', '16 27 20N, 107 42 28E', 1),
(479, 46, 'Huyện Hương Thủy', '', '16 19 27N, 107 37 26E', 1),
(480, 46, 'Huyện Hương Trà', '', '16 25 49N, 107 28 37E', 1),
(481, 46, 'Huyện A Lưới', '', '16 13 59N, 107 16 12E', 1),
(482, 46, 'Huyện Phú Lộc', '', '16 17 16N, 107 55 25E', 1),
(483, 46, 'Huyện Nam Đông', '', '16 07 11N, 107 41 25E', 1),
(490, 48, 'Quận Liên Chiểu', '', '16 07 26N, 108 07 04E', 1),
(491, 48, 'Quận Thanh Khê', '', '16 03 28N, 108 11 00E', 1),
(492, 48, 'Quận Hải Châu', '', '16 03 38N, 108 11 46E', 1),
(493, 48, 'Quận Sơn Trà', '', '16 06 13N, 108 16 26E', 1),
(494, 48, 'Quận Ngũ Hành Sơn', '', '16 00 30N, 108 15 09E', 1),
(495, 48, 'Quận Cẩm Lệ', '', '', 1),
(497, 48, 'Huyện Hoà Vang', '', '16 03 59N, 108 01 57E', 1),
(498, 48, 'Huyện Hoàng Sa', '', '16 21 36N, 111 57 01E', 1),
(502, 49, 'Thành Phố Tam Kỳ', '', '15 34 37N, 108 29 52E', 1),
(503, 49, 'Thành Phố Hội An', '', '15 53 20N, 108 20 42E', 1),
(504, 49, 'Huyện Tây Giang', '', '15 53 46N, 107 25 52E', 1),
(505, 49, 'Huyện Đông Giang', '', '15 54 44N, 107 47 06E', 1),
(506, 49, 'Huyện Đại Lộc', '', '15 50 10N, 107 58 27E', 1),
(507, 49, 'Huyện Điện Bàn', '', '15 54 15N, 108 13 38E', 1),
(508, 49, 'Huyện Duy Xuyên', '', '15 47 58N, 108 13 27E', 1),
(509, 49, 'Huyện Quế Sơn', '', '15 41 03N, 108 05 34E', 1),
(510, 49, 'Huyện Nam Giang', '', '15 36 37N, 107 33 52E', 1),
(511, 49, 'Huyện Phước Sơn', '', '15 23 17N, 107 50 22E', 1),
(512, 49, 'Huyện Hiệp Đức', '', '15 31 09N, 108 05 56E', 1),
(513, 49, 'Huyện Thăng Bình', '', '15 42 29N, 108 22 04E', 1),
(514, 49, 'Huyện Tiên Phước', '', '15 29 30N, 108 15 28E', 1),
(515, 49, 'Huyện Bắc Trà My', '', '15 08 00N, 108 05 32E', 1),
(516, 49, 'Huyện Nam Trà My', '', '15 16 40N, 108 12 15E', 1),
(517, 49, 'Huyện Núi Thành', '', '15 26 53N, 108 34 49E', 1),
(518, 49, 'Huyện Phú Ninh', '', '15 30 43N, 108 24 43E', 1),
(519, 49, 'Huyện Nông Sơn', '', '', 1),
(522, 51, 'Thành Phố Quảng Ngãi', '', '15 07 17N, 108 48 24E', 1),
(524, 51, 'Huyện Bình Sơn', '', '15 18 45N, 108 45 35E', 1),
(525, 51, 'Huyện Trà Bồng', '', '15 13 30N, 108 29 57E', 1),
(526, 51, 'Huyện Tây Trà', '', '15 11 13N, 108 22 23E', 1),
(527, 51, 'Huyện Sơn Tịnh', '', '15 11 49N, 108 45 03E', 1),
(528, 51, 'Huyện Tư Nghĩa', '', '15 05 25N, 108 45 23E', 1),
(529, 51, 'Huyện Sơn Hà', '', '14 58 35N, 108 29 09E', 1),
(530, 51, 'Huyện Sơn Tây', '', '14 58 11N, 108 21 22E', 1),
(531, 51, 'Huyện Minh Long', '', '14 56 49N, 108 40 19E', 1),
(532, 51, 'Huyện Nghĩa Hành', '', '14 58 06N, 108 46 05E', 1),
(533, 51, 'Huyện Mộ Đức', '', '11 59 13N, 108 52 21E', 1),
(534, 51, 'Huyện Đức Phổ', '', '14 44 59N, 108 56 58E', 1),
(535, 51, 'Huyện Ba Tơ', '', '14 42 52N, 108 43 44E', 1),
(536, 51, 'Huyện Lý Sơn', '', '15 22 50N, 109 06 56E', 1),
(540, 52, 'Thành Phố Qui Nhơn', '', '13 47 15N, 109 12 48E', 1),
(542, 52, 'Huyện An Lão', '', '14 32 10N, 108 47 52E', 1),
(543, 52, 'Huyện Hoài Nhơn', '', '14 30 56N, 109 01 56E', 1),
(544, 52, 'Huyện Hoài Ân', '', '14 20 51N, 108 54 04E', 1),
(545, 52, 'Huyện Phù Mỹ', '', '14 14 41N, 109 05 43E', 1),
(546, 52, 'Huyện Vĩnh Thạnh', '', '14 14 26N, 108 44 08E', 1),
(547, 52, 'Huyện Tây Sơn', '', '13 56 47N, 108 53 06E', 1),
(548, 52, 'Huyện Phù Cát', '', '14 03 48N, 109 03 57E', 1),
(549, 52, 'Huyện An Nhơn', '', '13 51 28N, 109 04 02E', 1),
(550, 52, 'Huyện Tuy Phước', '', '13 46 30N, 109 05 38E', 1),
(551, 52, 'Huyện Vân Canh', '', '13 40 35N, 108 57 52E', 1),
(555, 54, 'Thành Phố Tuy Hòa', '', '13 05 42N, 109 15 50E', 1),
(557, 54, 'Thị Xã Sông Cầu', '', '13 31 40N, 109 12 39E', 1),
(558, 54, 'Huyện Đồng Xuân', '', '13 24 59N, 108 56 46E', 1),
(559, 54, 'Huyện Tuy An', '', '13 15 19N, 109 12 21E', 1),
(560, 54, 'Huyện Sơn Hòa', '', '13 12 16N, 108 57 17E', 1),
(561, 54, 'Huyện Sông Hinh', '', '12 54 19N, 108 53 38E', 1),
(562, 54, 'Huyện Tây Hoà', '', '', 1),
(563, 54, 'Huyện Phú Hoà', '', '13 04 07N, 109 11 24E', 1),
(564, 54, 'Huyện Đông Hoà', '', '', 1),
(568, 56, 'Thành Phố Nha Trang', '', '12 15 40N, 109 10 40E', 1),
(569, 56, 'Thị Xã Cam Ranh', '', '11 59 05N, 108 08 17E', 1),
(570, 56, 'Huyện Cam Lâm', '', '', 1),
(571, 56, 'Huyện Vạn Ninh', '', '12 43 10N, 109 11 18E', 1),
(572, 56, 'Huyện Ninh Hòa', '', '12 32 54N, 109 06 11E', 1),
(573, 56, 'Huyện Khánh Vĩnh', '', '12 17 50N, 108 51 56E', 1),
(574, 56, 'Huyện Diên Khánh', '', '12 13 19N, 109 02 16E', 1),
(575, 56, 'Huyện Khánh Sơn', '', '12 02 17N, 108 53 47E', 1),
(576, 56, 'Huyện Trường Sa', '', '9 07 27N, 114 15 00E', 1),
(582, 58, 'Thành Phố Phan Rang-Tháp Chàm', '', '11 36 11N, 108 58 34E', 1),
(584, 58, 'Huyện Bác Ái', '', '11 54 45N, 108 51 29E', 1),
(585, 58, 'Huyện Ninh Sơn', '', '11 42 36N, 108 44 55E', 1),
(586, 58, 'Huyện Ninh Hải', '', '11 42 46N, 109 05 41E', 1),
(587, 58, 'Huyện Ninh Phước', '', '11 28 56N, 108 50 34E', 1),
(588, 58, 'Huyện Thuận Bắc', '', '', 1),
(589, 58, 'Huyện Thuận Nam', '', '', 1),
(593, 60, 'Thành Phố Phan Thiết', '', '10 54 16N, 108 03 44E', 1),
(594, 60, 'Thị Xã La Gi', '', '', 1),
(595, 60, 'Huyện Tuy Phong', '', '11 20 26N, 108 41 15E', 1),
(596, 60, 'Huyện Bắc Bình', '', '11 15 52N, 108 21 33E', 1),
(597, 60, 'Huyện Hàm Thuận Bắc', '', '11 09 18N, 108 03 07E', 1),
(598, 60, 'Huyện Hàm Thuận Nam', '', '10 56 20N, 107 54 38E', 1),
(599, 60, 'Huyện Tánh Linh', '', '11 08 26N, 107 41 22E', 1),
(600, 60, 'Huyện Đức Linh', '', '11 11 43N, 107 31 34E', 1),
(601, 60, 'Huyện Hàm Tân', '', '10 44 41N, 107 41 33E', 1),
(602, 60, 'Huyện Phú Quí', '', '10 33 13N, 108 57 46E', 1),
(608, 62, 'Thành Phố Kon Tum', '', '14 20 32N, 107 58 04E', 1),
(610, 62, 'Huyện Đắk Glei', '', '15 08 13N, 107 44 03E', 1),
(611, 62, 'Huyện Ngọc Hồi', '', '14 44 23N, 107 38 49E', 1),
(612, 62, 'Huyện Đắk Tô', '', '14 46 49N, 107 55 36E', 1),
(613, 62, 'Huyện Kon Plông', '', '14 48 13N, 108 20 05E', 1),
(614, 62, 'Huyện Kon Rẫy', '', '14 32 56N, 108 13 09E', 1),
(615, 62, 'Huyện Đắk Hà', '', '14 36 50N, 107 59 55E', 1),
(616, 62, 'Huyện Sa Thầy', '', '14 16 02N, 107 36 30E', 1),
(617, 62, 'Huyện Tu Mơ Rông', '', '', 1),
(622, 64, 'Thành Phố Pleiku', '', '13 57 42N, 107 58 03E', 1),
(623, 64, 'Thị Xã An Khê', '', '14 01 24N, 108 41 29E', 1),
(624, 64, 'Thị Xã Ayun Pa', '', '', 1),
(625, 64, 'Huyện Kbang', '', '14 18 08N, 108 29 17E', 1),
(626, 64, 'Huyện Đăk Đoa', '', '14 07 02N, 108 09 36E', 1),
(627, 64, 'Huyện Chư Păh', '', '14 13 30N, 107 56 33E', 1),
(628, 64, 'Huyện Ia Grai', '', '13 59 25N, 107 43 16E', 1),
(629, 64, 'Huyện Mang Yang', '', '13 57 26N, 108 18 37E', 1),
(630, 64, 'Huyện Kông Chro', '', '13 45 47N, 108 36 04E', 1),
(631, 64, 'Huyện Đức Cơ', '', '13 46 16N, 107 38 26E', 1),
(632, 64, 'Huyện Chư Prông', '', '13 35 39N, 107 47 36E', 1),
(633, 64, 'Huyện Chư Sê', '', '13 37 04N, 108 06 56E', 1),
(634, 64, 'Huyện Đăk Pơ', '', '13 55 47N, 108 36 16E', 1),
(635, 64, 'Huyện Ia Pa', '', '13 31 37N, 108 30 34E', 1),
(637, 64, 'Huyện Krông Pa', '', '13 14 13N, 108 39 12E', 1),
(638, 64, 'Huyện Phú Thiện', '', '', 1),
(639, 64, 'Huyện Chư Pưh', '', '', 1),
(643, 66, 'Thành Phố Buôn Ma Thuột', '', '12 39 43N, 108 10 40E', 1),
(644, 66, 'Thị Xã Buôn Hồ', '', '', 1),
(645, 66, 'Huyện Ea H\'leo', '', '13 13 52N, 108 12 30E', 1),
(646, 66, 'Huyện Ea Súp', '', '13 10 59N, 107 46 49E', 1),
(647, 66, 'Huyện Buôn Đôn', '', '12 52 45N, 107 45 20E', 1),
(648, 66, 'Huyện Cư M\'gar', '', '12 53 47N, 108 04 16E', 1),
(649, 66, 'Huyện Krông Búk', '', '12 56 27N, 108 13 54E', 1),
(650, 66, 'Huyện Krông Năng', '', '12 59 41N, 108 23 42E', 1),
(651, 66, 'Huyện Ea Kar', '', '12 48 17N, 108 32 42E', 1),
(652, 66, 'Huyện M\'đrắk', '', '12 42 14N, 108 47 09E', 1),
(653, 66, 'Huyện Krông Bông', '', '12 27 08N, 108 27 01E', 1),
(654, 66, 'Huyện Krông Pắc', '', '12 41 20N, 108 18 42E', 1),
(655, 66, 'Huyện Krông A Na', '', '12 31 51N, 108 05 03E', 1),
(656, 66, 'Huyện Lắk', '', '12 19 20N, 108 12 17E', 1),
(657, 66, 'Huyện Cư Kuin', '', '', 1),
(660, 67, 'Thị Xã Gia Nghĩa', '', '', 1),
(661, 67, 'Huyện Đắk Glong', '', '12 01 53N, 107 50 37E', 1),
(662, 67, 'Huyện Cư Jút', '', '12 40 56N, 107 44 44E', 1),
(663, 67, 'Huyện Đắk Mil', '', '12 31 08N, 107 42 24E', 1),
(664, 67, 'Huyện Krông Nô', '', '12 22 16N, 107 53 49E', 1),
(665, 67, 'Huyện Đắk Song', '', '12 14 04N, 107 36 30E', 1),
(666, 67, 'Huyện Đắk R\'lấp', '', '12 02 30N, 107 25 59E', 1),
(667, 67, 'Huyện Tuy Đức', '', '', 1),
(672, 68, 'Thành Phố Đà Lạt', '', '11 54 33N, 108 27 08E', 1),
(673, 68, 'Thị Xã Bảo Lộc', '', '11 32 48N, 107 47 37E', 1),
(674, 68, 'Huyện Đam Rông', '', '12 02 35N, 108 10 26E', 1),
(675, 68, 'Huyện Lạc Dương', '', '12 08 30N, 108 27 48E', 1),
(676, 68, 'Huyện Lâm Hà', '', '11 55 26N, 108 11 31E', 1),
(677, 68, 'Huyện Đơn Dương', '', '11 48 26N, 108 32 48E', 1),
(678, 68, 'Huyện Đức Trọng', '', '11 41 50N, 108 18 58E', 1),
(679, 68, 'Huyện Di Linh', '', '11 31 10N, 108 05 23E', 1),
(680, 68, 'Huyện Bảo Lâm', '', '11 38 31N, 107 43 25E', 1),
(681, 68, 'Huyện Đạ Huoai', '', '11 27 11N, 107 38 08E', 1),
(682, 68, 'Huyện Đạ Tẻh', '', '11 33 46N, 107 32 00E', 1),
(683, 68, 'Huyện Cát Tiên', '', '11 39 38N, 107 23 27E', 1),
(688, 70, 'Thị Xã Phước Long', '', '', 1),
(689, 70, 'Thị Xã Đồng Xoài', '', '11 31 01N, 106 50 21E', 1),
(690, 70, 'Thị Xã Bình Long', '', '', 1),
(691, 70, 'Huyện Bù Gia Mập', '', '11 56 57N, 106 59 21E', 1),
(692, 70, 'Huyện Lộc Ninh', '', '11 49 28N, 106 35 11E', 1),
(693, 70, 'Huyện Bù Đốp', '', '11 59 08N, 106 49 54E', 1),
(694, 70, 'Huyện Hớn Quản', '', '11 37 37N, 106 36 02E', 1),
(695, 70, 'Huyện Đồng Phù', '', '11 28 45N, 106 57 07E', 1),
(696, 70, 'Huyện Bù Đăng', '', '11 46 09N, 107 14 14E', 1),
(697, 70, 'Huyện Chơn Thành', '', '11 28 45N, 106 39 26E', 1),
(703, 72, 'Thị Xã Tây Ninh', '', '11 21 59N, 106 07 47E', 1),
(705, 72, 'Huyện Tân Biên', '', '11 35 14N, 105 57 53E', 1),
(706, 72, 'Huyện Tân Châu', '', '11 34 49N, 106 17 48E', 1),
(707, 72, 'Huyện Dương Minh Châu', '', '11 22 04N, 106 16 58E', 1),
(708, 72, 'Huyện Châu Thành', '', '11 19 02N, 106 00 15E', 1),
(709, 72, 'Huyện Hòa Thành', '', '11 15 31N, 106 08 44E', 1),
(710, 72, 'Huyện Gò Dầu', '', '11 09 39N, 106 14 42E', 1),
(711, 72, 'Huyện Bến Cầu', '', '11 07 50N, 106 08 25E', 1),
(712, 72, 'Huyện Trảng Bàng', '', '11 06 18N, 106 23 12E', 1),
(718, 74, 'Thị Xã Thủ Dầu Một', '', '11 00 01N, 106 38 56E', 1),
(720, 74, 'Huyện Dầu Tiếng', '', '11 19 07N, 106 26 59E', 1),
(721, 74, 'Huyện Bến Cát', '', '11 12 42N, 106 36 28E', 1),
(722, 74, 'Huyện Phú Giáo', '', '11 20 21N, 106 47 48E', 1),
(723, 74, 'Huyện Tân Uyên', '', '11 06 31N, 106 49 02E', 1),
(724, 74, 'Huyện Dĩ An', '', '10 55 03N, 106 47 09E', 1),
(725, 74, 'Huyện Thuận An', '', '10 55 58N, 106 41 59E', 1),
(731, 75, 'Thành Phố Biên Hòa', '', '10 56 31N, 106 50 50E', 1),
(732, 75, 'Thị Xã Long Khánh', '', '10 56 24N, 107 14 29E', 1),
(734, 75, 'Huyện Tân Phú', '', '11 22 51N, 107 21 35E', 1),
(735, 75, 'Huyện Vĩnh Cửu', '', '11 14 31N, 107 00 06E', 1),
(736, 75, 'Huyện Định Quán', '', '11 12 41N, 107 17 03E', 1),
(737, 75, 'Huyện Trảng Bom', '', '10 58 39N, 107 00 52E', 1),
(738, 75, 'Huyện Thống Nhất', '', '10 58 29N, 107 09 26E', 1),
(739, 75, 'Huyện Cẩm Mỹ', '', '10 47 05N, 107 14 36E', 1),
(740, 75, 'Huyện Long Thành', '', '10 47 38N, 106 59 42E', 1),
(741, 75, 'Huyện Xuân Lộc', '', '10 55 39N, 107 24 21E', 1),
(742, 75, 'Huyện Nhơn Trạch', '', '10 39 18N, 106 53 18E', 1),
(747, 77, 'Thành Phố Vũng Tầu', '', '10 24 08N, 107 07 05E', 1),
(748, 77, 'Thị Xã Bà Rịa', '', '10 30 33N, 107 10 47E', 1),
(750, 77, 'Huyện Châu Đức', '', '10 39 23N, 107 15 08E', 1),
(751, 77, 'Huyện Xuyên Mộc', '', '10 37 46N, 107 29 39E', 1),
(752, 77, 'Huyện Long Điền', '', '10 26 47N, 107 12 53E', 1),
(753, 77, 'Huyện Đất Đỏ', '', '10 28 40N, 107 18 27E', 1),
(754, 77, 'Huyện Tân Thành', '', '10 34 50N, 107 05 06E', 1),
(755, 77, 'Huyện Côn Đảo', '', '8 42 25N, 106 36 05E', 1),
(760, 79, 'Quận 1', '', '10 46 34N, 106 41 45E', 1),
(761, 79, 'Quận 12', '', '10 51 43N, 106 39 32E', 1),
(762, 79, 'Quận Thủ Đức', '', '10 51 20N, 106 45 05E', 1),
(763, 79, 'Quận 9', '', '10 49 49N, 106 49 03E', 1),
(764, 79, 'Quận Gò Vấp', '', '10 50 12N, 106 39 52E', 1),
(765, 79, 'Quận Bình Thạnh', '', '10 48 46N, 106 42 57E', 1),
(766, 79, 'Quận Tân Bình', '', '10 48 13N, 106 39 03E', 1),
(767, 79, 'Quận Tân Phú', '', '10 47 32N, 106 37 31E', 1),
(768, 79, 'Quận Phú Nhuận', '', '10 48 06N, 106 40 39E', 1),
(769, 79, 'Quận 2', '', '10 46 51N, 106 45 25E', 1),
(770, 79, 'Quận 3', '', '10 46 48N, 106 40 46E', 1),
(771, 79, 'Quận 10', '', '10 46 25N, 106 40 02E', 1),
(772, 79, 'Quận 11', '', '10 46 01N, 106 38 44E', 1),
(773, 79, 'Quận 4', '', '10 45 42N, 106 42 09E', 1),
(774, 79, 'Quận 5', '', '10 45 24N, 106 40 00E', 1),
(775, 79, 'Quận 6', '', '10 44 46N, 106 38 10E', 1),
(776, 79, 'Quận 8', '', '10 43 24N, 106 37 40E', 1),
(777, 79, 'Quận Bình Tân', '', '10 46 16N, 106 35 26E', 1),
(778, 79, 'Quận 7', '', '10 44 19N, 106 43 35E', 1),
(783, 79, 'Huyện Củ Chi', '', '11 02 17N, 106 30 20E', 1),
(784, 79, 'Huyện Hóc Môn', '', '10 52 42N, 106 35 33E', 1),
(785, 79, 'Huyện Bình Chánh', '', '10 45 01N, 106 30 45E', 1),
(786, 79, 'Huyện Nhà Bè', '', '10 39 06N, 106 43 35E', 1),
(787, 79, 'Huyện Cần Giờ', '', '10 30 43N, 106 52 50E', 1),
(794, 80, 'Thành Phố Tân An', '', '10 31 36N, 106 24 06E', 1),
(796, 80, 'Huyện Tân Hưng', '', '10 49 05N, 105 39 26E', 1),
(797, 80, 'Huyện Vĩnh Hưng', '', '10 52 54N, 105 45 58E', 1),
(798, 80, 'Huyện Mộc Hóa', '', '10 47 09N, 105 57 56E', 1),
(799, 80, 'Huyện Tân Thạnh', '', '10 37 44N, 105 57 07E', 1),
(800, 80, 'Huyện Thạnh Hóa', '', '10 41 37N, 106 11 08E', 1),
(801, 80, 'Huyện Đức Huệ', '', '10 51 57N, 106 15 48E', 1),
(802, 80, 'Huyện Đức Hòa', '', '10 53 04N, 106 23 58E', 1),
(803, 80, 'Huyện Bến Lức', '', '10 41 40N, 106 26 28E', 1),
(804, 80, 'Huyện Thủ Thừa', '', '10 39 41N, 106 20 12E', 1),
(805, 80, 'Huyện Tân Trụ', '', '10 31 47N, 106 30 06E', 1),
(806, 80, 'Huyện Cần Đước', '', '10 32 21N, 106 36 33E', 1),
(807, 80, 'Huyện Cần Giuộc', '', '10 34 43N, 106 38 35E', 1),
(808, 80, 'Huyện Châu Thành', '', '10 27 52N, 106 30 00E', 1),
(815, 82, 'Thành Phố Mỹ Tho', '', '10 22 14N, 106 21 52E', 1),
(816, 82, 'Thị Xã Gò Công', '', '10 21 55N, 106 40 24E', 1),
(818, 82, 'Huyện Tân Phước', '', '10 30 36N, 106 13 02E', 1),
(819, 82, 'Huyện Cái Bè', '', '10 24 21N, 105 56 01E', 1),
(820, 82, 'Huyện Cai Lậy', '', '10 24 20N, 106 06 05E', 1),
(821, 82, 'Huyện Châu Thành', '', '20 25 21N, 106 16 57E', 1),
(822, 82, 'Huyện Chợ Gạo', '', '10 23 45N, 106 26 53E', 1),
(823, 82, 'Huyện Gò Công Tây', '', '10 19 55N, 106 35 02E', 1),
(824, 82, 'Huyện Gò Công Đông', '', '10 20 42N, 106 42 54E', 1),
(825, 82, 'Huyện Tân Phú Đông', '', '', 1),
(829, 83, 'Thành Phố Bến Tre', '', '10 14 17N, 106 22 26E', 1),
(831, 83, 'Huyện Châu Thành', '', '10 17 24N, 106 17 45E', 1),
(832, 83, 'Huyện Chợ Lách', '', '10 13 26N, 106 09 08E', 1),
(833, 83, 'Huyện Mỏ Cày Nam', '', '10 06 56N, 106 19 40E', 1),
(834, 83, 'Huyện Giồng Trôm', '', '10 08 46N, 106 28 12E', 1),
(835, 83, 'Huyện Bình Đại', '', '10 09 56N, 106 37 46E', 1),
(836, 83, 'Huyện Ba Tri', '', '10 04 08N, 106 35 10E', 1),
(837, 83, 'Huyện Thạnh Phú', '', '9 55 53N, 106 32 45E', 1),
(838, 83, 'Huyện Mỏ Cày Bắc', '', '', 1),
(842, 84, 'Thị Xã Trà Vinh', '', '9 57 09N, 106 20 39E', 1),
(844, 84, 'Huyện Càng Long', '', '9 58 18N, 106 12 52E', 1),
(845, 84, 'Huyện Cầu Kè', '', '9 51 23N, 106 03 33E', 1),
(846, 84, 'Huyện Tiểu Cần', '', '9 48 37N, 106 12 06E', 1),
(847, 84, 'Huyện Châu Thành', '', '9 52 57N, 106 24 12E', 1),
(848, 84, 'Huyện Cầu Ngang', '', '9 47 14N, 106 29 19E', 1),
(849, 84, 'Huyện Trà Cú', '', '9 42 06N, 106 16 24E', 1),
(850, 84, 'Huyện Duyên Hải', '', '9 39 58N, 106 26 23E', 1),
(855, 86, 'Thành Phố Vĩnh Long', '', '10 15 09N, 105 56 08E', 1),
(857, 86, 'Huyện Long Hồ', '', '10 13 58N, 105 55 47E', 1),
(858, 86, 'Huyện Mang Thít', '', '10 10 58N, 106 05 13E', 1),
(859, 86, 'Huyện Vũng Liêm', '', '10 03 32N, 106 10 35E', 1),
(860, 86, 'Huyện Tam Bình', '', '10 03 58N, 105 58 03E', 1),
(861, 86, 'Huyện Bình Minh', '', '10 05 45N, 105 47 21E', 1),
(862, 86, 'Huyện Trà Ôn', '', '9 59 20N, 105 57 56E', 1),
(863, 86, 'Huyện Bình Tân', '', '', 1),
(866, 87, 'Thành Phố Cao Lãnh', '', '10 27 38N, 105 37 21E', 1),
(867, 87, 'Thị Xã Sa Đéc', '', '10 19 22N, 105 44 31E', 1),
(868, 87, 'Thị Xã Hồng Ngự', '', '', 1),
(869, 87, 'Huyện Tân Hồng', '', '10 52 48N, 105 29 21E', 1),
(870, 87, 'Huyện Hồng Ngự', '', '10 48 13N, 105 19 00E', 1),
(871, 87, 'Huyện Tam Nông', '', '10 44 06N, 105 30 58E', 1),
(872, 87, 'Huyện Tháp Mười', '', '10 33 36N, 105 47 13E', 1),
(873, 87, 'Huyện Cao Lãnh', '', '10 29 03N, 105 41 40E', 1),
(874, 87, 'Huyện Thanh Bình', '', '10 36 38N, 105 28 51E', 1),
(875, 87, 'Huyện Lấp Vò', '', '10 21 27N, 105 36 06E', 1),
(876, 87, 'Huyện Lai Vung', '', '10 14 43N, 105 38 40E', 1),
(877, 87, 'Huyện Châu Thành', '', '10 13 27N, 105 48 38E', 1),
(883, 89, 'Thành Phố Long Xuyên', '', '10 22 22N, 105 25 33E', 1),
(884, 89, 'Thị Xã Châu Đốc', '', '10 41 20N, 105 05 15E', 1),
(886, 89, 'Huyện An Phú', '', '10 50 12N, 105 05 33E', 1),
(887, 89, 'Thị Xã Tân Châu', '', '10 49 11N, 105 11 18E', 1),
(888, 89, 'Huyện Phú Tân', '', '10 40 26N, 105 14 40E', 1),
(889, 89, 'Huyện Châu Phú', '', '10 34 12N, 105 12 13E', 1),
(890, 89, 'Huyện Tịnh Biên', '', '10 33 30N, 105 00 17E', 1),
(891, 89, 'Huyện Tri Tôn', '', '10 24 41N, 104 56 58E', 1),
(892, 89, 'Huyện Châu Thành', '', '10 25 39N, 105 15 31E', 1),
(893, 89, 'Huyện Chợ Mới', '', '10 27 23N, 105 26 57E', 1),
(894, 89, 'Huyện Thoại Sơn', '', '10 16 45N, 105 15 59E', 1),
(899, 91, 'Thành Phố Rạch Giá', '', '10 01 35N, 105 06 20E', 1),
(900, 91, 'Thị Xã Hà Tiên', '', '10 22 54N, 104 30 10E', 1),
(902, 91, 'Huyện Kiên Lương', '', '10 20 21N, 104 39 46E', 1),
(903, 91, 'Huyện Hòn Đất', '', '10 14 20N, 104 55 57E', 1),
(904, 91, 'Huyện Tân Hiệp', '', '10 05 18N, 105 14 04E', 1),
(905, 91, 'Huyện Châu Thành', '', '9 57 37N, 105 10 16E', 1),
(906, 91, 'Huyện Giồng Giềng', '', '9 56 05N, 105 22 06E', 1),
(907, 91, 'Huyện Gò Quao', '', '9 43 17N, 105 17 06E', 1),
(908, 91, 'Huyện An Biên', '', '9 48 37N, 105 03 18E', 1),
(909, 91, 'Huyện An Minh', '', '9 40 24N, 104 59 05E', 1),
(910, 91, 'Huyện Vĩnh Thuận', '', '9 33 25N, 105 11 30E', 1),
(911, 91, 'Huyện Phú Quốc', '', '10 13 44N, 103 57 25E', 1),
(912, 91, 'Huyện Kiên Hải', '', '9 48 31N, 104 37 48E', 1),
(913, 91, 'Huyện U Minh Thượng', '', '', 1),
(914, 91, 'Huyện Giang Thành', '', '', 1),
(916, 92, 'Quận Ninh Kiều', '', '10 01 58N, 105 45 34E', 1),
(917, 92, 'Quận Ô Môn', '', '10 07 28N, 105 37 51E', 1),
(918, 92, 'Quận Bình Thuỷ', '', '10 03 42N, 105 43 17E', 1),
(919, 92, 'Quận Cái Răng', '', '9 59 57N, 105 46 56E', 1),
(923, 92, 'Quận Thốt Nốt', '', '10 14 23N, 105 32 02E', 1),
(924, 92, 'Huyện Vĩnh Thạnh', '', '10 11 35N, 105 22 45E', 1),
(925, 92, 'Huyện Cờ Đỏ', '', '10 02 48N, 105 29 46E', 1),
(926, 92, 'Huyện Phong Điền', '', '9 59 57N, 105 39 35E', 1),
(927, 92, 'Huyện Thới Lai', '', '', 1),
(930, 93, 'Thị Xã Vị Thanh', '', '9 45 15N, 105 24 50E', 1),
(931, 93, 'Thị Xã Ngã Bảy', '', '', 1),
(932, 93, 'Huyện Châu Thành A', '', '9 55 50N, 105 38 31E', 1),
(933, 93, 'Huyện Châu Thành', '', '9 55 22N, 105 48 37E', 1),
(934, 93, 'Huyện Phụng Hiệp', '', '9 47 20N, 105 43 29E', 1),
(935, 93, 'Huyện Vị Thuỷ', '', '9 48 05N, 105 32 13E', 1),
(936, 93, 'Huyện Long Mỹ', '', '9 40 47N, 105 30 53E', 1),
(941, 94, 'Thành Phố Sóc Trăng', '', '9 36 39N, 105 59 00E', 1),
(942, 94, 'Huyện Châu Thành', '', '', 1),
(943, 94, 'Huyện Kế Sách', '', '9 49 30N, 105 57 25E', 1),
(944, 94, 'Huyện Mỹ Tú', '', '9 38 21N, 105 49 52E', 1),
(945, 94, 'Huyện Cù Lao Dung', '', '9 37 36N, 106 12 13E', 1),
(946, 94, 'Huyện Long Phú', '', '9 34 38N, 106 06 07E', 1),
(947, 94, 'Huyện Mỹ Xuyên', '', '9 28 16N, 105 55 51E', 1),
(948, 94, 'Huyện Ngã Năm', '', '9 31 38N, 105 37 22E', 1),
(949, 94, 'Huyện Thạnh Trị', '', '9 28 05N, 105 43 02E', 1),
(950, 94, 'Huyện Vĩnh Châu', '', '9 20 50N, 105 59 58E', 1),
(951, 94, 'Huyện Trần Đề', '', '', 1),
(954, 95, 'Thị Xã Bạc Liêu', '', '9 16 05N, 105 45 08E', 1),
(956, 95, 'Huyện Hồng Dân', '', '9 30 37N, 105 24 25E', 1),
(957, 95, 'Huyện Phước Long', '', '9 23 13N, 105 24 41E', 1),
(958, 95, 'Huyện Vĩnh Lợi', '', '9 16 51N, 105 40 54E', 1),
(959, 95, 'Huyện Giá Rai', '', '9 15 51N, 105 23 18E', 1),
(960, 95, 'Huyện Đông Hải', '', '9 08 11N, 105 24 42E', 1),
(961, 95, 'Huyện Hoà Bình', '', '', 1),
(964, 96, 'Thành Phố Cà Mau', '', '9 10 33N, 105 11 11E', 1),
(966, 96, 'Huyện U Minh', '', '9 22 30N, 104 57 00E', 1),
(967, 96, 'Huyện Thới Bình', '', '9 22 50N, 105 07 35E', 1),
(968, 96, 'Huyện Trần Văn Thời', '', '9 07 36N, 104 57 27E', 1),
(969, 96, 'Huyện Cái Nước', '', '9 00 31N, 105 03 23E', 1),
(970, 96, 'Huyện Đầm Dơi', '', '8 57 48N, 105 13 56E', 1),
(971, 96, 'Huyện Năm Căn', '', '8 46 59N, 104 58 20E', 1),
(972, 96, 'Huyện Phú Tân', '', '8 52 47N, 104 53 35E', 1),
(973, 96, 'Huyện Ngọc Hiển', '', '8 40 47N, 104 57 58E', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wbc_zone_to_geo_zone`
--

CREATE TABLE `wbc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wbc_zone_to_geo_zone`
--

INSERT INTO `wbc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wbc_address`
--
ALTER TABLE `wbc_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `wbc_affiliate`
--
ALTER TABLE `wbc_affiliate`
  ADD PRIMARY KEY (`affiliate_id`);

--
-- Indexes for table `wbc_affiliate_activity`
--
ALTER TABLE `wbc_affiliate_activity`
  ADD PRIMARY KEY (`affiliate_activity_id`);

--
-- Indexes for table `wbc_affiliate_login`
--
ALTER TABLE `wbc_affiliate_login`
  ADD PRIMARY KEY (`affiliate_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `wbc_affiliate_transaction`
--
ALTER TABLE `wbc_affiliate_transaction`
  ADD PRIMARY KEY (`affiliate_transaction_id`);

--
-- Indexes for table `wbc_api`
--
ALTER TABLE `wbc_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Indexes for table `wbc_api_ip`
--
ALTER TABLE `wbc_api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Indexes for table `wbc_api_session`
--
ALTER TABLE `wbc_api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Indexes for table `wbc_attribute`
--
ALTER TABLE `wbc_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indexes for table `wbc_attribute_description`
--
ALTER TABLE `wbc_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Indexes for table `wbc_attribute_group`
--
ALTER TABLE `wbc_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Indexes for table `wbc_attribute_group_description`
--
ALTER TABLE `wbc_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Indexes for table `wbc_banner`
--
ALTER TABLE `wbc_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `wbc_banner_image`
--
ALTER TABLE `wbc_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Indexes for table `wbc_blog`
--
ALTER TABLE `wbc_blog`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indexes for table `wbc_blog_category`
--
ALTER TABLE `wbc_blog_category`
  ADD PRIMARY KEY (`blog_category_id`);

--
-- Indexes for table `wbc_blog_category_description`
--
ALTER TABLE `wbc_blog_category_description`
  ADD PRIMARY KEY (`blog_category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `wbc_blog_category_to_layout`
--
ALTER TABLE `wbc_blog_category_to_layout`
  ADD PRIMARY KEY (`blog_category_id`,`store_id`);

--
-- Indexes for table `wbc_blog_category_to_store`
--
ALTER TABLE `wbc_blog_category_to_store`
  ADD PRIMARY KEY (`blog_category_id`,`store_id`);

--
-- Indexes for table `wbc_blog_comment`
--
ALTER TABLE `wbc_blog_comment`
  ADD PRIMARY KEY (`blog_comment_id`);

--
-- Indexes for table `wbc_blog_to_category`
--
ALTER TABLE `wbc_blog_to_category`
  ADD PRIMARY KEY (`blog_id`,`blog_category_id`);

--
-- Indexes for table `wbc_blog_to_layout`
--
ALTER TABLE `wbc_blog_to_layout`
  ADD PRIMARY KEY (`blog_id`,`store_id`);

--
-- Indexes for table `wbc_cart`
--
ALTER TABLE `wbc_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`);

--
-- Indexes for table `wbc_category`
--
ALTER TABLE `wbc_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `wbc_category_description`
--
ALTER TABLE `wbc_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `wbc_category_filter`
--
ALTER TABLE `wbc_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Indexes for table `wbc_category_path`
--
ALTER TABLE `wbc_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Indexes for table `wbc_category_to_layout`
--
ALTER TABLE `wbc_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `wbc_category_to_store`
--
ALTER TABLE `wbc_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `wbc_country`
--
ALTER TABLE `wbc_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `wbc_coupon`
--
ALTER TABLE `wbc_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `wbc_coupon_category`
--
ALTER TABLE `wbc_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Indexes for table `wbc_coupon_history`
--
ALTER TABLE `wbc_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Indexes for table `wbc_coupon_product`
--
ALTER TABLE `wbc_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Indexes for table `wbc_currency`
--
ALTER TABLE `wbc_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `wbc_customer`
--
ALTER TABLE `wbc_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `wbc_customer_activity`
--
ALTER TABLE `wbc_customer_activity`
  ADD PRIMARY KEY (`customer_activity_id`);

--
-- Indexes for table `wbc_customer_group`
--
ALTER TABLE `wbc_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indexes for table `wbc_customer_group_description`
--
ALTER TABLE `wbc_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Indexes for table `wbc_customer_history`
--
ALTER TABLE `wbc_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Indexes for table `wbc_customer_ip`
--
ALTER TABLE `wbc_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `wbc_customer_login`
--
ALTER TABLE `wbc_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `wbc_customer_online`
--
ALTER TABLE `wbc_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Indexes for table `wbc_customer_reward`
--
ALTER TABLE `wbc_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Indexes for table `wbc_customer_search`
--
ALTER TABLE `wbc_customer_search`
  ADD PRIMARY KEY (`customer_search_id`);

--
-- Indexes for table `wbc_customer_transaction`
--
ALTER TABLE `wbc_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Indexes for table `wbc_customer_wishlist`
--
ALTER TABLE `wbc_customer_wishlist`
  ADD PRIMARY KEY (`customer_id`,`product_id`);

--
-- Indexes for table `wbc_custom_field`
--
ALTER TABLE `wbc_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Indexes for table `wbc_custom_field_customer_group`
--
ALTER TABLE `wbc_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Indexes for table `wbc_custom_field_description`
--
ALTER TABLE `wbc_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Indexes for table `wbc_custom_field_value`
--
ALTER TABLE `wbc_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Indexes for table `wbc_custom_field_value_description`
--
ALTER TABLE `wbc_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Indexes for table `wbc_dieutri`
--
ALTER TABLE `wbc_dieutri`
  ADD PRIMARY KEY (`dieutri_id`);

--
-- Indexes for table `wbc_dieutri_category`
--
ALTER TABLE `wbc_dieutri_category`
  ADD PRIMARY KEY (`dieutri_category_id`);

--
-- Indexes for table `wbc_dieutri_category_description`
--
ALTER TABLE `wbc_dieutri_category_description`
  ADD PRIMARY KEY (`dieutri_category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `wbc_dieutri_category_to_layout`
--
ALTER TABLE `wbc_dieutri_category_to_layout`
  ADD PRIMARY KEY (`dieutri_category_id`,`store_id`);

--
-- Indexes for table `wbc_dieutri_category_to_store`
--
ALTER TABLE `wbc_dieutri_category_to_store`
  ADD PRIMARY KEY (`dieutri_category_id`,`store_id`);

--
-- Indexes for table `wbc_dieutri_comment`
--
ALTER TABLE `wbc_dieutri_comment`
  ADD PRIMARY KEY (`dieutri_comment_id`);

--
-- Indexes for table `wbc_dieutri_product`
--
ALTER TABLE `wbc_dieutri_product`
  ADD PRIMARY KEY (`dieutri_id`,`product_id`);

--
-- Indexes for table `wbc_dieutri_to_category`
--
ALTER TABLE `wbc_dieutri_to_category`
  ADD PRIMARY KEY (`dieutri_id`,`dieutri_category_id`);

--
-- Indexes for table `wbc_dieutri_to_layout`
--
ALTER TABLE `wbc_dieutri_to_layout`
  ADD PRIMARY KEY (`dieutri_id`,`store_id`);

--
-- Indexes for table `wbc_download`
--
ALTER TABLE `wbc_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Indexes for table `wbc_download_description`
--
ALTER TABLE `wbc_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Indexes for table `wbc_event`
--
ALTER TABLE `wbc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `wbc_extension`
--
ALTER TABLE `wbc_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Indexes for table `wbc_filter`
--
ALTER TABLE `wbc_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `wbc_filter_description`
--
ALTER TABLE `wbc_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Indexes for table `wbc_filter_group`
--
ALTER TABLE `wbc_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Indexes for table `wbc_filter_group_description`
--
ALTER TABLE `wbc_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Indexes for table `wbc_geo_zone`
--
ALTER TABLE `wbc_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Indexes for table `wbc_information`
--
ALTER TABLE `wbc_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Indexes for table `wbc_information_description`
--
ALTER TABLE `wbc_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Indexes for table `wbc_information_to_layout`
--
ALTER TABLE `wbc_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `wbc_information_to_store`
--
ALTER TABLE `wbc_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `wbc_language`
--
ALTER TABLE `wbc_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `wbc_layout`
--
ALTER TABLE `wbc_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indexes for table `wbc_layout_module`
--
ALTER TABLE `wbc_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Indexes for table `wbc_layout_route`
--
ALTER TABLE `wbc_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Indexes for table `wbc_length_class`
--
ALTER TABLE `wbc_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Indexes for table `wbc_length_class_description`
--
ALTER TABLE `wbc_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Indexes for table `wbc_location`
--
ALTER TABLE `wbc_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `wbc_manufacturer`
--
ALTER TABLE `wbc_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `wbc_manufacturer_to_store`
--
ALTER TABLE `wbc_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Indexes for table `wbc_marketing`
--
ALTER TABLE `wbc_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Indexes for table `wbc_mega_menu`
--
ALTER TABLE `wbc_mega_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wbc_menu`
--
ALTER TABLE `wbc_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `wbc_menu_description`
--
ALTER TABLE `wbc_menu_description`
  ADD PRIMARY KEY (`menu_id`,`language_id`);

--
-- Indexes for table `wbc_menu_module`
--
ALTER TABLE `wbc_menu_module`
  ADD PRIMARY KEY (`menu_module_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `wbc_mfilter_tags`
--
ALTER TABLE `wbc_mfilter_tags`
  ADD PRIMARY KEY (`mfilter_tag_id`),
  ADD KEY `tag` (`tag`);

--
-- Indexes for table `wbc_modification`
--
ALTER TABLE `wbc_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- Indexes for table `wbc_module`
--
ALTER TABLE `wbc_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `wbc_option`
--
ALTER TABLE `wbc_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `wbc_option_description`
--
ALTER TABLE `wbc_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Indexes for table `wbc_option_value`
--
ALTER TABLE `wbc_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Indexes for table `wbc_option_value_description`
--
ALTER TABLE `wbc_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Indexes for table `wbc_order`
--
ALTER TABLE `wbc_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `wbc_order_custom_field`
--
ALTER TABLE `wbc_order_custom_field`
  ADD PRIMARY KEY (`order_custom_field_id`);

--
-- Indexes for table `wbc_order_history`
--
ALTER TABLE `wbc_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Indexes for table `wbc_order_option`
--
ALTER TABLE `wbc_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Indexes for table `wbc_order_product`
--
ALTER TABLE `wbc_order_product`
  ADD PRIMARY KEY (`order_product_id`);

--
-- Indexes for table `wbc_order_recurring`
--
ALTER TABLE `wbc_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- Indexes for table `wbc_order_recurring_transaction`
--
ALTER TABLE `wbc_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- Indexes for table `wbc_order_status`
--
ALTER TABLE `wbc_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Indexes for table `wbc_order_total`
--
ALTER TABLE `wbc_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `wbc_order_voucher`
--
ALTER TABLE `wbc_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Indexes for table `wbc_page_form`
--
ALTER TABLE `wbc_page_form`
  ADD PRIMARY KEY (`page_form_id`);

--
-- Indexes for table `wbc_page_form_customer_group`
--
ALTER TABLE `wbc_page_form_customer_group`
  ADD PRIMARY KEY (`page_form_id`,`customer_group_id`);

--
-- Indexes for table `wbc_page_form_option`
--
ALTER TABLE `wbc_page_form_option`
  ADD PRIMARY KEY (`page_form_option_id`);

--
-- Indexes for table `wbc_page_form_option_value`
--
ALTER TABLE `wbc_page_form_option_value`
  ADD PRIMARY KEY (`page_form_option_value_id`);

--
-- Indexes for table `wbc_page_form_store`
--
ALTER TABLE `wbc_page_form_store`
  ADD PRIMARY KEY (`page_form_id`,`store_id`);

--
-- Indexes for table `wbc_page_request`
--
ALTER TABLE `wbc_page_request`
  ADD PRIMARY KEY (`page_request_id`);

--
-- Indexes for table `wbc_page_request_option`
--
ALTER TABLE `wbc_page_request_option`
  ADD PRIMARY KEY (`page_request_option_id`);

--
-- Indexes for table `wbc_product`
--
ALTER TABLE `wbc_product`
  ADD PRIMARY KEY (`product_id`);
ALTER TABLE `wbc_product` ADD FULLTEXT KEY `mfilter_tags` (`mfilter_tags`);

--
-- Indexes for table `wbc_product_attribute`
--
ALTER TABLE `wbc_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Indexes for table `wbc_product_description`
--
ALTER TABLE `wbc_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);
ALTER TABLE `wbc_product_description` ADD FULLTEXT KEY `related_generator` (`name`,`description`);

--
-- Indexes for table `wbc_product_discount`
--
ALTER TABLE `wbc_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `wbc_product_filter`
--
ALTER TABLE `wbc_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Indexes for table `wbc_product_image`
--
ALTER TABLE `wbc_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `wbc_product_option`
--
ALTER TABLE `wbc_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Indexes for table `wbc_product_option_value`
--
ALTER TABLE `wbc_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`);

--
-- Indexes for table `wbc_product_recurring`
--
ALTER TABLE `wbc_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- Indexes for table `wbc_product_related`
--
ALTER TABLE `wbc_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Indexes for table `wbc_product_reward`
--
ALTER TABLE `wbc_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Indexes for table `wbc_product_special`
--
ALTER TABLE `wbc_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `wbc_product_to_category`
--
ALTER TABLE `wbc_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `wbc_product_to_download`
--
ALTER TABLE `wbc_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Indexes for table `wbc_product_to_layout`
--
ALTER TABLE `wbc_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `wbc_product_to_store`
--
ALTER TABLE `wbc_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `wbc_recruit`
--
ALTER TABLE `wbc_recruit`
  ADD PRIMARY KEY (`recruit_id`);

--
-- Indexes for table `wbc_recruit_category`
--
ALTER TABLE `wbc_recruit_category`
  ADD PRIMARY KEY (`recruit_category_id`);

--
-- Indexes for table `wbc_recruit_category_description`
--
ALTER TABLE `wbc_recruit_category_description`
  ADD PRIMARY KEY (`recruit_category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `wbc_recruit_category_to_layout`
--
ALTER TABLE `wbc_recruit_category_to_layout`
  ADD PRIMARY KEY (`recruit_category_id`,`store_id`);

--
-- Indexes for table `wbc_recruit_category_to_store`
--
ALTER TABLE `wbc_recruit_category_to_store`
  ADD PRIMARY KEY (`recruit_category_id`,`store_id`);

--
-- Indexes for table `wbc_recruit_comment`
--
ALTER TABLE `wbc_recruit_comment`
  ADD PRIMARY KEY (`recruit_comment_id`);

--
-- Indexes for table `wbc_recruit_to_category`
--
ALTER TABLE `wbc_recruit_to_category`
  ADD PRIMARY KEY (`recruit_id`,`recruit_category_id`);

--
-- Indexes for table `wbc_recruit_to_layout`
--
ALTER TABLE `wbc_recruit_to_layout`
  ADD PRIMARY KEY (`recruit_id`,`store_id`);

--
-- Indexes for table `wbc_recurring`
--
ALTER TABLE `wbc_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- Indexes for table `wbc_recurring_description`
--
ALTER TABLE `wbc_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- Indexes for table `wbc_return`
--
ALTER TABLE `wbc_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `wbc_return_action`
--
ALTER TABLE `wbc_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Indexes for table `wbc_return_history`
--
ALTER TABLE `wbc_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Indexes for table `wbc_return_reason`
--
ALTER TABLE `wbc_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Indexes for table `wbc_return_status`
--
ALTER TABLE `wbc_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Indexes for table `wbc_review`
--
ALTER TABLE `wbc_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `wbc_revslider_attachment_images`
--
ALTER TABLE `wbc_revslider_attachment_images`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wbc_revslider_css`
--
ALTER TABLE `wbc_revslider_css`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wbc_revslider_layer_animations`
--
ALTER TABLE `wbc_revslider_layer_animations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wbc_revslider_settings`
--
ALTER TABLE `wbc_revslider_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wbc_revslider_sliders`
--
ALTER TABLE `wbc_revslider_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wbc_revslider_slides`
--
ALTER TABLE `wbc_revslider_slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wbc_revslider_static_slides`
--
ALTER TABLE `wbc_revslider_static_slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wbc_setting`
--
ALTER TABLE `wbc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `wbc_simple_blog_category`
--
ALTER TABLE `wbc_simple_blog_category`
  ADD PRIMARY KEY (`simple_blog_category_id`);

--
-- Indexes for table `wbc_simple_blog_category_description`
--
ALTER TABLE `wbc_simple_blog_category_description`
  ADD PRIMARY KEY (`simple_blog_category_description_id`);

--
-- Indexes for table `wbc_soconfig`
--
ALTER TABLE `wbc_soconfig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wbc_so_homeslider`
--
ALTER TABLE `wbc_so_homeslider`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `wbc_so_homeslider_description`
--
ALTER TABLE `wbc_so_homeslider_description`
  ADD PRIMARY KEY (`homeslider_id`,`language_id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `wbc_stock_status`
--
ALTER TABLE `wbc_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Indexes for table `wbc_store`
--
ALTER TABLE `wbc_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `wbc_tax_class`
--
ALTER TABLE `wbc_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Indexes for table `wbc_tax_rate`
--
ALTER TABLE `wbc_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Indexes for table `wbc_tax_rate_to_customer_group`
--
ALTER TABLE `wbc_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Indexes for table `wbc_tax_rule`
--
ALTER TABLE `wbc_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Indexes for table `wbc_theme`
--
ALTER TABLE `wbc_theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- Indexes for table `wbc_translation`
--
ALTER TABLE `wbc_translation`
  ADD PRIMARY KEY (`translation_id`);

--
-- Indexes for table `wbc_upload`
--
ALTER TABLE `wbc_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Indexes for table `wbc_url_404`
--
ALTER TABLE `wbc_url_404`
  ADD PRIMARY KEY (`url_404_id`),
  ADD KEY `query` (`query`(333));

--
-- Indexes for table `wbc_url_alias`
--
ALTER TABLE `wbc_url_alias`
  ADD PRIMARY KEY (`url_alias_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Indexes for table `wbc_url_redirect`
--
ALTER TABLE `wbc_url_redirect`
  ADD PRIMARY KEY (`url_redirect_id`),
  ADD KEY `query` (`query`(333)),
  ADD KEY `redirect` (`redirect`(333));

--
-- Indexes for table `wbc_user`
--
ALTER TABLE `wbc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `wbc_user_group`
--
ALTER TABLE `wbc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Indexes for table `wbc_voucher`
--
ALTER TABLE `wbc_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Indexes for table `wbc_voucher_history`
--
ALTER TABLE `wbc_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Indexes for table `wbc_voucher_theme`
--
ALTER TABLE `wbc_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Indexes for table `wbc_voucher_theme_description`
--
ALTER TABLE `wbc_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Indexes for table `wbc_weight_class`
--
ALTER TABLE `wbc_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Indexes for table `wbc_weight_class_description`
--
ALTER TABLE `wbc_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Indexes for table `wbc_zone`
--
ALTER TABLE `wbc_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `wbc_zone_to_geo_zone`
--
ALTER TABLE `wbc_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wbc_address`
--
ALTER TABLE `wbc_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_affiliate`
--
ALTER TABLE `wbc_affiliate`
  MODIFY `affiliate_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_affiliate_activity`
--
ALTER TABLE `wbc_affiliate_activity`
  MODIFY `affiliate_activity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_affiliate_login`
--
ALTER TABLE `wbc_affiliate_login`
  MODIFY `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_affiliate_transaction`
--
ALTER TABLE `wbc_affiliate_transaction`
  MODIFY `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_api`
--
ALTER TABLE `wbc_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wbc_api_ip`
--
ALTER TABLE `wbc_api_ip`
  MODIFY `api_ip_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_api_session`
--
ALTER TABLE `wbc_api_session`
  MODIFY `api_session_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_attribute`
--
ALTER TABLE `wbc_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `wbc_attribute_group`
--
ALTER TABLE `wbc_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `wbc_banner`
--
ALTER TABLE `wbc_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `wbc_banner_image`
--
ALTER TABLE `wbc_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;
--
-- AUTO_INCREMENT for table `wbc_blog`
--
ALTER TABLE `wbc_blog`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `wbc_blog_category`
--
ALTER TABLE `wbc_blog_category`
  MODIFY `blog_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `wbc_blog_comment`
--
ALTER TABLE `wbc_blog_comment`
  MODIFY `blog_comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `wbc_cart`
--
ALTER TABLE `wbc_cart`
  MODIFY `cart_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_category`
--
ALTER TABLE `wbc_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT for table `wbc_country`
--
ALTER TABLE `wbc_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `wbc_coupon`
--
ALTER TABLE `wbc_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `wbc_coupon_history`
--
ALTER TABLE `wbc_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_coupon_product`
--
ALTER TABLE `wbc_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_currency`
--
ALTER TABLE `wbc_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wbc_customer`
--
ALTER TABLE `wbc_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_customer_activity`
--
ALTER TABLE `wbc_customer_activity`
  MODIFY `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_customer_group`
--
ALTER TABLE `wbc_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wbc_customer_history`
--
ALTER TABLE `wbc_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_customer_ip`
--
ALTER TABLE `wbc_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_customer_login`
--
ALTER TABLE `wbc_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_customer_reward`
--
ALTER TABLE `wbc_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_customer_search`
--
ALTER TABLE `wbc_customer_search`
  MODIFY `customer_search_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_customer_transaction`
--
ALTER TABLE `wbc_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_custom_field`
--
ALTER TABLE `wbc_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_custom_field_value`
--
ALTER TABLE `wbc_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_dieutri`
--
ALTER TABLE `wbc_dieutri`
  MODIFY `dieutri_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `wbc_dieutri_category`
--
ALTER TABLE `wbc_dieutri_category`
  MODIFY `dieutri_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `wbc_dieutri_comment`
--
ALTER TABLE `wbc_dieutri_comment`
  MODIFY `dieutri_comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `wbc_download`
--
ALTER TABLE `wbc_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_event`
--
ALTER TABLE `wbc_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wbc_extension`
--
ALTER TABLE `wbc_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT for table `wbc_filter`
--
ALTER TABLE `wbc_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_filter_group`
--
ALTER TABLE `wbc_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_geo_zone`
--
ALTER TABLE `wbc_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wbc_information`
--
ALTER TABLE `wbc_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `wbc_language`
--
ALTER TABLE `wbc_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wbc_layout`
--
ALTER TABLE `wbc_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `wbc_layout_module`
--
ALTER TABLE `wbc_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6232;
--
-- AUTO_INCREMENT for table `wbc_layout_route`
--
ALTER TABLE `wbc_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
--
-- AUTO_INCREMENT for table `wbc_length_class`
--
ALTER TABLE `wbc_length_class`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wbc_location`
--
ALTER TABLE `wbc_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wbc_manufacturer`
--
ALTER TABLE `wbc_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `wbc_marketing`
--
ALTER TABLE `wbc_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_mega_menu`
--
ALTER TABLE `wbc_mega_menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT for table `wbc_menu`
--
ALTER TABLE `wbc_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_mfilter_tags`
--
ALTER TABLE `wbc_mfilter_tags`
  MODIFY `mfilter_tag_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_modification`
--
ALTER TABLE `wbc_modification`
  MODIFY `modification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `wbc_module`
--
ALTER TABLE `wbc_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=345;
--
-- AUTO_INCREMENT for table `wbc_option`
--
ALTER TABLE `wbc_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `wbc_option_value`
--
ALTER TABLE `wbc_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `wbc_order`
--
ALTER TABLE `wbc_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_order_custom_field`
--
ALTER TABLE `wbc_order_custom_field`
  MODIFY `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_order_history`
--
ALTER TABLE `wbc_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_order_option`
--
ALTER TABLE `wbc_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_order_product`
--
ALTER TABLE `wbc_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_order_recurring`
--
ALTER TABLE `wbc_order_recurring`
  MODIFY `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_order_recurring_transaction`
--
ALTER TABLE `wbc_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_order_status`
--
ALTER TABLE `wbc_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `wbc_order_total`
--
ALTER TABLE `wbc_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_order_voucher`
--
ALTER TABLE `wbc_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_page_form`
--
ALTER TABLE `wbc_page_form`
  MODIFY `page_form_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wbc_page_form_option`
--
ALTER TABLE `wbc_page_form_option`
  MODIFY `page_form_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `wbc_page_form_option_value`
--
ALTER TABLE `wbc_page_form_option_value`
  MODIFY `page_form_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `wbc_page_request`
--
ALTER TABLE `wbc_page_request`
  MODIFY `page_request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wbc_page_request_option`
--
ALTER TABLE `wbc_page_request_option`
  MODIFY `page_request_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `wbc_product`
--
ALTER TABLE `wbc_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `wbc_product_discount`
--
ALTER TABLE `wbc_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=441;
--
-- AUTO_INCREMENT for table `wbc_product_image`
--
ALTER TABLE `wbc_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2358;
--
-- AUTO_INCREMENT for table `wbc_product_option`
--
ALTER TABLE `wbc_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;
--
-- AUTO_INCREMENT for table `wbc_product_option_value`
--
ALTER TABLE `wbc_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT for table `wbc_product_reward`
--
ALTER TABLE `wbc_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=549;
--
-- AUTO_INCREMENT for table `wbc_product_special`
--
ALTER TABLE `wbc_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446;
--
-- AUTO_INCREMENT for table `wbc_recruit`
--
ALTER TABLE `wbc_recruit`
  MODIFY `recruit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `wbc_recruit_category`
--
ALTER TABLE `wbc_recruit_category`
  MODIFY `recruit_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `wbc_recruit_comment`
--
ALTER TABLE `wbc_recruit_comment`
  MODIFY `recruit_comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `wbc_recurring`
--
ALTER TABLE `wbc_recurring`
  MODIFY `recurring_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_return`
--
ALTER TABLE `wbc_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_return_action`
--
ALTER TABLE `wbc_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wbc_return_history`
--
ALTER TABLE `wbc_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_return_reason`
--
ALTER TABLE `wbc_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `wbc_return_status`
--
ALTER TABLE `wbc_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wbc_review`
--
ALTER TABLE `wbc_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_revslider_attachment_images`
--
ALTER TABLE `wbc_revslider_attachment_images`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_revslider_css`
--
ALTER TABLE `wbc_revslider_css`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `wbc_revslider_layer_animations`
--
ALTER TABLE `wbc_revslider_layer_animations`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_revslider_settings`
--
ALTER TABLE `wbc_revslider_settings`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_revslider_sliders`
--
ALTER TABLE `wbc_revslider_sliders`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wbc_revslider_slides`
--
ALTER TABLE `wbc_revslider_slides`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wbc_revslider_static_slides`
--
ALTER TABLE `wbc_revslider_static_slides`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_setting`
--
ALTER TABLE `wbc_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23065;
--
-- AUTO_INCREMENT for table `wbc_simple_blog_category`
--
ALTER TABLE `wbc_simple_blog_category`
  MODIFY `simple_blog_category_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `wbc_simple_blog_category_description`
--
ALTER TABLE `wbc_simple_blog_category_description`
  MODIFY `simple_blog_category_description_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `wbc_soconfig`
--
ALTER TABLE `wbc_soconfig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62218;
--
-- AUTO_INCREMENT for table `wbc_so_homeslider`
--
ALTER TABLE `wbc_so_homeslider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `wbc_so_homeslider_description`
--
ALTER TABLE `wbc_so_homeslider_description`
  MODIFY `homeslider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `wbc_stock_status`
--
ALTER TABLE `wbc_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `wbc_store`
--
ALTER TABLE `wbc_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_tax_class`
--
ALTER TABLE `wbc_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `wbc_tax_rate`
--
ALTER TABLE `wbc_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `wbc_tax_rule`
--
ALTER TABLE `wbc_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT for table `wbc_theme`
--
ALTER TABLE `wbc_theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_translation`
--
ALTER TABLE `wbc_translation`
  MODIFY `translation_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_upload`
--
ALTER TABLE `wbc_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_url_404`
--
ALTER TABLE `wbc_url_404`
  MODIFY `url_404_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `wbc_url_alias`
--
ALTER TABLE `wbc_url_alias`
  MODIFY `url_alias_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1118;
--
-- AUTO_INCREMENT for table `wbc_url_redirect`
--
ALTER TABLE `wbc_url_redirect`
  MODIFY `url_redirect_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_user`
--
ALTER TABLE `wbc_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wbc_user_group`
--
ALTER TABLE `wbc_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `wbc_voucher`
--
ALTER TABLE `wbc_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_voucher_history`
--
ALTER TABLE `wbc_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wbc_voucher_theme`
--
ALTER TABLE `wbc_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `wbc_weight_class`
--
ALTER TABLE `wbc_weight_class`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `wbc_zone`
--
ALTER TABLE `wbc_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=975;
--
-- AUTO_INCREMENT for table `wbc_zone_to_geo_zone`
--
ALTER TABLE `wbc_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
