-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 22, 2022 at 08:09 AM
-- Server version: 10.3.35-MariaDB-cll-lve
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `angrycom_mytutor`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_carts`
--

CREATE TABLE `tbl_carts` (
  `cart_id` int(5) NOT NULL,
  `subject_id` int(5) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `cart_qty` int(6) NOT NULL,
  `cart_status` varchar(10) DEFAULT NULL,
  `receipt_id` varchar(10) DEFAULT NULL,
  `cart_date` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_carts`
--

INSERT INTO `tbl_carts` (`cart_id`, `subject_id`, `user_email`, `cart_qty`, `cart_status`, `receipt_id`, `cart_date`) VALUES
(57, 3, 'shongjunwei@gmail.com', 2, 'paid', 'iygmchyp', '2022-07-10 06:15:37.533267'),
(58, 2, 'shongjunwei@gmail.com', 1, 'paid', 'iygmchyp', '2022-07-10 06:15:43.160604'),
(59, 4, 'shongjunwei@gmail.com', 1, 'paid', 'iygmchyp', '2022-07-10 06:15:46.435243'),
(60, 19, 'shongjunwei@gmail.com', 1, 'paid', 'iygmchyp', '2022-07-10 06:15:56.560131'),
(61, 20, 'shongjunwei@gmail.com', 2, 'paid', 'iygmchyp', '2022-07-10 06:16:03.849292'),
(62, 21, 'shongjunwei@gmail.com', 3, 'paid', 'iygmchyp', '2022-07-10 06:16:10.305115'),
(63, 22, 'shongjunwei@gmail.com', 2, 'paid', 'iygmchyp', '2022-07-10 06:16:23.214708'),
(64, 6, 'shongjunwei@gmail.com', 1, 'paid', 'iygmchyp', '2022-07-10 06:16:34.014143'),
(65, 7, 'shongjunwei@gmail.com', 1, 'paid', 'iygmchyp', '2022-07-10 06:16:39.514351'),
(66, 5, 'shongjunwei@gmail.com', 1, 'paid', 'iygmchyp', '2022-07-10 06:16:46.745749'),
(67, 13, 'shongjunwei@gmail.com', 1, 'paid', 'iygmchyp', '2022-07-10 06:16:53.368392'),
(68, 12, 'shongjunwei@gmail.com', 1, 'paid', 'iygmchyp', '2022-07-10 06:16:58.286396'),
(69, 3, 'shongjunwei@gmail.com', 2, 'paid', 'tut0g0gi', '2022-07-10 06:24:29.695142'),
(70, 2, 'shongjunwei@gmail.com', 1, 'paid', 'tut0g0gi', '2022-07-10 06:24:34.947428'),
(71, 4, 'shongjunwei@gmail.com', 1, 'paid', 'tut0g0gi', '2022-07-10 06:24:37.820324'),
(77, 7, 'shongjunwei@gmail.com', 1, 'paid', 'tut0g0gi', '2022-07-10 06:25:30.655624'),
(78, 5, 'shongjunwei@gmail.com', 1, 'paid', 'tut0g0gi', '2022-07-10 06:25:39.301314'),
(79, 13, 'shongjunwei@gmail.com', 1, 'paid', 'tut0g0gi', '2022-07-10 06:25:46.812194'),
(80, 12, 'shongjunwei@gmail.com', 1, 'paid', 'tut0g0gi', '2022-07-10 06:26:00.485630'),
(91, 1, 'shongjunwei@gmail.com', 2, 'paid', 'ogiiikkq', '2022-07-10 14:12:42.161165'),
(93, 13, 'shongjunwei@gmail.com', 2, 'paid', 'ogiiikkq', '2022-07-10 14:13:12.491691'),
(95, 5, 'shongjunwei@gmail.com', 1, 'paid', 'ogiiikkq', '2022-07-10 14:13:58.795796'),
(97, 4, 'shongjunwei@gmail.com', 3, 'paid', 's0ijqlie', '2022-07-10 14:21:06.207071'),
(99, 16, 'shongjunwei@gmail.com', 1, 'paid', 's0ijqlie', '2022-07-10 14:21:35.537118'),
(100, 22, 'shongjunwei@gmail.com', 2, 'paid', 's0ijqlie', '2022-07-10 14:21:44.360166'),
(140, 2, 'shongjunwei@gmail.com', 2, 'paid', 'plsne5k3', '2022-07-10 15:17:54.872919'),
(142, 13, 'shongjunwei@gmail.com', 2, 'paid', 'plsne5k3', '2022-07-10 15:18:35.387303'),
(143, 14, 'shongjunwei@gmail.com', 2, 'paid', 'plsne5k3', '2022-07-10 15:18:37.953228'),
(144, 22, 'shongjunwei@gmail.com', 1, 'paid', 'plsne5k3', '2022-07-10 15:18:44.263152'),
(145, 1, 'shongjunwei@gmail.com', 2, 'paid', 'qnda2h0s', '2022-07-10 15:25:38.228451'),
(146, 2, 'shongjunwei@gmail.com', 2, 'paid', 'qnda2h0s', '2022-07-10 15:25:46.901371'),
(148, 13, 'shongjunwei@gmail.com', 1, 'paid', 'qnda2h0s', '2022-07-10 15:26:19.891476'),
(150, 22, 'shongjunwei@gmail.com', 2, 'paid', 'qnda2h0s', '2022-07-10 15:26:31.829697'),
(166, 2, 'shongjunwei@gmail.com', 2, 'paid', 'grryzsuq', '2022-07-10 15:49:30.725341'),
(167, 3, 'shongjunwei@gmail.com', 2, 'paid', 'grryzsuq', '2022-07-10 15:49:57.351310'),
(168, 13, 'shongjunwei@gmail.com', 2, 'paid', 'grryzsuq', '2022-07-10 15:50:21.071893'),
(170, 22, 'shongjunwei@gmail.com', 1, 'paid', 'grryzsuq', '2022-07-10 15:50:33.951867'),
(171, 1, 'shongjunwei@gmail.com', 1, 'paid', '4xce50wf', '2022-07-10 15:57:21.759008'),
(172, 2, 'shongjunwei@gmail.com', 1, 'paid', '4xce50wf', '2022-07-10 15:57:23.360292'),
(173, 0, '', 1, NULL, NULL, '2022-07-10 18:16:50.566185'),
(175, 2, 'shongjunwei@gmail.com', 1, 'paid', 'hl9tt4rn', '2022-07-11 00:29:49.656370'),
(176, 1, 'shongjunwei@gmail.com', 1, 'paid', 'g0h0llyz', '2022-07-11 00:30:53.631552'),
(177, 2, 'shongjunwei@gmail.com', 1, 'paid', 'g0h0llyz', '2022-07-11 00:30:54.944756'),
(178, 1, 'shongjunwei@gmail.com', 2, 'paid', '90i0nyfe', '2022-07-11 00:36:07.976250'),
(179, 3, 'shongjunwei@gmail.com', 1, 'paid', 'chtxhkma', '2022-07-15 20:07:59.837866'),
(180, 1, 'shongjunwei@gmail.com', 1, 'paid', 'chtxhkma', '2022-07-15 22:43:26.168917'),
(181, 2, 'laicheehong910@yahoo.com', 1, NULL, NULL, '2022-07-15 22:46:09.535963'),
(182, 2, 'weijunxin10@gmail.com', 3, NULL, NULL, '2022-07-16 12:08:00.571313'),
(183, 4, 'ahboy0420@gmail.com', 1, 'paid', 'cpb0rplc', '2022-07-18 22:25:39.538907'),
(184, 1, 'ahboy0420@gmail.com', 1, NULL, NULL, '2022-07-18 22:26:30.719751'),
(187, 4, 'elvisjn735@gmail.com', 1, 'paid', 'bkvxf4l0', '2022-07-19 18:41:07.875902'),
(189, 2, 'elvisjn735@gmail.com', 1, 'paid', 'bkvxf4l0', '2022-07-19 18:43:52.025093'),
(190, 2, 'shongjunwei@gmail.com', 1, NULL, NULL, '2022-07-22 07:57:17.776573');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_infor`
--

CREATE TABLE `tbl_infor` (
  `user_id` int(5) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_number` varchar(15) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_address` varchar(70) NOT NULL,
  `user_otp` varchar(5) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_infor`
--

INSERT INTO `tbl_infor` (`user_id`, `user_email`, `user_name`, `user_number`, `user_password`, `user_address`, `user_otp`) VALUES
(131, 'elbertjn12@gmail.com', 'elbert', '0176346060', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'No.36, Jalan Perak 13, Taman Bandar Baru Selatan, 31900 Kampar, Perak.', '1'),
(134, 'angjiawei1999@gmail.com', 'jia wei', '11111111', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'uum', '1'),
(135, 'elvisjn735@gmail.com', 'elvis', '0125425050', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'uum', '1'),
(136, 'yeezhenhong3@gmail.com', 'zhen hong', '123456', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'uum', '1'),
(137, '', '', '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '', '1'),
(139, 'runniejackson@gmail.com', 'chaijiesheng', '0161234567', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'yum ', '1'),
(141, 'shongjunwei@gmail.com', 'wei jun shong', '0165425050', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'No.36,Jalan Perak 13,Taman Bandar Baru Selatan,31900 Kampar,Perak', '1'),
(142, 'laicheehong910@yahoo.com', 'lcho', '0111', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'home', '1'),
(143, 'weijunxin10@gmail.com', 'wjx', '011111', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'bb selatan', '1'),
(144, 'ahboy0420@gmail.com', 'raymond', '0182722657', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'asdfghjkl', '1'),
(145, 'elvisjn736@gmail.com', 'jn', '011111', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'h', '97144');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `order_id` int(5) NOT NULL,
  `receipt_id` varchar(10) DEFAULT NULL,
  `user_email` varchar(50) NOT NULL,
  `order_paid` float NOT NULL,
  `order_status` varchar(10) NOT NULL,
  `order_date` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`order_id`, `receipt_id`, `user_email`, `order_paid`, `order_status`, `order_date`) VALUES
(1, 'j0cd3iq0', 'elvisjn735@gmail.com', 2950, 'Paid', '2022-07-09 19:53:03.445408'),
(2, 'my9ckl98', 'elvisjn735@gmail.com', 430, 'Paid', '2022-07-09 19:50:03.445408'),
(3, '6nkqjv0r', 'elvisjn735@gmail.com', 330, 'Paid', '2022-07-09 19:54:03.445408'),
(4, 'tage0cbu', 'elvisjn735@gmail.com', 150, 'Paid', '2022-07-09 20:26:25.795928'),
(5, 'ewsizb5s', 'elvisjn735@gmail.com', 200, 'Paid', '2022-07-09 20:27:27.178485'),
(6, '4e0l0szt', 'elvisjn735@gmail.com', 180, 'Paid', '2022-07-09 20:30:10.632483'),
(7, '0uush00n', 'elvisjn735@gmail.com', 200, 'Paid', '2022-07-09 20:36:20.089921'),
(8, 'zs7wmyum', 'elvisjn735@gmail.com', 450, 'Paid', '2022-07-09 21:25:58.222572'),
(9, '87jin6h8', 'elvisjn735@gmail.com', 450, 'Paid', '2022-07-09 21:45:31.189849'),
(10, 'k9zq3lr2', 'elvisjn735@gmail.com', 700, 'Paid', '2022-07-09 22:04:39.761948'),
(11, 'wyjfzmsm', 'elvisjn735@gmail.com', 200, 'Paid', '2022-07-09 22:05:28.030693'),
(20, 'grryzsuq', 'shongjunwei@gmail.com', 1240, 'Paid', '2022-07-10 15:55:23.169341'),
(21, '4xce50wf', 'shongjunwei@gmail.com', 450, 'Paid', '2022-07-11 00:24:57.499647'),
(22, 'hl9tt4rn', 'shongjunwei@gmail.com', 200, 'Paid', '2022-07-11 00:30:06.471672'),
(23, 'g0h0llyz', 'shongjunwei@gmail.com', 450, 'Paid', '2022-07-11 00:32:48.122594'),
(24, '90i0nyfe', 'shongjunwei@gmail.com', 500, 'Paid', '2022-07-14 14:11:11.721145'),
(25, 'chtxhkma', 'shongjunwei@gmail.com', 430, 'Paid', '2022-07-15 22:43:38.406496'),
(26, 'cpb0rplc', 'ahboy0420@gmail.com', 150, 'Paid', '2022-07-18 22:25:56.903718'),
(27, 'bkvxf4l0', 'elvisjn735@gmail.com', 350, 'Paid', '2022-07-19 18:44:34.636233');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subjects`
--

CREATE TABLE `tbl_subjects` (
  `subject_id` int(4) NOT NULL,
  `subject_name` varchar(150) NOT NULL,
  `subject_description` varchar(500) NOT NULL,
  `subject_price` float NOT NULL,
  `tutor_id` varchar(4) NOT NULL,
  `subject_sessions` int(3) NOT NULL,
  `subject_rating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_subjects`
--

INSERT INTO `tbl_subjects` (`subject_id`, `subject_name`, `subject_description`, `subject_price`, `tutor_id`, `subject_sessions`, `subject_rating`) VALUES
(1, 'Programming 101', 'Basic programming for new student with no background in programming.', 250, '1', 15, 4.5),
(2, 'Programming 201', 'Intermediate programming course that aim for those who has basic programming knowledge.', 200, '2', 10, 4),
(3, 'Introduction to Web programming ', 'Basic introduction to HTML, CSS, JavaScript, PHP and MySQL.', 180, '5', 15, 3.8),
(4, 'Web programming advanced', 'Course aim for those who are familiar with basic web programming.', 150, '3', 15, 4.2),
(5, 'Python for Everybody', 'This Specialization builds on the success of the Python for Everybody course and will introduce fundamental programming concepts including data structures, networked application program interfaces, and databases, using the Python programming language.', 120, '6', 5, 4.5),
(6, 'Introduction to Computer Science', 'This specialisation covers topics ranging from basic computing principles to the mathematical foundations required for computer science. ', 180, '3', 10, 4.2),
(7, 'Code Yourself! An Introduction to Programming', 'This course will teach you how to program in Scratch, an easy to use visual programming language. More importantly, it will introduce you to the fundamental principles of computing and it will help you think like a software engineer.', 120, '4', 5, 4),
(8, 'IBM Full Stack Software Developer Professional Certificate', 'ickstart your career in application development. Master Cloud Native and Full Stack Development using hands-on projects involving HTML, JavaScript, Node.js, Python, Django, Containers, Microservices and more. No prior experience required.', 230, '8', 8, 4.3),
(9, 'Graphic Design Specialization', 'his four-course sequence exposes students to the fundamental skills required to make sophisticated graphic design: process, historical context, and communication through image-making and typography. T', 200, '1', 5, 4.2),
(10, 'Fundamentals of Graphic Design', 'At the end of this course you will have learned how to explore and investigate visual representation through a range of image-making techniques; understand basic principles of working with shape, color and pattern; been exposed to the language and skills of typography; and understand and have applied the principles of composition and visual contrast. ', 150, '2', 5, 3.8),
(11, 'Fundamentals of Graphic Design', 'Project centered courses are designed specifically to help you complete a personally meaningful real-world project, with your instructor and a community of like-minded learners providing guidance and suggestions along the way.', 150, '5', 5, 4.8),
(12, 'Full-Stack Web Development with React', 'Learners will work on hands-on exercises, culminating in development of a full-fledged application at the end of each course. Each course also includes a mini-Capstone Project as part of the Honors Track where youâ€™ll apply your skills to build a fully functional project.', 250, '7', 10, 4.2),
(13, 'Software Design and Architecture', 'In the Software Design and Architecture Specialization, you will learn how to apply design principles, patterns, and architectures to create reusable and flexible software applications and systems. You will learn how to express and document the design and architecture of a software system using a visual notation.', 170, '8', 3, 4.2),
(14, 'Software Testing and Automation', 'Learners will build test plans, test suites, and test analysis reports. Learners will develop properties and assertions in code to facilitate automated test generation. Learners will also create pre-conditions for methods to facilitate formal proofs of correctness.', 170, '9', 5, 4.1),
(15, 'Introduction to Cyber Security', 'The learning outcome is simple: We hope learners will develop a lifelong passion and appreciation for cyber security, which we are certain will help in future endeavors. ', 200, '9', 5, 4.2),
(16, 'Introduction to Artificial Intelligence', 'A brief introduction to artificial intelligence for basic computer science or IT students.', 120, '10', 11, 3.8),
(17, 'Data Structures and Algorithms', 'This course will learn about the types of algorithm which will be useful during the development of the interface. It consists of array, list, binary search tree, hashing and some other related topics.', 130, '11', 12, 3.9),
(19, 'Basic Introduction to R', 'In this course, you will be exposed to fundamental programming concepts in R. After the basics, you\'ll learn how to organize, modify and clean data frames, a useful data structure in R. Then you\'ll learn how to create data visualizations to showcase insights in data!', 150, '13', 14, 4.1),
(20, 'C Programming Language', 'This course focusses on the internal architecture of a computer, how computer stores and retrieves information. After learning C, it will be much easier to learn other programming languages like Java, Python, etc. ', 160, '14', 15, 4.2),
(21, 'Database Analytics', 'Data Analytics in this course concentrates on making insightful conclusions from raw data. Many of the techniques and processes of data analytics have been automated into mechanical processes and algorithms that work over raw data for human consumption', 170, '15', 16, 4.3),
(22, 'Computer Organization and Operating System', 'This course will learn about the basic computer systems which includes dividing the partitions. Students will also learn about the operating systems where linux are required to be installed.', 140, '12', 13, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tutors`
--

CREATE TABLE `tbl_tutors` (
  `tutor_id` int(5) NOT NULL,
  `tutor_email` varchar(50) NOT NULL,
  `tutor_phone` varchar(15) NOT NULL,
  `tutor_name` varchar(50) NOT NULL,
  `tutor_password` varchar(40) NOT NULL,
  `tutor_description` varchar(300) NOT NULL,
  `tutor_datereg` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_tutors`
--

INSERT INTO `tbl_tutors` (`tutor_id`, `tutor_email`, `tutor_phone`, `tutor_name`, `tutor_password`, `tutor_description`, `tutor_datereg`) VALUES
(1, 'prashanthini@mytutor.com.my', '+60188816970', 'Prashanthini a/l Manjit Ramasamy', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Nunc venenatis bibendum odio, in fermentum sem ultrices sed. Integer in quam turpis. Curabitur sed euismod sem, sed fringilla arcu. Sed justo felis, hendrerit eget elit ac, consequat sodales nibh.', '2022-06-02 10:29:14.000000'),
(2, 'sinnathuray.bakzi@yang.com', '+601132339126', 'Chai Tan Hiu', '86e40acfd92d4c5f44de76963ab68208ef0ab389', 'Integer nulla dui, blandit eu sollicitudin vitae, malesuada at est. Curabitur varius nisl vitae felis sagittis, sit amet porta urna mollis. Proin venenatis justo lorem, vitae tincidunt dui pharetra vel.', '2022-05-24 15:21:25.000000'),
(3, 'huzir42@bakry.org', '+6095798898', 'Nur Maya binti Aidil Hafizee ', '02dd38ccd56a4efbe22f4599f4717a8cf3eb9281', 'Maecenas vitae leo in ipsum pulvinar hendrerit vitae ac urna. Maecenas consequat aliquet leo pulvinar tincidunt. Vivamus placerat neque sit amet hendrerit feugiat.', '2022-03-03 15:21:25.000000'),
(4, 'dkok@majid.biz', '+60377236036', 'Ling Liang Thok', '76b241504f3904db725c01fcc532c2bdfae609ae', 'Aliquam dignissim ut libero non aliquet. Etiam eu ultricies enim. Phasellus gravida ac libero in porta. Phasellus tincidunt feugiat est, quis pellentesque risus eleifend vitae.', '2022-06-09 21:47:05.000000'),
(5, 'melissa57@hotmail.com', '+6069427992', 'Teoh Chum Liek', '86e40acfd92d4c5f44de76963ab68208ef0ab389', 'Morbi at turpis in quam gravida facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ac nisl lorem. ', '2022-06-27 21:48:25.000000'),
(6, 'azizy.kavita@foong.info', '+60152045292', 'Amirah binti Che Aznizam', '02dd38ccd56a4efbe22f4599f4717a8cf3eb9281', 'Nullam sed fringilla nisl. Proin aliquet metus quis ornare faucibus. Proin non mauris maximus, mollis enim non, bibendum nibh. Morbi feugiat fermentum imperdiet. ', '2022-03-03 15:21:25.000000'),
(7, 'teoki57@hotmail.com', '+6069427992', 'Teoh Chum Liek', '86e40acfd92d4c5f44de76963ab68208ef0ab389', 'Morbi at turpis in quam gravida facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ac nisl lorem. ', '2022-06-27 21:48:25.000000'),
(8, 'nelson.jaini@parthiban.info', '+60102727980', 'Muhammet Firdaus Miskoulan bin Jamal', 'b4b9c99d312bf05bfb05341d981d6a17ace24b51', 'Duis at iaculis ante. Praesent in risus blandit, tempus nibh eu, imperdiet nunc. Ut quis lobortis quam. Nullam sed purus eros. Donec ac viverra orci. Pellentesque non neque et tellus gravida interdum', '2022-05-29 22:10:53.000000'),
(9, 'vetils@veerasamy.com', '+6089-64 4857', 'P. Veetil a/l Ramadas', '49bd6349e19baa02a3adb1d770cb873fcca2cf38', 'Proin venenatis justo lorem, vitae tincidunt dui pharetra vel. Duis ultricies gravida condimentum. Phasellus pellentesque sodales dolor, dictum pulvinar felis convallis ut.', '2022-06-15 22:11:49.000000'),
(10, 'alynnayap@gmail.com', '+60165426878', 'Yap Jia Jin', '6367C48DD193D56EA7B0BAAD25B19455E529F5EE', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia', '2022-06-23 00:37:16.000000'),
(11, 'jiayin@gmail.com', '+60102727998', 'Chai Jia Yin', 'C9B359951C09C5D04DE4F852746671AB2B2D0994', 'consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem', '2022-06-23 01:02:17.000000'),
(12, 'jamesbd@gmail.com', '+60356727980', 'James Bond', '701B389B848A2B1CFAB867093101D8D5AC56ADDD', 'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur', '2022-06-23 01:02:17.000000'),
(13, 'janemary@gmail.com', '+60102739980', 'Mary Jane', '370194FF6E0F93A7432E16CC9BADD9427E8B4E13', 'Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur', '2022-06-23 01:02:17.000000'),
(14, 'Jcamilia@gmail.com', '+60101567980', 'Jessica Camilia', '0151620B927A79F7658D3EFC4572E3566A92546D', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat', '2022-06-23 01:02:17.000000'),
(15, 'Jydrichard@gmail.com', '+60102726570', 'Jayden Richard', '62D0F59B1DF3634412CCEB717635B4F701E812F3', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2022-06-23 01:02:17.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_carts`
--
ALTER TABLE `tbl_carts`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `tbl_infor`
--
ALTER TABLE `tbl_infor`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_subjects`
--
ALTER TABLE `tbl_subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `tbl_tutors`
--
ALTER TABLE `tbl_tutors`
  ADD PRIMARY KEY (`tutor_id`),
  ADD UNIQUE KEY `tutor_email` (`tutor_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_carts`
--
ALTER TABLE `tbl_carts`
  MODIFY `cart_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `tbl_infor`
--
ALTER TABLE `tbl_infor`
  MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `order_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_subjects`
--
ALTER TABLE `tbl_subjects`
  MODIFY `subject_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_tutors`
--
ALTER TABLE `tbl_tutors`
  MODIFY `tutor_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
