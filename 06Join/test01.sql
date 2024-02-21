DROP TABLE `new_review`;
DROP TABLE `store`;
CREATE TABLE `new_review` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `storeId` INT NOT NULL,
    `menu` VARCHAR(32) NOT NULL,
    `userName` VARCHAR(32) NOT NULL, 
    `point` DECIMAL(2, 1) DEFAULT 3.5,
    `review` VARCHAR(256),
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `store` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(32) NOT NULL, 
    `phoneNumber` VARCHAR(16) NOT NULL,
    `address` VARCHAR(64) NOT NULL,
    `businessNumber` VARCHAR(32) NOT NULL,
    `introduce` TEXT, 
    `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `store` 
(`name`, `phoneNumber`, `address`, `businessNumber`, `introduce`)
VALUES ("교촌치킨", '02-000-0000', '서울시 서초구', '111-111-1111', '항상 맛있는 닭을 선사 합니다.'),
("BHC", '02-111-0000', '서울시 서초구', '111-222-1111', '전지현씨 BHC'),
("버거킹", '02-222-1111', '서울시 서초구', '333-222-12222', '맥도날드 가지말고 여기로와요'),
("도미노피자", '02-222-2222', '서울시 서초구', '111-222-12222', '방문포장 반값!!!'),
("피자알볼로", '02-000-1111', '서울시 서초구', '123-010-12222', NULL),
("할머니순대국", '02-123-4567', '서울시 서초구', '100-200-14000', '12시간 푹고은 육수'),
("배달삼겹", '02-222-8888', '서울시 서초구', '333-5454-9999', '우리돼지 한돈만 사용합니다!!'),
("가장맛있는족발", '02-012-8080', '서울시 서초구', '133-253-1243', '리뷰이벤트 막국수 드려요!!');

INSERT INTO `new_review` 
(`storeId`, `menu`, `userName`, `point`, `review`) 
VALUES 
(1, '오리지날 콤보', '이병헌', 4.5, '콤보는 항상 진리입니다.'),
(2, '핫후라이드', '전지현', 5, NULL),
(2, '뿌링클', '이정재', 3.5, '내가 뿌링클 상인가?'),
(3, '와퍼세트', '이병헌', 4.0, '패티 너무좋아요'),
(1, '오리지날 콤보', '맛있으면짖는개', 4.5, '왈왈왈!! 왈왈!'),
(2, '뿌링클', '전지현', 5, NULL),
(8, '족발(앞다리)', '이병헌', 4.5, '막국수 서비스 좋아요!'),
(7, '삼겹혼밥세트', '정우성', 4.0, '항상 맛있어요 같이오는 김치찌개 짱맛'),
(2, '마쵸킹', '전지현', 5, NULL),
(1, '오리지날 콤보', '정우성', 4.5, NULL),
(4, '도미노피자', '이정재', 4.5, '피자알볼로보다 맛있어요'),
(5, '피자알볼로', '이정재', 4.5, '도미노피자 보다 맛있어요'),
(7, '삼겹혼밥세트', '이병헌', 4.0, NULL),
(8, '매운족발', '정우성', 4.5, '메뉴가 반반족발로 잘못왔어요. 맛있어서 그냥 먹었어요'),
(7, '삽겹이인세트', '이정재', 1.5, '다탔어!! XX 열받네'),
(5, '피자알볼로', '맛있으면짖는개', 3.0, '....'),
(2, '뿌링클', '전지현', 5, NULL),
(8, '족발(앞다리)', '이병헌', 4.5, '빠른배달 칭찬해!'),
(7, '목살 고기만', '이정재', 2.0, '고기가 덜익어서 왔어요!'),
(4, '도미노피자', '맛있으면짖는개', 4.5, '왈왈왈!! 왈왈!!'), 
(8, '반반족발', '이병헌', 3.5, NULL);

-- 1.
SELECT a.name, a.phoneNumber, b.menu, b.userName, b.point, b.review
FROM `store` AS a
JOIN `new_review` AS b
ON a.id = b.storeId;

-- 2. 
SELECT a.name, a.phoneNumber, b.menu, b.userName, b.point, b.review
FROM `store` AS a
LEFT JOIN `new_review` AS b
ON a.id = b.storeId;

-- 3. 
SELECT * FROM `store`;
SELECT * FROM `new_review`;

SELECT a.name, b.userName, b.point, b.review
FROM `store` AS a
JOIN `new_review` AS b
ON a.id = b.storeId
WHERE a.name = '배달삼겹' AND b.point < 3.0;

-- 4. 
SELECT a.name, b.menu, b.point, b.review
FROM `store` AS a
JOIN `new_review` AS b
ON a.id = b.storeId
WHERE b.userName = '이병헌' AND b.point >= 4.5 AND b.review IS NOT NULL;

-- 5. 
SELECT a.name, a.phoneNumber, avg(b.point) AS averagePoint 
FROM `store` AS a
JOIN `new_review` AS b
ON a.id = b.storeId
GROUP BY a.id
ORDER BY averagePoint DESC
LIMIT 5;












