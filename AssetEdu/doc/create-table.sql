-- ======================================================================================================
drop schema  if exists  edu CASCADE;
drop table if exists public.com01_corp;
drop table if exists public.com02_code;
drop table if exists public.sys01_user;
drop SEQUENCE if exists asset_seq;

create schema EDU;
CREATE SEQUENCE IF NOT EXISTS asset_seq as integer increment by 1 minvalue 1 maxvalue 99999 start 1 cycle;

-- ======================================================================================================
-- 자산교육
COMMENT ON SCHEMA EDU IS '자산교육';

-- 펀드정보
CREATE TABLE EDU.FND01_FUND
(
    FND01_FUND_CD          VARCHAR(12)  NOT NULL, -- 펀드코드
    FND01_FUND_NM          VARCHAR(100) NOT NULL, -- 펀드명
    FND01_FUND_TYPE        VARCHAR(2)   NULL,     -- 펀드유형(FundType)
    FND01_PUBLIC_CD        VARCHAR(1)   NULL,     -- 공모/사모코드(PublicCode)
    FND01_UNIT_CD          VARCHAR(1)   NULL,     -- 펀드단위코드(FundUnitCode)
    FND01_PARENT_CD        VARCHAR(1)   NULL,     -- 모자구분코드(FundParentCode)
    FND01_PARENT_FUND_CD   VARCHAR(12)  NULL,     -- 모펀드코드
    FND01_START_DATE       VARCHAR(8)   NULL,     -- 설정일자
    FND01_END_DATE         VARCHAR(8)   NULL,     -- 해지일자
    FND01_ACC_PERIOD       NUMERIC      NULL,     -- 회계기간(개월)
    FND01_FIRST_CLOSE_DATE VARCHAR(8)   NULL,     -- 최초결산일자
    FND01_CUR_CD           VARCHAR(3)   NULL,     -- 기준통화(CurCode)
    FND01_KSD_ITEM_CD      VARCHAR(12)  NULL,     -- 예탁원종목코드
    FND01_KOFIA_CD         VARCHAR(12)  NULL,     -- 협회표준코드
    FND01_KOFIA_CLASS_CD   VARCHAR(20)  NULL,     -- 협회상품분류코드
    FND01_FSS_CD           VARCHAR(12)  NULL,     -- 금감원펀드코드
    FND01_MANAGER          VARCHAR(50)  NULL,     -- 주운용역
    FND01_SUB_MANAGER      VARCHAR(50)  NULL,     -- 부운용역
    FND01_MNG_CO_CD        VARCHAR(12)  NULL,     -- 운용사코드
    FND01_TRUST_CO_CD      VARCHAR(12)  NULL,     -- 수탁사코드
    FND01_OFFICE_CO_CD     VARCHAR(12)  NULL,     -- 사무관리사(주)코드
    FND01_SUB_OFFICE_CO_CD VARCHAR(12)  NULL      -- 사무관리사(부)코드
);

-- 펀드정보
COMMENT ON TABLE EDU.FND01_FUND IS '펀드정보';

-- 펀드코드
COMMENT ON COLUMN EDU.FND01_FUND.FND01_FUND_CD IS '펀드코드';

-- 펀드명
COMMENT ON COLUMN EDU.FND01_FUND.FND01_FUND_NM IS '펀드명';

-- 펀드유형(FundType)
COMMENT ON COLUMN EDU.FND01_FUND.FND01_FUND_TYPE IS '펀드유형(FundType)';

-- 공모/사모코드(PublicCode)
COMMENT ON COLUMN EDU.FND01_FUND.FND01_PUBLIC_CD IS '공모/사모코드(PublicCode)';

-- 펀드단위코드(FundUnitCode)
COMMENT ON COLUMN EDU.FND01_FUND.FND01_UNIT_CD IS '펀드단위코드(FundUnitCode)';

-- 모자구분코드(FundParentCode)
COMMENT ON COLUMN EDU.FND01_FUND.FND01_PARENT_CD IS '모자구분코드(FundParentCode)';

-- 모펀드코드
COMMENT ON COLUMN EDU.FND01_FUND.FND01_PARENT_FUND_CD IS '모펀드코드';

-- 설정일자
COMMENT ON COLUMN EDU.FND01_FUND.FND01_START_DATE IS '설정일자';

-- 해지일자
COMMENT ON COLUMN EDU.FND01_FUND.FND01_END_DATE IS '해지일자';

-- 회계기간(개월)
COMMENT ON COLUMN EDU.FND01_FUND.FND01_ACC_PERIOD IS '회계기간(개월)';

-- 최초결산일자
COMMENT ON COLUMN EDU.FND01_FUND.FND01_FIRST_CLOSE_DATE IS '최초결산일자';

-- 기준통화(CurCode)
COMMENT ON COLUMN EDU.FND01_FUND.FND01_CUR_CD IS '기준통화(CurCode)';

-- 예탁원종목코드
COMMENT ON COLUMN EDU.FND01_FUND.FND01_KSD_ITEM_CD IS '예탁원종목코드';

-- 협회표준코드
COMMENT ON COLUMN EDU.FND01_FUND.FND01_KOFIA_CD IS '협회표준코드';

-- 협회상품분류코드
COMMENT ON COLUMN EDU.FND01_FUND.FND01_KOFIA_CLASS_CD IS '협회상품분류코드';

-- 금감원펀드코드
COMMENT ON COLUMN EDU.FND01_FUND.FND01_FSS_CD IS '금감원펀드코드';

-- 주운용역
COMMENT ON COLUMN EDU.FND01_FUND.FND01_MANAGER IS '주운용역';

-- 부운용역
COMMENT ON COLUMN EDU.FND01_FUND.FND01_SUB_MANAGER IS '부운용역';

-- 운용사코드
COMMENT ON COLUMN EDU.FND01_FUND.FND01_MNG_CO_CD IS '운용사코드';

-- 수탁사코드
COMMENT ON COLUMN EDU.FND01_FUND.FND01_TRUST_CO_CD IS '수탁사코드';

-- 사무관리사(주)코드
COMMENT ON COLUMN EDU.FND01_FUND.FND01_OFFICE_CO_CD IS '사무관리사(주)코드';

-- 사무관리사(부)코드
COMMENT ON COLUMN EDU.FND01_FUND.FND01_SUB_OFFICE_CO_CD IS '사무관리사(부)코드';

-- 펀드정보 기본키
CREATE UNIQUE INDEX PK_FND01_FUND
    ON EDU.FND01_FUND
    ( -- 펀드정보
        FND01_FUND_CD ASC -- 펀드코드
    )
;
-- 펀드정보
ALTER TABLE EDU.FND01_FUND
    ADD CONSTRAINT PK_FND01_FUND
         -- 펀드정보 기본키
    PRIMARY KEY 
    USING INDEX PK_FND01_FUND;

-- 펀드정보 기본키
COMMENT ON CONSTRAINT PK_FND01_FUND ON EDU.FND01_FUND IS '펀드정보 기본키';

-- ======================================================================================================
-- 종목정보
CREATE TABLE EDU.ITM01_ITEM
(
    ITM01_ITEM_CD     VARCHAR(12)  NOT NULL, -- 종목코드
    ITM01_ITEM_NM     VARCHAR(100) NOT NULL, -- 종목명
    ITM01_ITEM_ENM    VARCHAR(100) NULL,     -- 영문명
    ITM01_SHORT_CD    VARCHAR(12)  NULL,     -- 단축코드
    ITM01_ISS_TYPE    VARCHAR(1)   NULL,     -- 발행구분(StkIssType:공모/사모)
    ITM01_STK_TYPE    VARCHAR(1)   NULL,     -- 증권종류(StkType:보통주/우선주/..)
    ITM01_LIST_TYPE   VARCHAR(1)   NULL,     -- 상장구분(ListType:상장/비상장/상장폐지)
    ITM01_MARKET_TYPE VARCHAR(1)   NULL,     -- 시장구분(MarketType:코스피/코스닥/..)
    ITM01_PAR         NUMERIC      NULL,     -- 액면가
    ITM01_ISS_CO_CD   VARCHAR(12)  NULL      -- 발행기관코드
);

-- 종목정보
COMMENT ON TABLE EDU.ITM01_ITEM IS '종목정보';

-- 종목코드
COMMENT ON COLUMN EDU.ITM01_ITEM.ITM01_ITEM_CD IS '종목코드';

-- 종목명
COMMENT ON COLUMN EDU.ITM01_ITEM.ITM01_ITEM_NM IS '종목명';

-- 영문명
COMMENT ON COLUMN EDU.ITM01_ITEM.ITM01_ITEM_ENM IS '영문명';

-- 단축코드
COMMENT ON COLUMN EDU.ITM01_ITEM.ITM01_SHORT_CD IS '단축코드';

-- 발행구분(StkIssType:공모/사모)
COMMENT ON COLUMN EDU.ITM01_ITEM.ITM01_ISS_TYPE IS '발행구분(StkIssType:공모/사모)';

-- 증권종류(StkType:보통주/우선주/..)
COMMENT ON COLUMN EDU.ITM01_ITEM.ITM01_STK_TYPE IS '증권종류(StkType:보통주/우선주/..)';

-- 상장구분(ListType:상장/비상장/상장폐지)
COMMENT ON COLUMN EDU.ITM01_ITEM.ITM01_LIST_TYPE IS '상장구분(ListType:상장/비상장/상장폐지)';

-- 시장구분(MarketType:코스피/코스닥/..)
COMMENT ON COLUMN EDU.ITM01_ITEM.ITM01_MARKET_TYPE IS '시장구분(MarketType:코스피/코스닥/..)';

-- 액면가
COMMENT ON COLUMN EDU.ITM01_ITEM.ITM01_PAR IS '액면가';

-- 발행기관코드
COMMENT ON COLUMN EDU.ITM01_ITEM.ITM01_ISS_CO_CD IS '발행기관코드';

-- 종목정보 기본키
CREATE UNIQUE INDEX PK_ITM01_ITEM
    ON EDU.ITM01_ITEM
    ( -- 종목정보
        ITM01_ITEM_CD ASC -- 종목코드
    )
;
-- 종목정보
ALTER TABLE EDU.ITM01_ITEM
    ADD CONSTRAINT PK_ITM01_ITEM
         -- 종목정보 기본키
    PRIMARY KEY 
    USING INDEX PK_ITM01_ITEM;

-- 종목정보 기본키
COMMENT ON CONSTRAINT PK_ITM01_ITEM ON EDU.ITM01_ITEM IS '종목정보 기본키';

-- ======================================================================================================
-- 평가단가정보
CREATE TABLE EDU.ITM02_EVAL_PRICE
(
    ITM02_ITEM_CD     VARCHAR(12) NOT NULL, -- 종목코드
    ITM02_APPLY_DATE  VARCHAR(8)  NOT NULL, -- 적용일자
    ITM02_APPLY_PRICE NUMERIC     NULL      -- 적용단가
);

-- 평가단가정보
COMMENT ON TABLE EDU.ITM02_EVAL_PRICE IS '평가단가정보';

-- 종목코드
COMMENT ON COLUMN EDU.ITM02_EVAL_PRICE.ITM02_ITEM_CD IS '종목코드';

-- 적용일자
COMMENT ON COLUMN EDU.ITM02_EVAL_PRICE.ITM02_APPLY_DATE IS '적용일자';

-- 적용단가
COMMENT ON COLUMN EDU.ITM02_EVAL_PRICE.ITM02_APPLY_PRICE IS '적용단가';

-- 평가단가정보 기본키
CREATE UNIQUE INDEX PK_ITM02_EVAL_PRICE
    ON EDU.ITM02_EVAL_PRICE
    ( -- 평가단가정보
        ITM02_ITEM_CD ASC, -- 종목코드
        ITM02_APPLY_DATE ASC -- 적용일자
    )
;
-- 평가단가정보
ALTER TABLE EDU.ITM02_EVAL_PRICE
    ADD CONSTRAINT PK_ITM02_EVAL_PRICE
         -- 평가단가정보 기본키
    PRIMARY KEY 
    USING INDEX PK_ITM02_EVAL_PRICE;

-- 평가단가정보 기본키
COMMENT ON CONSTRAINT PK_ITM02_EVAL_PRICE ON EDU.ITM02_EVAL_PRICE IS '평가단가정보 기본키';

-- ======================================================================================================
-- 운용지시
CREATE TABLE EDU.OPR01_CONT
(
    OPR01_CONT_ID     VARCHAR(13) NOT NULL, -- 체결ID
    OPR01_FUND_CD     VARCHAR(12) NOT NULL, -- 펀드코드
    OPR01_ITEM_CD     VARCHAR(12) NOT NULL, -- 종목코드
    OPR01_CONT_DATE   VARCHAR(8)  NOT NULL, -- 체결일자
    OPR01_TR_CD       VARCHAR(4)  NOT NULL, -- 거래코드(TrCode)
    OPR01_QTY         NUMERIC     NULL,     -- 수량
    OPR01_PRICE       NUMERIC     NULL,     -- 단가
    OPR01_CONT_AMT    NUMERIC     NULL,     -- 체결금액
    OPR01_TR_PL       NUMERIC     NULL,     -- 매매손익
    OPR01_FEE         NUMERIC     NULL,     -- 수수료
    OPR01_TAX         NUMERIC     NULL,     -- 제세금
    OPR01_SETTLE_AMT  NUMERIC     NULL,     -- 결제금액
    OPR01_SETTLE_DATE VARCHAR(8)  NULL,     -- 결제일자
    OPR01_TR_CO_CD    VARCHAR(12) NULL,     -- 매매처코드
    OPR01_BOOK_ID     VARCHAR(13) NULL,     -- 보유ID
    OPR01_BOOK_AMT    NUMERIC     NULL,     -- 장부금액
    OPR01_STATUS_CD   VARCHAR(1)  NULL      -- 상태코드(TrStatusCode)
);

-- 운용지시
COMMENT ON TABLE EDU.OPR01_CONT IS '운용지시';

-- 체결ID
COMMENT ON COLUMN EDU.OPR01_CONT.OPR01_CONT_ID IS '체결ID';

-- 펀드코드
COMMENT ON COLUMN EDU.OPR01_CONT.OPR01_FUND_CD IS '펀드코드';

-- 종목코드
COMMENT ON COLUMN EDU.OPR01_CONT.OPR01_ITEM_CD IS '종목코드';

-- 체결일자
COMMENT ON COLUMN EDU.OPR01_CONT.OPR01_CONT_DATE IS '체결일자';

-- 거래코드(TrCode)
COMMENT ON COLUMN EDU.OPR01_CONT.OPR01_TR_CD IS '거래코드(TrCode)';

-- 수량
COMMENT ON COLUMN EDU.OPR01_CONT.OPR01_QTY IS '수량';

-- 단가
COMMENT ON COLUMN EDU.OPR01_CONT.OPR01_PRICE IS '단가';

-- 체결금액
COMMENT ON COLUMN EDU.OPR01_CONT.OPR01_CONT_AMT IS '체결금액';

-- 매매손익
COMMENT ON COLUMN EDU.OPR01_CONT.OPR01_TR_PL IS '매매손익';

-- 수수료
COMMENT ON COLUMN EDU.OPR01_CONT.OPR01_FEE IS '수수료';

-- 제세금
COMMENT ON COLUMN EDU.OPR01_CONT.OPR01_TAX IS '제세금';

-- 결제금액
COMMENT ON COLUMN EDU.OPR01_CONT.OPR01_SETTLE_AMT IS '결제금액';

-- 결제일자
COMMENT ON COLUMN EDU.OPR01_CONT.OPR01_SETTLE_DATE IS '결제일자';

-- 매매처코드
COMMENT ON COLUMN EDU.OPR01_CONT.OPR01_TR_CO_CD IS '매매처코드';

-- 보유ID
COMMENT ON COLUMN EDU.OPR01_CONT.OPR01_BOOK_ID IS '보유ID';

-- 장부금액
COMMENT ON COLUMN EDU.OPR01_CONT.OPR01_BOOK_AMT IS '장부금액';

-- 상태코드(TrStatusCode)
COMMENT ON COLUMN EDU.OPR01_CONT.OPR01_STATUS_CD IS '상태코드(TrStatusCode)';

-- 운용지시 기본키
CREATE UNIQUE INDEX PK_OPR01_CONT
    ON EDU.OPR01_CONT
    ( -- 운용지시
        OPR01_CONT_ID ASC, -- 체결ID
        OPR01_FUND_CD ASC, -- 펀드코드
        OPR01_ITEM_CD ASC -- 종목코드
    )
;
-- 운용지시
ALTER TABLE EDU.OPR01_CONT
    ADD CONSTRAINT PK_OPR01_CONT
         -- 운용지시 기본키
    PRIMARY KEY 
    USING INDEX PK_OPR01_CONT;

-- 운용지시 기본키
COMMENT ON CONSTRAINT PK_OPR01_CONT ON EDU.OPR01_CONT IS '운용지시 기본키';


-- ======================================================================================================
-- 보유원장
CREATE TABLE EDU.BOK01_BOOK
(
    BOK01_BOOK_ID   VARCHAR(13) NOT NULL, -- 원장ID
    BOK01_HOLD_DATE VARCHAR(8)  NOT NULL, -- 보유일자
    BOK01_FUND_CD   VARCHAR(12) NOT NULL, -- 펀드코드
    BOK01_ITEM_CD   VARCHAR(12) NOT NULL, -- 종목코드
    BOK01_HOLD_QTY  NUMERIC     NULL,     -- 보유수량
    BOK01_PUR_AMT   NUMERIC     NULL,     -- 취득금액
    BOK01_BOOK_AMT  NUMERIC     NULL,     -- 장부금액
    BOK01_EVAL_AMT  NUMERIC     NULL,     -- 평가금액
    BOK01_EVAL_PL   NUMERIC     NULL,     -- 평가손익
    BOK01_EVAL_YN   VARCHAR(5)  NULL      -- 평가여부
);

-- 보유원장
COMMENT ON TABLE EDU.BOK01_BOOK IS '보유원장';

-- 원장ID
COMMENT ON COLUMN EDU.BOK01_BOOK.BOK01_BOOK_ID IS '원장ID';

-- 보유일자
COMMENT ON COLUMN EDU.BOK01_BOOK.BOK01_HOLD_DATE IS '보유일자';

-- 펀드코드
COMMENT ON COLUMN EDU.BOK01_BOOK.BOK01_FUND_CD IS '펀드코드';

-- 종목코드
COMMENT ON COLUMN EDU.BOK01_BOOK.BOK01_ITEM_CD IS '종목코드';

-- 보유수량
COMMENT ON COLUMN EDU.BOK01_BOOK.BOK01_HOLD_QTY IS '보유수량';

-- 취득금액
COMMENT ON COLUMN EDU.BOK01_BOOK.BOK01_PUR_AMT IS '취득금액';

-- 장부금액
COMMENT ON COLUMN EDU.BOK01_BOOK.BOK01_BOOK_AMT IS '장부금액';

-- 평가금액
COMMENT ON COLUMN EDU.BOK01_BOOK.BOK01_EVAL_AMT IS '평가금액';

-- 평가손익
COMMENT ON COLUMN EDU.BOK01_BOOK.BOK01_EVAL_PL IS '평가손익';

-- 평가여부
COMMENT ON COLUMN EDU.BOK01_BOOK.BOK01_EVAL_YN IS '평가여부';

-- 보유원장
ALTER TABLE EDU.BOK01_BOOK
    ADD CONSTRAINT PK_BOK01_BOOK
         -- 보유원장 기본키
    PRIMARY KEY (
        BOK01_BOOK_ID,   -- 원장ID
        BOK01_HOLD_DATE, -- 보유일자
        BOK01_FUND_CD,   -- 펀드코드
        BOK01_ITEM_CD    -- 종목코드
        );

-- 보유원장 기본키
COMMENT ON CONSTRAINT PK_BOK01_BOOK ON EDU.BOK01_BOOK IS '보유원장 기본키';

-- ======================================================================================================
-- 분개장
CREATE TABLE EDU.JNL01_JOURNAL
(
    JNL01_CONT_ID    VARCHAR(13) NOT NULL, -- 체결ID
    JNL01_SEQ        NUMERIC     NOT NULL, -- 순번
    JNL01_DR_ACNT_CD VARCHAR(10) NULL,     -- 차변계정코드
    JNL01_DR_AMT     NUMERIC     NULL,     -- 차변금액
    JNL01_CR_ACNT_CD VARCHAR(10) NULL,     -- 대변계정코드
    JNL01_CR_AMT     NUMERIC     NULL      -- 대변금액
);

-- 분개장
COMMENT ON TABLE EDU.JNL01_JOURNAL IS '분개장';

-- 체결ID
COMMENT ON COLUMN EDU.JNL01_JOURNAL.JNL01_CONT_ID IS '체결ID';

-- 순번
COMMENT ON COLUMN EDU.JNL01_JOURNAL.JNL01_SEQ IS '순번';

-- 차변계정코드
COMMENT ON COLUMN EDU.JNL01_JOURNAL.JNL01_DR_ACNT_CD IS '차변계정코드';

-- 차변금액
COMMENT ON COLUMN EDU.JNL01_JOURNAL.JNL01_DR_AMT IS '차변금액';

-- 대변계정코드
COMMENT ON COLUMN EDU.JNL01_JOURNAL.JNL01_CR_ACNT_CD IS '대변계정코드';

-- 대변금액
COMMENT ON COLUMN EDU.JNL01_JOURNAL.JNL01_CR_AMT IS '대변금액';

-- 분개장 기본키
CREATE UNIQUE INDEX PK_JNL01_JOURNAL
    ON EDU.JNL01_JOURNAL
    ( -- 분개장
        JNL01_CONT_ID ASC, -- 체결ID
        JNL01_SEQ ASC -- 순번
    )
;
-- 분개장
ALTER TABLE EDU.JNL01_JOURNAL
    ADD CONSTRAINT PK_JNL01_JOURNAL
         -- 분개장 기본키
    PRIMARY KEY 
    USING INDEX PK_JNL01_JOURNAL;

-- 분개장 기본키
COMMENT ON CONSTRAINT PK_JNL01_JOURNAL ON EDU.JNL01_JOURNAL IS '분개장 기본키';

-- ======================================================================================================
-- 임시분개장
CREATE TABLE EDU.JNL02_JOURNAL_TMP
(
    JNL02_CONT_ID      VARCHAR(13) NOT NULL, -- 체결ID
    JNL02_SEQ          NUMERIC     NOT NULL, -- 순번
    JNL02_DRCR_TYPE    VARCHAR(1)  NOT NULL, -- 차대구분(DrcrType)
    JNL02_REPR_ACNT_CD VARCHAR(10) NOT NULL, -- 대표계정코드
    JNL02_AMT          NUMERIC     NULL      -- 금액
);

-- 임시분개장
COMMENT ON TABLE EDU.JNL02_JOURNAL_TMP IS '임시분개장';

-- 체결ID
COMMENT ON COLUMN EDU.JNL02_JOURNAL_TMP.JNL02_CONT_ID IS '체결ID';

-- 순번
COMMENT ON COLUMN EDU.JNL02_JOURNAL_TMP.JNL02_SEQ IS '순번';

-- 차대구분(DrcrType)
COMMENT ON COLUMN EDU.JNL02_JOURNAL_TMP.JNL02_DRCR_TYPE IS '차대구분(DrcrType)';

-- 대표계정코드
COMMENT ON COLUMN EDU.JNL02_JOURNAL_TMP.JNL02_REPR_ACNT_CD IS '대표계정코드';

-- 금액
COMMENT ON COLUMN EDU.JNL02_JOURNAL_TMP.JNL02_AMT IS '금액';

-- 임시분개장 기본키
CREATE UNIQUE INDEX PK_JNL02_JOURNAL_TMP
    ON EDU.JNL02_JOURNAL_TMP
    ( -- 임시분개장
        JNL02_CONT_ID ASC, -- 체결ID
        JNL02_SEQ ASC -- 순번
    )
;
-- 임시분개장
ALTER TABLE EDU.JNL02_JOURNAL_TMP
    ADD CONSTRAINT PK_JNL02_JOURNAL_TMP
         -- 임시분개장 기본키
    PRIMARY KEY 
    USING INDEX PK_JNL02_JOURNAL_TMP;

-- 임시분개장 기본키
COMMENT ON CONSTRAINT PK_JNL02_JOURNAL_TMP ON EDU.JNL02_JOURNAL_TMP IS '임시분개장 기본키';

-- ======================================================================================================
-- 계정과목
CREATE TABLE EDU.JNL10_ACNT
(
    JNL10_ACNT_CD      VARCHAR(10)  NOT NULL, -- 계정코드
    JNL10_ACNT_NM      VARCHAR(100) NOT NULL, -- 계정명
    JNL10_PARENT_CD    VARCHAR(10)  NULL,     -- 상위계정코드
    JNL10_ACNT_ATTR_CD VARCHAR(1)   NULL,     -- 계정속성(AcntAttrCode)
    JNL10_DRCR_TYPE    VARCHAR(1)   NULL,     -- 차대구분(DrcrType)
    JNL10_SLIP_YN      VARCHAR(5)   NULL,     -- 전표생성여부
    JNL10_USE_YN       VARCHAR(5)   NULL      -- 사용여부
);

-- 계정과목
COMMENT ON TABLE EDU.JNL10_ACNT IS '계정과목';

-- 계정코드
COMMENT ON COLUMN EDU.JNL10_ACNT.JNL10_ACNT_CD IS '계정코드';

-- 계정명
COMMENT ON COLUMN EDU.JNL10_ACNT.JNL10_ACNT_NM IS '계정명';

-- 상위계정코드
COMMENT ON COLUMN EDU.JNL10_ACNT.JNL10_PARENT_CD IS '상위계정코드';

-- 계정속성(AcntAttrCode)
COMMENT ON COLUMN EDU.JNL10_ACNT.JNL10_ACNT_ATTR_CD IS '계정속성(AcntAttrCode)';

-- 차대구분(DrcrType)
COMMENT ON COLUMN EDU.JNL10_ACNT.JNL10_DRCR_TYPE IS '차대구분(DrcrType)';

-- 전표생성여부
COMMENT ON COLUMN EDU.JNL10_ACNT.JNL10_SLIP_YN IS '전표생성여부';

-- 사용여부
COMMENT ON COLUMN EDU.JNL10_ACNT.JNL10_USE_YN IS '사용여부';

-- 계정과목 기본키
CREATE UNIQUE INDEX PK_JNL10_ACNT
    ON EDU.JNL10_ACNT
    ( -- 계정과목
        JNL10_ACNT_CD ASC -- 계정코드
    )
;
-- 계정과목
ALTER TABLE EDU.JNL10_ACNT
    ADD CONSTRAINT PK_JNL10_ACNT
         -- 계정과목 기본키
    PRIMARY KEY 
    USING INDEX PK_JNL10_ACNT;

-- 계정과목 기본키
COMMENT ON CONSTRAINT PK_JNL10_ACNT ON EDU.JNL10_ACNT IS '계정과목 기본키';

-- ======================================================================================================
-- 대표계정코드
CREATE TABLE EDU.JNL11_REPR_ACNT
(
    JNL11_REPR_ACNT_CD      VARCHAR(4)  NOT NULL, -- 대표계정코드
    JNL11_REPR_ACNT_NM      VARCHAR(50) NULL,     -- 대표계정명
    JNL11_ACNT_ATTRIBUTE_CD VARCHAR(1)  NULL,     -- 계정속성코드(AcntAttrCode)
    JNL11_TGT_REPR_ACNT_CD  VARCHAR(4)  NULL      -- 상대 대표계정코드
);

-- 대표계정코드
COMMENT ON TABLE EDU.JNL11_REPR_ACNT IS '대표계정코드';

-- 대표계정코드
COMMENT ON COLUMN EDU.JNL11_REPR_ACNT.JNL11_REPR_ACNT_CD IS '대표계정코드';

-- 대표계정명
COMMENT ON COLUMN EDU.JNL11_REPR_ACNT.JNL11_REPR_ACNT_NM IS '대표계정명';

-- 계정속성코드(AcntAttrCode)
COMMENT ON COLUMN EDU.JNL11_REPR_ACNT.JNL11_ACNT_ATTRIBUTE_CD IS '계정속성코드(AcntAttrCode)';

-- 상대 대표계정코드
COMMENT ON COLUMN EDU.JNL11_REPR_ACNT.JNL11_TGT_REPR_ACNT_CD IS '상대 대표계정코드';

-- 대표계정코드 기본키
CREATE UNIQUE INDEX PK_JNL11_REPR_ACNT
    ON EDU.JNL11_REPR_ACNT
    ( -- 대표계정코드
        JNL11_REPR_ACNT_CD ASC -- 대표계정코드
    )
;
-- 대표계정코드
ALTER TABLE EDU.JNL11_REPR_ACNT
    ADD CONSTRAINT PK_JNL11_REPR_ACNT
         -- 대표계정코드 기본키
    PRIMARY KEY 
    USING INDEX PK_JNL11_REPR_ACNT;

-- 대표계정코드 기본키
COMMENT ON CONSTRAINT PK_JNL11_REPR_ACNT ON EDU.JNL11_REPR_ACNT IS '대표계정코드 기본키';

-- ======================================================================================================
-- 거래코드
CREATE TABLE EDU.JNL12_TR
(
    JNL12_TR_CD         VARCHAR(4)   NOT NULL, -- 거래코드
    JNL12_TR_NM         VARCHAR(100) NOT NULL, -- 거래명
    JNL12_IN_OUT_TYPE   VARCHAR(1)   NULL,     -- 원장입출고구분(BookInOutType)
    JNL12_USE_PAGE_TYPE VARCHAR(10)  NULL,     -- 사용화면구분
    JNL12_USE_YN        VARCHAR(5)   NULL      -- 사용여부
);

-- 거래코드
COMMENT ON TABLE EDU.JNL12_TR IS '거래코드';

-- 거래코드
COMMENT ON COLUMN EDU.JNL12_TR.JNL12_TR_CD IS '거래코드';

-- 거래명
COMMENT ON COLUMN EDU.JNL12_TR.JNL12_TR_NM IS '거래명';

-- 원장입출고구분(BookInOutType)
COMMENT ON COLUMN EDU.JNL12_TR.JNL12_IN_OUT_TYPE IS '원장입출고구분(BookInOutType)';

-- 사용화면구분
COMMENT ON COLUMN EDU.JNL12_TR.JNL12_USE_PAGE_TYPE IS '사용화면구분';

-- 사용여부
COMMENT ON COLUMN EDU.JNL12_TR.JNL12_USE_YN IS '사용여부';

-- 거래코드
ALTER TABLE EDU.JNL12_TR
    ADD CONSTRAINT PK_JNL12_TR
         -- 거래코드 기본키
    PRIMARY KEY (
        JNL12_TR_CD -- 거래코드
        );

-- 거래코드 기본키
COMMENT ON CONSTRAINT PK_JNL12_TR ON EDU.JNL12_TR IS '거래코드 기본키';

-- ======================================================================================================
-- 거래별 분개맵핑
CREATE TABLE EDU.JNL13_TR_MAP
(
    JNL13_TR_CD        VARCHAR(4)   NOT NULL, -- 거래코드
    JNL13_SEQ          NUMERIC      NOT NULL, -- 순번
    JNL13_REPR_ACNT_CD VARCHAR(4)   NULL,     -- 대표계정코드
    JNL13_DRCR_TYPE    VARCHAR(1)   NULL,     -- 차대구분(DrcrType)
    JNL13_FORMULA      VARCHAR(100) NULL      -- 계산식
);

-- 거래별 분개맵핑
COMMENT ON TABLE EDU.JNL13_TR_MAP IS '거래별 분개맵핑';

-- 거래코드
COMMENT ON COLUMN EDU.JNL13_TR_MAP.JNL13_TR_CD IS '거래코드';

-- 순번
COMMENT ON COLUMN EDU.JNL13_TR_MAP.JNL13_SEQ IS '순번';

-- 대표계정코드
COMMENT ON COLUMN EDU.JNL13_TR_MAP.JNL13_REPR_ACNT_CD IS '대표계정코드';

-- 차대구분(DrcrType)
COMMENT ON COLUMN EDU.JNL13_TR_MAP.JNL13_DRCR_TYPE IS '차대구분(DrcrType)';

-- 계산식
COMMENT ON COLUMN EDU.JNL13_TR_MAP.JNL13_FORMULA IS '계산식';

-- 거래별 분개맵핑 기본키
CREATE UNIQUE INDEX PK_JNL13_TR_MAP
    ON EDU.JNL13_TR_MAP
    ( -- 거래별 분개맵핑
        JNL13_TR_CD ASC, -- 거래코드
        JNL13_SEQ ASC -- 순번
    )
;
-- 거래별 분개맵핑
ALTER TABLE EDU.JNL13_TR_MAP
    ADD CONSTRAINT PK_JNL13_TR_MAP
         -- 거래별 분개맵핑 기본키
    PRIMARY KEY 
    USING INDEX PK_JNL13_TR_MAP;

-- 거래별 분개맵핑 기본키
COMMENT ON CONSTRAINT PK_JNL13_TR_MAP ON EDU.JNL13_TR_MAP IS '거래별 분개맵핑 기본키';

-- ======================================================================================================
-- 실계정맵핑
CREATE TABLE EDU.JNL14_REAL_ACNT_MAP
(
    JNL14_REPR_ACNT_CD VARCHAR(4)  NOT NULL, -- 대표계정코드
    JNL14_LIST_TYPE    VARCHAR(1)  NOT NULL, -- 상장구분(ListType)
    JNL14_MARKET_TYPE  VARCHAR(1)  NOT NULL, -- 시장구분(MarketType)
    JNL14_REAL_ACNT_CD VARCHAR(10) NULL      -- 실계정코드
);

-- 실계정맵핑
COMMENT ON TABLE EDU.JNL14_REAL_ACNT_MAP IS '실계정맵핑';

-- 대표계정코드
COMMENT ON COLUMN EDU.JNL14_REAL_ACNT_MAP.JNL14_REPR_ACNT_CD IS '대표계정코드';

-- 상장구분(ListType)
COMMENT ON COLUMN EDU.JNL14_REAL_ACNT_MAP.JNL14_LIST_TYPE IS '상장구분(ListType)';

-- 시장구분(MarketType)
COMMENT ON COLUMN EDU.JNL14_REAL_ACNT_MAP.JNL14_MARKET_TYPE IS '시장구분(MarketType)';

-- 실계정코드
COMMENT ON COLUMN EDU.JNL14_REAL_ACNT_MAP.JNL14_REAL_ACNT_CD IS '실계정코드';

-- 실계정맵핑 기본키
CREATE UNIQUE INDEX PK_JNL14_REAL_ACNT_MAP
    ON EDU.JNL14_REAL_ACNT_MAP
    ( -- 실계정맵핑
        JNL14_REPR_ACNT_CD ASC, -- 대표계정코드
        JNL14_LIST_TYPE ASC, -- 상장구분(ListType)
        JNL14_MARKET_TYPE ASC -- 시장구분(MarketType)
    )
;
-- 실계정맵핑
ALTER TABLE EDU.JNL14_REAL_ACNT_MAP
    ADD CONSTRAINT PK_JNL14_REAL_ACNT_MAP
         -- 실계정맵핑 기본키
    PRIMARY KEY 
    USING INDEX PK_JNL14_REAL_ACNT_MAP;

-- 실계정맵핑 기본키
COMMENT ON CONSTRAINT PK_JNL14_REAL_ACNT_MAP ON EDU.JNL14_REAL_ACNT_MAP IS '실계정맵핑 기본키';

-- ======================================================================================================
-- 사용자정보
CREATE TABLE PUBLIC.SYS01_USER
(
    SYS01_USER_ID VARCHAR(10)  NOT NULL, -- 사용자ID
    SYS01_USER_NM VARCHAR(100) NOT NULL, -- 사용자명
    SYS01_PWD     VARCHAR(128) NOT NULL  -- 비밀번호
);

-- 사용자정보
COMMENT ON TABLE PUBLIC.SYS01_USER IS '사용자정보';

-- 사용자ID
COMMENT ON COLUMN PUBLIC.SYS01_USER.SYS01_USER_ID IS '사용자ID';

-- 사용자명
COMMENT ON COLUMN PUBLIC.SYS01_USER.SYS01_USER_NM IS '사용자명';

-- 비밀번호
COMMENT ON COLUMN PUBLIC.SYS01_USER.SYS01_PWD IS '비밀번호';

-- 사용자정보 기본키
CREATE UNIQUE INDEX PK_SYS01_USER
    ON PUBLIC.SYS01_USER
    ( -- 사용자정보
        SYS01_USER_ID ASC -- 사용자ID
    )
;
-- 사용자정보
ALTER TABLE PUBLIC.SYS01_USER
    ADD CONSTRAINT PK_SYS01_USER
         -- 사용자정보 기본키
    PRIMARY KEY 
    USING INDEX PK_SYS01_USER;

-- 사용자정보 기본키
COMMENT ON CONSTRAINT PK_SYS01_USER ON PUBLIC.SYS01_USER IS '사용자정보 기본키';

-- ======================================================================================================
-- 공통코드
CREATE TABLE PUBLIC.COM02_CODE
(
    COM02_COM_CD    VARCHAR(100) NOT NULL, -- 공통코드
    COM02_DTL_CD    VARCHAR(100) NOT NULL, -- 세부코드
    COM02_CODE_NM   VARCHAR(100) NOT NULL, -- 코드명
    COM02_CODE_TYPE VARCHAR(1)   NULL,     -- 코드구분(C/D)
    COM02_SEQ       NUMERIC      NULL,     -- 순번
    COM02_USE_YN    VARCHAR(5)   NULL,     -- 사용여부
    COM02_NOTE      VARCHAR(100) NULL      -- 비고
);

-- 공통코드
COMMENT ON TABLE PUBLIC.COM02_CODE IS '공통코드';

-- 공통코드
COMMENT ON COLUMN PUBLIC.COM02_CODE.COM02_COM_CD IS '공통코드';

-- 세부코드
COMMENT ON COLUMN PUBLIC.COM02_CODE.COM02_DTL_CD IS '세부코드';

-- 코드명
COMMENT ON COLUMN PUBLIC.COM02_CODE.COM02_CODE_NM IS '코드명';

-- 코드구분(C/D)
COMMENT ON COLUMN PUBLIC.COM02_CODE.COM02_CODE_TYPE IS '코드구분(C/D)';

-- 순번
COMMENT ON COLUMN PUBLIC.COM02_CODE.COM02_SEQ IS '순번';

-- 사용여부
COMMENT ON COLUMN PUBLIC.COM02_CODE.COM02_USE_YN IS '사용여부';

-- 비고
COMMENT ON COLUMN PUBLIC.COM02_CODE.COM02_NOTE IS '비고';

-- 공통코드 기본키
CREATE UNIQUE INDEX PK_COM02_CODE
    ON PUBLIC.COM02_CODE
    ( -- 공통코드
        COM02_COM_CD ASC, -- 공통코드
        COM02_DTL_CD ASC -- 세부코드
    )
;
-- 공통코드
ALTER TABLE PUBLIC.COM02_CODE
    ADD CONSTRAINT PK_COM02_CODE
         -- 공통코드 기본키
    PRIMARY KEY 
    USING INDEX PK_COM02_CODE;

-- 공통코드 기본키
COMMENT ON CONSTRAINT PK_COM02_CODE ON PUBLIC.COM02_CODE IS '공통코드 기본키';

-- ======================================================================================================
-- 기관정보
CREATE TABLE PUBLIC.COM01_CORP
(
    COM01_CORP_CD      VARCHAR(12)  NOT NULL, -- 기관코드
    COM01_CORP_NM      VARCHAR(100) NOT NULL, -- 기관명
    COM01_CORP_TYPE    VARCHAR(2)   NOT NULL, -- 기관구분(CorpType)
    COM01_CORP_ENM     VARCHAR(100) NULL,     -- 기관영문명
    COM01_EXTN_CORP_CD VARCHAR(12)  NULL      -- 대외코드
);

-- 기관정보
COMMENT ON TABLE PUBLIC.COM01_CORP IS '기관정보';

-- 기관코드
COMMENT ON COLUMN PUBLIC.COM01_CORP.COM01_CORP_CD IS '기관코드';

-- 기관명
COMMENT ON COLUMN PUBLIC.COM01_CORP.COM01_CORP_NM IS '기관명';

-- 기관구분(CorpType)
COMMENT ON COLUMN PUBLIC.COM01_CORP.COM01_CORP_TYPE IS '기관구분(CorpType)';

-- 기관영문명
COMMENT ON COLUMN PUBLIC.COM01_CORP.COM01_CORP_ENM IS '기관영문명';

-- 대외코드
COMMENT ON COLUMN PUBLIC.COM01_CORP.COM01_EXTN_CORP_CD IS '대외코드';

-- 기관정보 기본키
CREATE UNIQUE INDEX PK_COM01_CORP
    ON PUBLIC.COM01_CORP
    ( -- 기관정보
        COM01_CORP_CD ASC -- 기관코드
    )
;
-- 기관정보
ALTER TABLE PUBLIC.COM01_CORP
    ADD CONSTRAINT PK_COM01_CORP
         -- 기관정보 기본키
    PRIMARY KEY 
    USING INDEX PK_COM01_CORP;

-- 기관정보 기본키
COMMENT ON CONSTRAINT PK_COM01_CORP ON PUBLIC.COM01_CORP IS '기관정보 기본키';

-- ======================================================================================================
-- 일자정보
CREATE TABLE PUBLIC.COM03_DATE
(
    COM03_DAY     VARCHAR(8)   NOT NULL, -- 일자
    COM03_WEEKDAY VARCHAR(10)  NOT NULL, -- 요일
    COM03_BIZ_YN  VARCHAR(5)   NOT NULL, -- 영업일여부
    COM03_NOTE    VARCHAR(100) NULL      -- 비고
);

-- 일자정보
COMMENT ON TABLE PUBLIC.COM03_DATE IS '일자정보';

-- 일자
COMMENT ON COLUMN PUBLIC.COM03_DATE.COM03_DAY IS '일자';

-- 요일
COMMENT ON COLUMN PUBLIC.COM03_DATE.COM03_WEEKDAY IS '요일';

-- 영업일여부
COMMENT ON COLUMN PUBLIC.COM03_DATE.COM03_BIZ_YN IS '영업일여부';

-- 비고
COMMENT ON COLUMN PUBLIC.COM03_DATE.COM03_NOTE IS '비고';

-- 일자정보 기본키
CREATE UNIQUE INDEX PK_COM03_DATE
    ON PUBLIC.COM03_DATE
    ( -- 일자정보
        COM03_DAY ASC -- 일자
    )
;
-- 일자정보
ALTER TABLE PUBLIC.COM03_DATE
    ADD CONSTRAINT PK_COM03_DATE
         -- 일자정보 기본키
    PRIMARY KEY 
    USING INDEX PK_COM03_DATE;

-- 일자정보 기본키
COMMENT ON CONSTRAINT PK_COM03_DATE ON PUBLIC.COM03_DATE IS '일자정보 기본키';


-- ======================================================================================================
-- 용어사전
CREATE TABLE PUBLIC.SYS02_DICT
(
    SYS02_DICT_ID VARCHAR(13)  NOT NULL, -- 용어사전ID
    SYS02_SHORT   VARCHAR(50)  NULL,     -- 약명
    SYS02_FULL    VARCHAR(200) NULL,     -- Full명
    SYS02_KOR_NM  VARCHAR(200) NULL,     -- 한글명
    SYS02_NOTE    VARCHAR(500) NULL      -- 비고
);

-- 용어사전
COMMENT ON TABLE PUBLIC.SYS02_DICT IS '용어사전';

-- 용어사전ID
COMMENT ON COLUMN PUBLIC.SYS02_DICT.SYS02_DICT_ID IS '용어사전ID';

-- 약명
COMMENT ON COLUMN PUBLIC.SYS02_DICT.SYS02_SHORT IS '약명';

-- Full명
COMMENT ON COLUMN PUBLIC.SYS02_DICT.SYS02_FULL IS 'Full명';

-- 한글명
COMMENT ON COLUMN PUBLIC.SYS02_DICT.SYS02_KOR_NM IS '한글명';

-- 비고
COMMENT ON COLUMN PUBLIC.SYS02_DICT.SYS02_NOTE IS '비고';

-- 용어사전
ALTER TABLE PUBLIC.SYS02_DICT
    ADD CONSTRAINT PK_SYS02_DICT
         -- 용어사전 기본키
    PRIMARY KEY (
        SYS02_DICT_ID -- 용어사전ID
        );

-- 용어사전 기본키
COMMENT ON CONSTRAINT PK_SYS02_DICT ON PUBLIC.SYS02_DICT IS '용어사전 기본키';