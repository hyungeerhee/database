SELECT * FROM `score`;

-- 1. 점수 업데이트
UPDATE `score` 
SET
	`score` = 100,
    `updatedAt` = now()
WHERE 
	`id` = 5;
    
-- 2. 
UPDATE `score` 
SET
	`score` = 85,
    `updatedAt` = now()
WHERE 
	`name` = '이광수' AND `semester` = 2 AND `year` = 2019;

-- 3. 
SELECT * FROM `review`;
UPDATE `review` 
SET
	`review` = '역시 치킨은 BBQ 인정!',
    `updatedAt` = now()
WHERE 
	`id` = 10;

-- 4.
UPDATE `review` 
SET
	`point` = 4.5,
    `review` = '식어도 맛있어요!!',
    `updatedAt` = now()
WHERE 
	`id` = 8;







	
	