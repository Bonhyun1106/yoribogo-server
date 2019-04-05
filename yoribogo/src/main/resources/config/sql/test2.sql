-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- tb_member Table Create SQL
----------------------------------------Naming Convention-------------------------------------------
--1. foriegn key 
--ex> tb_recipe의 mem_no는 tb_member의 mem_no를 참조함
--		FK_tbrecipe_mem_no_tbmem
--		FK 참조테이블_컬럼명_피참조테이블
--		외래키용 약어 정의 [사용하는 컬러명에는 약어를 적용하지 않음]
--recipe : rec
--category: cat
--member: mem
--admin : adm
--comment : com
--ingredient : ing
--caution : cau
--banner : ban
--like : l
--block: blk
--!!! 예외 !!!--
-- tb_category_map -> category_dist_no -> tb_category 참조는 너무 길어서
-- FK_tcm_category_no_tc 로 정의
--
--2. sequence
--ex> tb_member의 mem_no -> s_mem_no;

--3. constraint
---------------제약 조건 명시
-- 테이블명_컬럼 첫 2문자_제약조건 약어
--ex> tb_member의 mem_no가 not null일 때, member_no_nn
-- ------------동일 이름이라면 겹치는 컬럼 두개 모두 3문자까지 표현
--  comment_reg_date        DATE             constraint comment_reg_nn NOT NULL, 
--  comment_report_count    number           constraint comment_rep_nn NOT NULL, 
---------------참조 대상의 이름은 그대로
--  mem_no             number           constraint recipe_mem_no_nn NOT NULL, 
CREATE TABLE tb_member
(
    mem_no              number           NOT NULL, 
    mem_id              VARCHAR2(10)     constraint	member_id_nn NOT NULL, 
    mem_password        VARCHAR2(12)     constraint member_pa_nn NOT NULL, 
    mem_email           VARCHAR2(45)     constraint member_em_nn NOT NULL, 
    mem_favor1          VARCHAR2(45)     NULL, 
    mem_favor2          VARCHAR2(45)     NULL, 
    mem_favor3          VARCHAR2(45)     NULL, 
    mem_join_date       date default sysdate constraint member_jo_nn NOT NULL , 
    mem_profile         VARCHAR2(110)    NULL, 
    mem_report_count    number(5)        constraint member_re_nn NOT NULL,
    mem_is_out			char default 0   constraint member_is_nn NOT NULL
    CONSTRAINT tb_member_pk PRIMARY KEY (mem_no)
)
/

CREATE SEQUENCE s_mem_no
START WITH 1
INCREMENT BY 1;
/

--DROP SEQUENCE tb_member_SEQ;
/

COMMENT ON TABLE tb_member IS '회원'
/

COMMENT ON COLUMN tb_member.mem_no IS '회원번호'
/

COMMENT ON COLUMN tb_member.mem_id IS '아이디 10자'
/

COMMENT ON COLUMN tb_member.mem_password IS '비번 12자'
/

COMMENT ON COLUMN tb_member.mem_email IS '이메일 45자'
/

COMMENT ON COLUMN tb_member.mem_favor1 IS '선호1'
/

COMMENT ON COLUMN tb_member.mem_favor2 IS '선호2'
/

COMMENT ON COLUMN tb_member.mem_favor3 IS '선호3'
/

COMMENT ON COLUMN tb_member.mem_join_date IS '회원가입일'
/

COMMENT ON COLUMN tb_member.mem_profile IS '프로필사진'
/

COMMENT ON COLUMN tb_member.mem_report_count IS 'default=0'
/


-- tb_recipe Table Create SQL
CREATE TABLE tb_recipe
(
    recipe_no          number           NOT NULL, 
    recipe_title       VARCHAR2(45)     constraint recipe_ti_nn NOT NULL, 
    recipe_summary     VARCHAR2(200)    constraint recipe_su_nn NOT NULL, 
    mem_no             number           constraint recipe_mem_no_nn NOT NULL, 
    recipe_view_cnt    number           constraint recipe_vi_nn NOT NULL, 
    recipe_like_cnt    number           constraint recipe_li_nn NOT NULL, 
    recipe_reg_date    DATE             NULL,             
    recipe_country     number           constraint recipe_co_nn NOT NULL, 
    recipe_type        number           constraint recipe_ty_nn NOT NULL, 
    recipe_kcal        number           constraint recipe_kc_nn NOT NULL, 
    recipe_time        number           constraint recipe_ti_nn NOT NULL, 
    recipe_level       number           NOT NULL, 
    recipe_weather     number           constraint recipe_we_nn NOT NULL, 
    CONSTRAINT TB_RECIPE_PK PRIMARY KEY (recipe_no)
)
/

CREATE SEQUENCE s_recipe_no
START WITH 1
INCREMENT BY 1;
/

--DROP SEQUENCE tb_recipe_SEQ;
/

COMMENT ON TABLE tb_recipe IS '게시글'
/

COMMENT ON COLUMN tb_recipe.recipe_no IS '레시피번호'
/

COMMENT ON COLUMN tb_recipe.recipe_title IS '레시피제목'
/

COMMENT ON COLUMN tb_recipe.recipe_summary IS '레시피요약'
/

COMMENT ON COLUMN tb_recipe.mem_no IS '작성회원번호'
/

COMMENT ON COLUMN tb_recipe.recipe_view_cnt IS 'default=0'
/

COMMENT ON COLUMN tb_recipe.recipe_like_cnt IS 'default=0'
/

COMMENT ON COLUMN tb_recipe.recipe_reg_date IS '게시글작성날짜'
/

COMMENT ON COLUMN tb_recipe.recipe_country IS '양식'
/

COMMENT ON COLUMN tb_recipe.recipe_type IS '종류'
/

COMMENT ON COLUMN tb_recipe.recipe_kcal IS '열량'
/

COMMENT ON COLUMN tb_recipe.recipe_time IS '조리시간'
/

COMMENT ON COLUMN tb_recipe.recipe_level IS '난이도'
/

COMMENT ON COLUMN tb_recipe.recipe_weather IS '날씨'
/

ALTER TABLE tb_recipe
    ADD CONSTRAINT FK_tbrec_mem_no_tbmem FOREIGN KEY (mem_no)
        REFERENCES tb_member (mem_no)
/


-- tb_category Table Create SQL
CREATE TABLE tb_category
(
    category_no         number           constraint category_no_nn NOT NULL, 
    category_name       VARCHAR2(100)    constraint category_na_nn NOT NULL, 
    category_dist_no    number           constraint category_di_nn NOT NULL, 
    CONSTRAINT TB_CATEGORY_PK PRIMARY KEY (category_no)
)
/

CREATE SEQUENCE s_category_no
START WITH 1
INCREMENT BY 1;
/

--DROP SEQUENCE tb_category_SEQ;
/

COMMENT ON TABLE tb_category IS '범주'
/

COMMENT ON COLUMN tb_category.category_no IS '카테고리번호'
/

COMMENT ON COLUMN tb_category.category_name IS '요소 이름'
/

COMMENT ON COLUMN tb_category.category_dist_no IS '요소분류 번호'
/


-- tb_comment Table Create SQL
CREATE TABLE tb_comment
(
    comment_no              number           constraint comment_no_nn NOT NULL, 
    recipe_no               number           constraint comment_recipe_no_nn NOT NULL, 
    mem_no                  number           constraint comment_mem_no_nn NOT NULL, 
    comment_like_cnt        number           constraint comment_li_nn NOT NULL, 
    comment_reg_date        DATE             constraint comment_reg_nn NOT NULL, 
    comment_content         VARCHAR2(120)    constraint comment_co_nn NOT NULL, 
    comment_report_count    number           constraint comment_rep_nn NOT NULL, 
    CONSTRAINT TB_COMMENT_PK PRIMARY KEY (comment_no)
)
/

CREATE SEQUENCE s_comment_no
START WITH 1
INCREMENT BY 1;
/

--DROP SEQUENCE tb_comment_SEQ;
/

COMMENT ON TABLE tb_comment IS '댓글'
/

COMMENT ON COLUMN tb_comment.comment_no IS '댓글번호'
/

COMMENT ON COLUMN tb_comment.recipe_no IS '참조글번호'
/

COMMENT ON COLUMN tb_comment.mem_no IS '회원번호'
/

COMMENT ON COLUMN tb_comment.comment_like_cnt IS '좋아요수'
/

COMMENT ON COLUMN tb_comment.comment_reg_date IS '댓글작성날짜'
/

COMMENT ON COLUMN tb_comment.comment_content IS '댓글내용'
/

COMMENT ON COLUMN tb_comment.comment_report_count IS '댓글신고횟수'
/

ALTER TABLE tb_comment
    ADD CONSTRAINT FK_tbcom_recipe_no_tbrec FOREIGN KEY (recipe_no)
        REFERENCES tb_recipe (recipe_no)
/

ALTER TABLE tb_comment
    ADD CONSTRAINT FK_tbcom_mem_no_tbmem FOREIGN KEY (mem_no)
        REFERENCES tb_member (mem_no)
/


-- tb_like Table Create SQL
CREATE TABLE tb_like
(
    like_no      number    constraint like_no_nn NOT NULL, 
    mem_no       number    constraint like_mem_no_nn NOT NULL, 
    recipe_no    number    constraint like_recipe_no_nn NOT NULL, 
    CONSTRAINT TB_LIKE_PK PRIMARY KEY (like_no)
)
/

CREATE SEQUENCE s_like_no
START WITH 1
INCREMENT BY 1;
/

--DROP SEQUENCE tb_like_SEQ;
/

COMMENT ON TABLE tb_like IS '좋아요테이블'
/

COMMENT ON COLUMN tb_like.like_no IS '번호'
/

COMMENT ON COLUMN tb_like.mem_no IS '회원번호'
/

COMMENT ON COLUMN tb_like.recipe_no IS '1-재료/2-양식/3-종류/4-열량/5-조리시간/6-추천날씨/7-난이도/8-주의사항'
/

ALTER TABLE tb_like
    ADD CONSTRAINT FK_tbl_mem_no_tbmem FOREIGN KEY (mem_no)
        REFERENCES tb_member (mem_no)
/

ALTER TABLE tb_like
    ADD CONSTRAINT FK_tbl_recipe_no_tbrec FOREIGN KEY (recipe_no)
        REFERENCES tb_recipe (recipe_no)
/


-- tb_like_comment Table Create SQL
CREATE TABLE tb_like_comment
(
    like_comment_no    number    constraint like_comment_no_nn NOT NULL, 
    mem_no             number    constraint like_comment_mem_no_nn NOT NULL, 
    recipe_no          number    constraint like_comment_comment_no_nn NOT NULL, 
    comment_no         number    NULL, 
    CONSTRAINT TB_LIKE_COMMENT_PK PRIMARY KEY (like_comment_no)
)
/

CREATE SEQUENCE s_like_comment_no
START WITH 1
INCREMENT BY 1;
/

--DROP SEQUENCE tb_like_comment_SEQ;
/

COMMENT ON TABLE tb_like_comment IS '댓글좋아요테이블'
/

COMMENT ON COLUMN tb_like_comment.like_comment_no IS '번호'
/

COMMENT ON COLUMN tb_like_comment.mem_no IS '회원번호'
/

COMMENT ON COLUMN tb_like_comment.recipe_no IS '게시글번호'
/

COMMENT ON COLUMN tb_like_comment.comment_no IS '댓글번호'
/

ALTER TABLE tb_like_comment
    ADD CONSTRAINT FK_tbl_com_mem_no_tbmem FOREIGN KEY (mem_no)
        REFERENCES tb_member (mem_no)
/

ALTER TABLE tb_like_comment
    ADD CONSTRAINT FK_tbl_com_comment_no_tbcom FOREIGN KEY (comment_no)
        REFERENCES tb_comment (comment_no)
/


-- tb_recipe_block Table Create SQL
CREATE TABLE tb_recipe_block
(
    rec_block_no          number            constraint recipe_block_no_nn NOT NULL, 
    recipe_no             number            constraint recipe_block_recipe_no_nn NOT NULL, 
    rec_block_content     VARCHAR2(1000)    constraint recipe_block_im_nn NOT NULL, 
    rec_block_img_link    VARCHAR2(110)     NULL, 
    CONSTRAINT TB_RECIPE_BLOCK_PK PRIMARY KEY (rec_block_no)
)
/

CREATE SEQUENCE s_rec_block_no
START WITH 1
INCREMENT BY 1;
/

--DROP SEQUENCE tb_recipe_block_SEQ;
/

COMMENT ON TABLE tb_recipe_block IS '게시글의 이미지블럭'
/

COMMENT ON COLUMN tb_recipe_block.rec_block_no IS '게시글번호'
/

COMMENT ON COLUMN tb_recipe_block.recipe_no IS '참조게시글번호'
/

COMMENT ON COLUMN tb_recipe_block.rec_block_content IS '요리 설명'
/

COMMENT ON COLUMN tb_recipe_block.rec_block_img_link IS '이미지링크'
/

ALTER TABLE tb_recipe_block
    ADD CONSTRAINT FK_tbrec_blk_recipe_no_tbrec FOREIGN KEY (recipe_no)
        REFERENCES tb_recipe (recipe_no)
/


-- tb_ingredient Table Create SQL
CREATE TABLE tb_ingredient
(
    ingredient_no    number    constraint ingredient_no_nn NOT NULL, 
    recipe_no        number    constraint ingredient_recipe_no_nn NOT NULL, 
    category_no      number    constraint ingredient_category_no_nn NOT NULL, 
    CONSTRAINT TB_INGREDIENT_PK PRIMARY KEY (ingredient_no)
)
/

CREATE SEQUENCE s_ingredient_no
START WITH 1
INCREMENT BY 1;
/

--DROP SEQUENCE tb_ingredient_SEQ;
/

COMMENT ON TABLE tb_ingredient IS '게시글의 재료'
/

COMMENT ON COLUMN tb_ingredient.ingredient_no IS '재료번호'
/

COMMENT ON COLUMN tb_ingredient.recipe_no IS '참조게시글번호'
/

COMMENT ON COLUMN tb_ingredient.category_no IS '참조카테고리번호'
/

ALTER TABLE tb_ingredient
    ADD CONSTRAINT FK_tbing_recipe_no_tbrec FOREIGN KEY (recipe_no)
        REFERENCES tb_recipe (recipe_no)
/

ALTER TABLE tb_ingredient
    ADD CONSTRAINT FK_tbing_category_no_tbcat FOREIGN KEY (category_no)
        REFERENCES tb_category (category_no)
/


-- tb_caution Table Create SQL
CREATE TABLE tb_caution
(
    caution_no     number    constraint caution_no_nn NOT NULL, 
    recipe_no      number    constraint caution_recipe_no_nn NOT NULL, 
    category_no    number    constraint caution_category_no_nn NOT NULL, 
    CONSTRAINT TB_CAUTION_PK PRIMARY KEY (caution_no)
)
/

CREATE SEQUENCE s_caution_no
START WITH 1
INCREMENT BY 1;
/

--DROP SEQUENCE tb_caution_SEQ;
/

COMMENT ON TABLE tb_caution IS '게시글의 주의사항'
/

COMMENT ON COLUMN tb_caution.caution_no IS '주의사항번호'
/

COMMENT ON COLUMN tb_caution.recipe_no IS '참조게시글번호'
/

COMMENT ON COLUMN tb_caution.category_no IS '참조카테고리번호'
/

ALTER TABLE tb_caution
    ADD CONSTRAINT FK_tbcau_recipe_no_tbrec FOREIGN KEY (recipe_no)
        REFERENCES tb_recipe (recipe_no)
/

ALTER TABLE tb_caution
    ADD CONSTRAINT FK_tbcau_category_no_tbcat FOREIGN KEY (category_no)
        REFERENCES tb_category (category_no)
/


-- tb_admin_notice Table Create SQL
CREATE TABLE tb_admin_notice
(
    ad_notice_no          number            constraint admin_notice_no_nn NOT NULL, 
    ad_notice_content     VARCHAR2(2000)    NULL, 
    ad_notice_reg_date    DATE              NULL, 
    ad_notice_writer      VARCHAR2(20)      NULL, 
    CONSTRAINT TB_ADMIN_NOTICE_PK PRIMARY KEY (ad_notice_no)
)
/

CREATE SEQUENCE s_ad_notice_no
START WITH 1
INCREMENT BY 1;
/

--DROP SEQUENCE tb_admin_notice_SEQ;
/

COMMENT ON TABLE tb_admin_notice IS '관리자공지사항'
/

COMMENT ON COLUMN tb_admin_notice.ad_notice_no IS '공지사항번호'
/

COMMENT ON COLUMN tb_admin_notice.ad_notice_content IS '공지내용'
/

COMMENT ON COLUMN tb_admin_notice.ad_notice_reg_date IS '공지등록일'
/

COMMENT ON COLUMN tb_admin_notice.ad_notice_writer IS '작성자'
/


-- tb_admin_banner Table Create SQL
CREATE TABLE tb_admin_banner
(
    ad_banner_no          number           constraint admin_banner_no_nn NOT NULL, 
    ad_banner_title       VARCHAR2(25)     NULL, 
    ad_banner_content     VARCHAR2(120)    NULL, 
    ad_banner_img_link    VARCHAR2(110)    NULL, 
    CONSTRAINT TB_ADMIN_BANNER_PK PRIMARY KEY (ad_banner_no)
)
/

CREATE SEQUENCE s_ad_banner_no
START WITH 1
INCREMENT BY 1;
/

--DROP SEQUENCE tb_admin_banner_SEQ;
/

COMMENT ON COLUMN tb_admin_banner.ad_banner_no IS '배너번호'
/

COMMENT ON COLUMN tb_admin_banner.ad_banner_title IS 'h1태그값'
/

COMMENT ON COLUMN tb_admin_banner.ad_banner_content IS 'p태그값'
/

COMMENT ON COLUMN tb_admin_banner.ad_banner_img_link IS '이미지링크'
/


-- tb_category_map Table Create SQL
CREATE TABLE tb_category_map
(
    category_dist_no      number          constraint category_map_no_nn NOT NULL, 
    category_dist_name    VARCHAR2(10)    constraint category_map_name_nn NOT NULL
)
/

COMMENT ON TABLE tb_category_map IS '분류번호맵'
/

COMMENT ON COLUMN tb_category_map.category_dist_no IS '요소 분류 번호'
/

COMMENT ON COLUMN tb_category_map.category_dist_name IS '요소 분류 이름'
/


