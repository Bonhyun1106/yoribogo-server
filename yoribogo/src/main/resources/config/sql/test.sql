-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- tb_member Table Create SQL
----------------------------------------Naming Convention-------------------------------------------
--1. foriegn key 
--ex> tb_recipe의 mem_no는 tb_member의 mem_no를 참조함
--		FK_recipe_mem_no_member
--		FK 참조테이블_컬럼명_피참조테이블
--
--2. sequence
--ex> tb_member의 mem_no -> s_tb_member_no;
CREATE TABLE tb_member
(
    mem_no`            number           NOT NULL    COMMENT '회원번호', 
    mem_id`            VARCHAR2(10)     NOT NULL    COMMENT '아이디 10자', 
    mem_password`      VARCHAR2(12)     NOT NULL    COMMENT '비번 12자', 
    mem_email`         VARCHAR2(45)     NOT NULL    COMMENT '이메일 45자', 
    mem_favor1`        VARCHAR2(45)     NULL        COMMENT '선호1', 
    mem_favor2`        VARCHAR2(45)     NULL        COMMENT '선호2', 
    mem_favor3`        VARCHAR2(45)     NULL        COMMENT '선호3', 
    mem_join_date`     DATE             NOT NULL    COMMENT '회원가입일', 
    mem_profile`       VARCHAR2(110)    NULL        COMMENT '프로필사진', 
    mem_report_count`  number(5)        NOT NULL    COMMENT 'default=0', 
    PRIMARY KEY (mem_no)
);

ALTER TABLE tb_member COMMENT '회원';

create sequence s_tb_member_no;

-- tb_recipe Table Create SQL
CREATE TABLE tb_recipe
(
	recipe_no        number           NOT NULL    COMMENT '레시피번호', 
	recipe_title     VARCHAR2(45)     NOT NULL    COMMENT '레시피제목', 
	recipe_summary   VARCHAR2(200)    NOT NULL    COMMENT '레시피요약', 
	mem_no           number           NOT NULL    COMMENT '작성회원번호', 
	recipe_view_cnt  number           NOT NULL    COMMENT 'default=0', 
	recipe_like_cnt  number           NOT NULL    COMMENT 'default=0', 
	recipe_reg_date  DATE             NULL        COMMENT '게시글작성날짜', 
	recipe_country   number           NOT NULL    COMMENT '양식', 
	recipe_type      number           NOT NULL    COMMENT '종류', 
	recipe_kcal      number           NOT NULL    COMMENT '열량', 
	recipe_time      number           NOT NULL    COMMENT '조리시간', 
	recipe_level     number           NOT NULL    COMMENT '난이도', 
	recipe_weather   number           NOT NULL    COMMENT '날씨', 
    PRIMARY KEY (recipe_no)
);

ALTER TABLE tb_recipe COMMENT '게시글';

ALTER TABLE tb_recipe
    ADD CONSTRAINT FK_recipe_mem_no_member FOREIGN KEY (mem_no)
        REFERENCES tb_member (mem_no) ON DELETE RESTRICT ON UPDATE RESTRICT;
        
create sequence s_tb_recipe_no;
        
        
-- tb_category Table Create SQL
CREATE TABLE tb_category
(
    category_no       number           NOT NULL    COMMENT '카테고리번호', 
    category_name     VARCHAR2(100)    NOT NULL    COMMENT '요소 이름', 
    category_dist_no  number           NOT NULL    COMMENT '요소분류 번호', 
    PRIMARY KEY (category_no)
);

ALTER TABLE tb_category COMMENT '범주';

create sequence s_tb_category_no;

-- tb_comment Table Create SQL
CREATE TABLE tb_comment
(
    comment_no            number           NOT NULL    COMMENT '댓글번호', 
    recipe_no             number           NOT NULL    COMMENT '참조글번호', 
    mem_no                number           NOT NULL    COMMENT '회원번호', 
    comment_like_cnt      number           NOT NULL    COMMENT '좋아요수', 
    comment_reg_date      DATE             NOT NULL    COMMENT '댓글작성날짜', 
    comment_content       VARCHAR2(120)    NOT NULL    COMMENT '댓글내용', 
    comment_report_count  number           NOT NULL    COMMENT '댓글신고횟수', 
    PRIMARY KEY (comment_no)
);

ALTER TABLE tb_comment COMMENT '댓글';

ALTER TABLE tb_comment
    ADD CONSTRAINT FK_comment_recipe_no_recipe FOREIGN KEY (recipe_no)
        REFERENCES tb_recipe (recipe_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE tb_comment
    ADD CONSTRAINT FK_comment_mem_no_member FOREIGN KEY (mem_no)
        REFERENCES tb_member (mem_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

create sequence s_tb_comment_no;

-- tb_like Table Create SQL
CREATE TABLE tb_like
(
    like_no    number    NOT NULL    COMMENT '번호', 
    mem_no     number    NOT NULL    COMMENT '회원번호', 
    recipe_no  number    NOT NULL    COMMENT '1-재료/2-양식/3-종류/4-열량/5-조리시간/6-추천날씨/7-난이도/8-주의사항', 
    PRIMARY KEY (like_no)
);

ALTER TABLE tb_like COMMENT '좋아요테이블';

ALTER TABLE tb_like
    ADD CONSTRAINT FK_like_mem_no_member FOREIGN KEY (mem_no)
        REFERENCES tb_member (mem_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE tb_like
    ADD CONSTRAINT FK_like_recipe_no_recipe FOREIGN KEY (recipe_no)
        REFERENCES tb_recipe (recipe_no) ON DELETE RESTRICT ON UPDATE RESTRICT;


create sequence s_tb_like_no;

-- tb_like_comment Table Create SQL
CREATE TABLE tb_like_comment
(
    like_comment_no  number    NOT NULL    COMMENT '번호', 
    mem_no           number    NOT NULL    COMMENT '회원번호', 
    recipe_no        number    NOT NULL    COMMENT '게시글번호', 
    comment_no       number    NULL        COMMENT '댓글번호', 
    PRIMARY KEY (like_comment_no)
);

ALTER TABLE tb_like_comment COMMENT '댓글좋아요테이블';

ALTER TABLE tb_like_comment
    ADD CONSTRAINT FK_like_comment_mem_no_member FOREIGN KEY (mem_no)
        REFERENCES tb_member (mem_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE tb_like_comment
    ADD CONSTRAINT FK_like_comment_comment_no_comment FOREIGN KEY (comment_no)
        REFERENCES tb_comment (comment_no) ON DELETE RESTRICT ON UPDATE RESTRICT;


create sequence s_tb_like_comment_no;

-- tb_recipe_block Table Create SQL
CREATE TABLE tb_recipe_block
(
    rec_block_no        number            NOT NULL    COMMENT '게시글번호', 
    recipe_no           number            NOT NULL    COMMENT '참조게시글번호', 
    rec_block_content   VARCHAR2(1000)    NOT NULL    COMMENT '요리 설명', 
    rec_block_img_link  VARCHAR2(110)     NULL        COMMENT '이미지링크', 
    PRIMARY KEY (rec_block_no)
);

ALTER TABLE tb_recipe_block COMMENT '게시글의 이미지블럭';

ALTER TABLE tb_recipe_block
    ADD CONSTRAINT FK_recipe_block_recipe_no_recipe FOREIGN KEY (recipe_no)
        REFERENCES tb_recipe (recipe_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

create sequence s_tb_recipe_block_no;

-- tb_ingredient Table Create SQL
CREATE TABLE tb_ingredient
(
    ingredient_no  number    NOT NULL    COMMENT '재료번호', 
    recipe_no      number    NOT NULL    COMMENT '참조게시글번호', 
    category_no    number    NOT NULL    COMMENT '참조카테고리번호', 
    PRIMARY KEY (ingredient_no)
);

ALTER TABLE tb_ingredient COMMENT '게시글의 재료';

ALTER TABLE tb_ingredient
    ADD CONSTRAINT FK_ingredient_recipe_no_recipe FOREIGN KEY (recipe_no)
        REFERENCES tb_recipe (recipe_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE tb_ingredient
    ADD CONSTRAINT FK_ingredient_category_no_category FOREIGN KEY (category_no)
        REFERENCES tb_category (category_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

create sequence s_tb_ingredient_no;
-- tb_caution Table Create SQL
CREATE TABLE tb_caution
(
    caution_no   number    NOT NULL    COMMENT '주의사항번호', 
    recipe_no    number    NOT NULL    COMMENT '참조게시글번호', 
    category_no  number    NOT NULL    COMMENT '참조카테고리번호', 
    PRIMARY KEY (caution_no)
);

ALTER TABLE tb_caution COMMENT '게시글의 주의사항';

ALTER TABLE tb_caution
    ADD CONSTRAINT FK_caution_recipe_no_recipe FOREIGN KEY (recipe_no)
        REFERENCES tb_recipe (recipe_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE tb_caution
    ADD CONSTRAINT FK_caution_category_no_category FOREIGN KEY (category_no)
        REFERENCES tb_category (category_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

create sequence s_tb_caution_no;
-- tb_admin_notice Table Create SQL
CREATE TABLE tb_admin_notice
(
    ad_notice_no        number            NOT NULL    COMMENT '공지사항번호', 
    ad_notice_content   VARCHAR2(2000)    NULL        COMMENT '공지내용', 
    ad_notice_reg_date  DATE              NULL        COMMENT '공지등록일', 
    ad_notice_writer    VARCHAR2(20)      NULL        COMMENT '작성자', 
    PRIMARY KEY (ad_notice_no)
);

ALTER TABLE tb_admin_notice COMMENT '관리자공지사항';

create sequence s_tb_notice_no;
-- tb_admin_banner Table Create SQL
CREATE TABLE tb_admin_banner
(
    ad_banner_no        number           NOT NULL    COMMENT '배너번호', 
    ad_banner_title     VARCHAR2(25)     NULL        COMMENT 'h1태그값', 
    ad_banner_content   VARCHAR2(120)    NULL        COMMENT 'p태그값', 
    ad_banner_img_link  VARCHAR2(110)    NULL        COMMENT '이미지링크', 
    PRIMARY KEY (ad_banner_no)
);

create sequence s_tb_admin_banner_no;
-- tb_category_map Table Create SQL
CREATE TABLE tb_category_map
(
    category_dist_no    number          NOT NULL    COMMENT '요소 분류 번호', 
    category_dist_name  VARCHAR2(10)    NOT NULL    COMMENT '요소 분류 이름'
);

ALTER TABLE tb_category_map COMMENT '분류번호맵';

ALTER TABLE tb_category_map
    ADD CONSTRAINT FK_category_map_category_dist_n_category FOREIGN KEY (category_dist_no)
        REFERENCES tb_category (category_dist_no) ON DELETE RESTRICT ON UPDATE RESTRICT;


