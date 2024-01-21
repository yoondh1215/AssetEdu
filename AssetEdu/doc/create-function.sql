--========================================================================================
CREATE OR REPLACE FUNCTION public.f_com_nm (
    p_com_code VARCHAR
   ,p_dtl_code VARCHAR
) RETURNS VARCHAR
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
    v_name  varchar(200);
BEGIN

    IF COALESCE(p_dtl_code,'') = '' THEN
        RETURN NULL;
    END IF;

    SELECT com02_code_nm
      INTO v_name
      FROM com02_code
     WHERE com02_com_cd                   = p_com_code
       AND com02_dtl_cd                   = p_dtl_code
       AND com02_code_type                = 'D'
       AND COALESCE(com02_use_yn,'false') = 'true'
     LIMIT 1;

    RETURN v_name;

EXCEPTION WHEN others THEN RETURN NULL;
END;
$BODY$;


--========================================================================================
CREATE OR REPLACE FUNCTION public.f_corp_nm (
    p_corp_code VARCHAR
) RETURNS VARCHAR
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
    v_name  varchar(200);
BEGIN

    IF COALESCE(p_corp_code,'') = '' THEN
        RETURN NULL;
    END IF;

    SELECT com01_corp_nm
      INTO v_name
      FROM com01_corp
     WHERE com01_corp_cd = p_corp_code;

    RETURN v_name;

EXCEPTION WHEN others THEN RETURN NULL;
END;
$BODY$;


--========================================================================================
/*
CREATE OR REPLACE FUNCTION public.f_format_date (
    p_date VARCHAR
) RETURNS VARCHAR
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
BEGIN
    IF COALESCE(p_date,'') = '' THEN
        RETURN NULL;
    ELSE
        RETURN TO_CHAR(TO_DATE(p_date,'YYYYMMDD'),'YYYY-MM-DD');
    END IF;
EXCEPTION WHEN others THEN RETURN NULL;
END;
$BODY$;
*/


--========================================================================================
CREATE OR REPLACE FUNCTION public.f_seq() 
RETURNS VARCHAR
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
BEGIN
    RETURN to_char(now(),'yyyymmdd')||lpad(cast(nextval('asset_seq') as varchar),5,'0');
EXCEPTION WHEN others THEN RETURN NULL;
END;
$BODY$;


--========================================================================================
CREATE OR REPLACE FUNCTION public.f_get_date (
    p_stdDate   VARCHAR
   ,p_prd       NUMERIC
)
RETURNS VARCHAR
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
    v_date   VARCHAR(8);
BEGIN

    SELECT TO_CHAR(TO_DATE(p_stdDate,'YYYYMMDD') + p_prd * INTERVAL '1day', 'YYYYMMDD')
      INTO v_date;
      
    RETURN v_date;
    
EXCEPTION WHEN OTHERS THEN RETURN NULL;
END;
$BODY$;


--========================================================================================
CREATE OR REPLACE FUNCTION edu.f_get_journalAmt (
    p_sql       VARCHAR
   ,p_contId    VARCHAR
)
RETURNS NUMERIC
LANGUAGE 'plpgsql'
AS $BODY$
-----------------------------------------------------------------------------------------
DECLARE
    v_JNL_AMT   NUMERIC;
    v_SQL       TEXT;
-----------------------------------------------------------------------------------------
BEGIN
    v_SQL := p_sql||''''||p_contId||'''';
    RAISE NOTICE 'v_SQL : %', v_SQL;

    EXECUTE v_SQL INTO v_JNL_AMT;
    -------------------------------------------------------------------------------------
    RETURN v_JNL_AMT;
-----------------------------------------------------------------------------------------
EXCEPTION WHEN OTHERS THEN RETURN 0;
END;
$BODY$;



