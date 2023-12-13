insert into com01_corp
select '01001','삼성전자','01','','00593' union all
select '01002','네이버','01','NAVER','03542' union all
select '01003','카카오','01','kakao','03572' union all
select '01004','LG화학','01','','05191' union all
select '01005','현대오일뱅크','01','','00405' union all
select '01006','두나무','01','','38993' union all
select '01007','케이뱅크','01','','27957' union all
select '01008','노보셀바이오','01','','31463' union all
select '01009','바디프랜드','01','','19139' union all
select '01010','빗썸코리아','01','','34165' union all
select '02001','한국은행','02','THE BANK OF KOREA','001' union all
select '02002','산업은행','02','The Korea Development Bank','002' union all
select '02003','기업은행','02','INDUSTRIAL BANK OF KOREA','003' union all
select '02004','국민은행','02','KOOKMIN BANK','004' union all
select '02005','수협중앙회','02','','007' union all
select '02006','농협중앙회','02','NONGHYUP','011' union all
select '02007','우리은행','02','Woori Bank','020' union all
select '02008','SC제일은행','02','Standard Chartered Bank Korea','023' union all
select '02009','대구은행','02','THE DAEGU BANK LTD','031' union all
select '02010','부산은행','02','BUSAN BANK','032' union all
select '02011','광주은행','02','Kwangju Bank Co., Ltd.','034' union all
select '02012','제주은행','02','Jeju Bank','035' union all
select '02013','새마을금고','02','','045' union all
select '02014','신협중앙회','02','','048' union all
select '02015','상호저축은행','02','','050' union all
select '02016','우체국은행','02','','071' union all
select '02017','하나은행','02','','081' union all
select '02018','신한은행','02','','088' union all
select '02019','케이뱅크','02','','089' union all
select '02020','카카오뱅크','02','KakaoBank Corp.','090' union all
select '03001','유안타증권','03','','209' union all
select '03002','KB증권','03','','218' union all
select '03003','미래에셋대우','03','MIRAE ASSET SECURITIES CO.,LTD.','238' union all
select '03004','삼성증권','03','SAMSUNG SECURITIES CO.,LTD','240' union all
select '03005','한국투자증권','03','KOREA INVESTMENT & SECURITIES CO.,LTD','243' union all
select '03006','NH투자증권','03','','247' union all
select '03007','키움증권','03','','264' union all
select '04001','한국채권투자운용','04','','' union all
select '04002','현대인베스트먼트','04','','' union all
select '04003','미래에셋자산운용','04','','' union all
select '04004','한국투자신탁운용','04','','' union all
select '05001','한국펀드서비스','05','','' union all
select '05002','신한아이타스','05','','' union all
select '05003','우리펀드서비스','05','','' union all
select '05004','하나펀드서비스','05','','' union all
select '05005','미래펀드서비스','05','','';

insert into com02_code
select 'FundType','NONE','펀드유형','C',0,'true' union all
select 'FundType','11','채권형','D',1,'true' union all
select 'FundType','12','채권파생형','D',2,'true' union all
select 'FundType','21','주식형','D',3,'true' union all
select 'FundType','22','주식파생형','D',4,'true' union all
select 'FundType','31','혼합주식형','D',5,'true' union all
select 'FundType','32','혼합주식파생형','D',6,'true' union all
select 'FundType','41','혼합채권형','D',7,'true' union all
select 'FundType','42','혼합채권파생형','D',8,'true' union all
select 'FundType','51','투자계약증권','D',9,'true' union all
select 'FundType','52','투자계약증권파생','D',10,'true' union all
select 'FundType','61','재간접형','D',11,'true' union all
select 'FundType','62','재간접형파생형','D',12,'true' union all
select 'FundType','71','부동산형','D',13,'true' union all
select 'FundType','72','부동산파생형','D',14,'true' union all
select 'FundType','81','특별자산','D',15,'true' union all
select 'FundType','82','특별자산파생','D',16,'true' union all
select 'FundType','91','혼합자산','D',17,'true' union all
select 'FundType','92','혼합자산파생','D',18,'true' union all
select 'FundType','EE','단기금융(MMF)','D',19,'true' union all
select 'FundType','VV','변액보험','D',20,'true' union all
select 'PublicCode','NONE','공모/사모코드','C',0,'true' union all
select 'PublicCode','1','공모-국내투자','D',1,'true' union all
select 'PublicCode','2','공모-해외투자(60%)','D',2,'true' union all
select 'PublicCode','3','공모-국내외혼합(30%)','D',3,'true' union all
select 'PublicCode','4','사모-국내투자','D',4,'true' union all
select 'PublicCode','5','사모-해외투자(60%)','D',5,'true' union all
select 'PublicCode','6','사모-국내외혼합(30%)','D',6,'true' union all
select 'FundParentCode','NONE','모자구분코드','C',0,'true' union all
select 'FundParentCode','1','일반','D',1,'true' union all
select 'FundParentCode','2','모신탁','D',2,'true' union all
select 'FundParentCode','3','자신탁','D',3,'true' union all
select 'FundUnitCode','NONE','펀드단위코드','C',0,'true' union all
select 'FundUnitCode','1','추가개방','D',1,'true' union all
select 'FundUnitCode','2','추가폐쇄','D',2,'true' union all
select 'FundUnitCode','3','단위개방','D',3,'true' union all
select 'FundUnitCode','4','단위폐쇄','D',4,'true' union all
select 'CurCode','NONE','통화코드','C',0,'true' union all
select 'CurCode','KRW','KRW','D',1,'true' union all
select 'CurCode','USD','USD','D',2,'true' union all
select 'CurCode','EUR','EUR','D',3,'true' union all
select 'BookInOutType','NONE','원장입출고구분','C',0,'true' union all
select 'BookInOutType','1','입고','D',1,'true' union all
select 'BookInOutType','2','출고','D',2,'true' union all
select 'BookInOutType','3','평가','D',3,'true' union all
select 'TrStatusCode','NONE','거래상태코드','C',0,'true' union all
select 'TrStatusCode','0','미처리','D',0,'true' union all
select 'TrStatusCode','1','처리완료','D',1,'true' union all
select 'TrStatusCode','9','취소','D',9,'true' union all
select 'StkIssType','NONE','발행구분','C',0,'true' union all
select 'StkIssType','1','공모','D',1,'true' union all
select 'StkIssType','2','사모','D',2,'true' union all
select 'StkType','NONE','증권종류','C',0,'true' union all
select 'StkType','0','없음','D',0,'true' union all
select 'StkType','1','보통주','D',1,'true' union all
select 'StkType','2','우선주','D',2,'true' union all
select 'StkType','3','전환보통주','D',3,'true' union all
select 'StkType','4','전환우선주','D',4,'true' union all
select 'ListType','NONE','상장구분','C',0,'true' union all
select 'ListType','1','상장','D',1,'true' union all
select 'ListType','2','비상장','D',2,'true' union all
select 'ListType','3','상장폐지','D',3,'true' union all
select 'MarketType','NONE','시장구분','C',0,'true' union all
select 'MarketType','0','없음','D',0,'true' union all
select 'MarketType','1','코스피','D',1,'true' union all
select 'MarketType','2','코스닥','D',2,'true' union all
select 'MarketType','3','코넥스','D',3,'true' union all
select 'AcntAttrCode','NONE','계정속성코드','C',0,'true' union all
select 'AcntAttrCode','1','자산','D',1,'true' union all
select 'AcntAttrCode','2','부채','D',2,'true' union all
select 'AcntAttrCode','3','자본','D',3,'true' union all
select 'AcntAttrCode','4','이익','D',4,'true' union all
select 'AcntAttrCode','5','손실','D',5,'true' union all
select 'AcntAttrCode','9','부외계정','D',9,'true' union all
select 'DrcrType','NONE','차대구분','C',0,'true' union all
select 'DrcrType','D','차변','D',1,'true' union all
select 'DrcrType','C','대변','D',2,'true' union all
select 'CorpType','NONE','기관구분','C',0,'true' union all
select 'CorpType','01','일반','D',1,'true' union all
select 'CorpType','02','은행','D',2,'true' union all
select 'CorpType','03','증권사','D',3,'true' union all
select 'CorpType','04','운용사','D',4,'true' union all
select 'CorpType','05','사무수탁사','D',5,'true';

insert into jnl10_acnt
select '1000000','자산','','1','D','false','true' union all
select '1010000','유동성자산','1000000','1','D','false','true' union all
select '1010100','예금','1010000','1','D','true','true' union all
select '1010200','공모청약금','1010000','1','D','true','true' union all
select '1010300','주식매매증거금','1010000','1','D','true','true' union all
select '1010400','선물/옵션위탁증거금','1010000','1','D','true','true' union all
select '1010500','정기예금','1010000','1','D','true','true' union all
select '1010600','기업어음','1010000','1','D','true','true' union all
select '1010700','발행어음','1010000','1','D','true','true' union all
select '1010800','CD','1010000','1','D','true','true' union all
select '1010900','REPO매수','1010000','1','D','true','true' union all
select '1011000','외화예금','1010000','1','D','true','true' union all
select '1019900','기타','1010000','1','D','true','true' union all
select '1020000','증권','1000000','1','D','false','true' union all
select '1020100','지분증권','1020000','1','D','false','true' union all
select '1020101','상장주식','1020100','1','D','true','true' union all
select '1020102','코스닥주식','1020100','1','D','true','true' union all
select '1020103','코스넥주식','1020100','1','D','true','true' union all
select '1020104','주식형ETF/ETN','1020100','1','D','true','true' union all
select '1020105','비상장주식','1020100','1','D','true','true' union all
select '1020200','채무증권','1020000','1','D','false','true' union all
select '1020201','국채','1020200','1','D','true','true' union all
select '1020202','지방채','1020200','1','D','true','true' union all
select '1020203','특수채','1020200','1','D','true','true' union all
select '1020204','금융채','1020200','1','D','true','true' union all
select '1020205','회사채','1020200','1','D','true','true' union all
select '1020206','전자단기사채','1020200','1','D','true','true' union all
select '1020300','집합투자증권','1020000','1','D','false','true' union all
select '1020301','집합투자증권-채권형','1020300','1','D','true','true' union all
select '1020302','집합투자증권-주식형','1020300','1','D','true','true' union all
select '1020303','집합투자증권-부동산','1020300','1','D','true','true' union all
select '1020304','집합투자증권-특별자산','1020300','1','D','true','true' union all
select '1020305','상장집합투자증권','1020300','1','D','true','true' union all
select '1020306','집합투자증권-ETF/ETN','1020300','1','D','true','true' union all
select '1030000','부동산','1000000','1','D','false','true' union all
select '1030100','건물','1030000','1','D','true','true' union all
select '1030200','토지','1030000','1','D','true','true' union all
select '1040000','유형자산','1000000','1','D','false','true' union all
select '1050000','무형자산','1000000','1','D','false','true' union all
select '1050100','영업권','1050000','1','D','true','true' union all
select '1050200','개발비','1050000','1','D','true','true' union all
select '1050300','소프트웨어','1050000','1','D','true','true' union all
select '1050400','회원권','1050000','1','D','true','true' union all
select '1060000','미수금','1000000','1','D','false','true' union all
select '1060100','주식미수금','1060000','1','D','true','true' union all
select '1060200','채권(원금/이자)미수금','1060000','1','D','true','true' union all
select '1060300','선물미수금','1060000','1','D','true','true' union all
select '1060400','옵션미수금','1060000','1','D','true','true' union all
select '1060500','집합투자증권미수금','1060000','1','D','true','true' union all
select '1069900','기타미수금','1060000','1','D','true','true' union all
select '1070000','미수수익','1000000','1','D','false','true' union all
select '1070100','미수이자','1070000','1','D','true','true' union all
select '1070200','경과이자','1070000','1','D','true','true' union all
select '1070300','미수배당금','1070000','1','D','true','true' union all
select '1079900','기타미수수익','1070000','1','D','true','true' union all
select '1080000','선급비용','1000000','1','D','false','true' union all
select '2000000','부채','','2','C','false','true' union all
select '2010000','예수금','2000000','2','C','false','true' union all
select '2020000','차입금','2000000','2','C','false','true' union all
select '2030000','미지급금','2000000','2','C','false','true' union all
select '2030100','주식미지급금','2030000','2','C','true','true' union all
select '2030200','채권미지급금','2030000','2','C','true','true' union all
select '2039900','기타미지급금','2030000','2','C','true','true' union all
select '3000000','자본','','3','C','false','true' union all
select '3010000','자본금','3000000','3','C','false','true' union all
select '3020000','자본잉여금','3000000','3','C','false','true' union all
select '3030000','자본조정','3000000','3','C','false','true' union all
select '3040000','기타포괄손익누계액','3000000','3','C','false','true' union all
select '3050000','이익잉여금','3000000','3','C','false','true' union all
select '4000000','이익','','4','C','false','true' union all
select '4010000','처분이익','4000000','4','C','false','true' union all
select '4010100','주식처분이익','4010000','4','C','true','true' union all
select '4010200','채권처분이익','4010000','4','C','true','true' union all
select '4010300','집합투자증권처분이익','4010000','4','C','true','true' union all
select '4019900','기타처분이익','4010000','4','C','true','true' union all
select '4020000','상환이익','4000000','4','C','false','true' union all
select '4020100','채권상환이익','4020000','4','C','true','true' union all
select '4029900','기타상환이익','4020000','4','C','true','true' union all
select '4030000','배당수익','4000000','4','C','false','true' union all
select '4030100','상장주식배당수익','4030000','4','C','true','true' union all
select '4030200','코스닥주식배당수익','4030000','4','C','true','true' union all
select '4030300','코스넥주식배당수익','4030000','4','C','true','true' union all
select '4030400','주식형ETF/ETN배당수익','4030000','4','C','true','true' union all
select '4030500','비상장주식배당수익','4030000','4','C','true','true' union all
select '4039900','기타배당수익','4030000','4','C','true','true' union all
select '4040000','이자수익','4000000','4','C','false','true' union all
select '4040100','예금이자','4040000','4','C','true','true' union all
select '4040200','채권이자','4040000','4','C','true','true' union all
select '4040300','예탁(담보)금이자','4040000','4','C','true','true' union all
select '4040400','선수이자','4040000','4','C','true','true' union all
select '4049900','기타이자수익','4040000','4','C','true','true' union all
select '4050000','평가이익','4000000','4','C','true','true' union all
select '4050100','주식평가이익','4050000','4','C','true','true' union all
select '4050200','채권평가이익','4050000','4','C','true','true' union all
select '4050300','집합투자증권평가이익','4050000','4','C','true','true' union all
select '4059900','기타평가이익','4050000','4','C','true','true' union all
select '4990000','기타이익','4000000','4','C','false','true' union all
select '5000000','손실','','5','D','false','true' union all
select '5010000','처분손실','5000000','5','D','false','true' union all
select '5010100','주식처분손실','5010000','5','D','true','true' union all
select '5010200','채권처분손실','5010000','5','D','true','true' union all
select '5010300','집합투자증권처분손실','5010000','5','D','true','true' union all
select '5019900','기타처분이익','5010000','5','D','true','true' union all
select '5020000','상환손실','5000000','5','D','false','true' union all
select '5020100','채권상환손실','5020000','5','D','true','true' union all
select '5029900','기타상환손실','5020000','5','D','true','true' union all
select '5030000','매매비용','5000000','5','D','false','true' union all
select '5030100','매매수수료','5030000','5','D','true','true' union all
select '5030200','증권거래세','5030000','5','D','true','true' union all
select '5039900','기타매매비용','5030000','5','D','true','true' union all
select '5040000','평가손실','5000000','5','D','true','true' union all
select '5040100','주식평가손실','5040000','5','D','true','true' union all
select '5040200','채권평가손실','5040000','5','D','true','true' union all
select '5040300','집합투자증권평가손실','5040000','5','D','true','true' union all
select '5049900','기타평가손실','5040000','5','D','true','true' union all
select '5990000','기타손실','5000000','5','D','true','true';

insert into jnl11_repr_acnt
select '1100','자산계정','1','1100' union all
select '1200','미수금계정','1','2200' union all
select '2200','미지급금계정','2','1200' union all
select '4100','처분이익계정','4','5100' union all
select '4200','평가이익계정','4','5200' union all
select '5100','처분손실계정','5','4100' union all
select '5200','평가손실계정','5','4200' union all
select '5800','지급수수료계정','5','' union all
select '5801','거래세계정','5','' union all
select '8888','예금계정','1','8888';

insert into jnl12_tr
select '1001','장내매수','1','BUY','true' union all
select '1002','장외매수','1','BUY','true' union all
select '2001','장내매도','2','SELL','true' union all
select '2002','장외매도','2','SELL','true' union all
select '3001','평가처리','3','EVAL','true' ;

insert into jnl13_tr_map
select '1001',1,'1100','D','opr01_cont_amt' union all
select '1001',2,'5800','D','opr01_fee' union all
select '1001',3,'2200','C','opr01_settle_amt' union all
select '1002',1,'1100','D','opr01_cont_amt' union all
select '1002',2,'5800','D','opr01_fee' union all
select '1002',3,'2200','C','opr01_settle_amt' union all
select '2001',1,'1200','D','opr01_settle_amt' union all
select '2001',2,'5801','D','opr01_tax' union all
select '2001',3,'5800','D','opr01_fee' union all
select '2001',4,'1100','C','opr01_book_amt' union all
select '2002',1,'1200','D','opr01_settle_amt' union all
select '2002',2,'5801','D','opr01_tax' union all
select '2002',3,'5800','D','opr01_fee' union all
select '2002',4,'1100','C','opr01_book_amt' union all
select '3001',1,'1100','D','opr01_tr_pl' union all
select '3001',2,'4200','C','opr01_tr_pl';

insert into jnl14_real_acnt_map
select '1100','1','1','1020101' union all
select '1100','1','2','1020102' union all
select '1100','1','3','1020103' union all
select '1100','2','0','1020105' union all
select '1200','1','1','1060100' union all
select '1200','1','2','1060100' union all
select '1200','1','3','1060100' union all
select '1200','2','0','1060100' union all
select '2200','1','1','2030100' union all
select '2200','1','2','2030100' union all
select '2200','1','3','2030100' union all
select '2200','2','0','2030100' union all
select '4100','1','1','4010100' union all
select '4100','1','2','4010100' union all
select '4100','1','3','4010100' union all
select '4100','2','0','4010100' union all
select '4200','1','1','4050100' union all
select '4200','1','2','4050100' union all
select '4200','1','3','4050100' union all
select '4200','2','0','4050100' union all
select '5100','1','1','5010100' union all
select '5100','1','2','5010100' union all
select '5100','1','3','5010100' union all
select '5100','2','0','5010100' union all
select '5200','1','1','5040100' union all
select '5200','1','2','5040100' union all
select '5200','1','3','5040100' union all
select '5200','2','0','5040100' union all
select '5800','1','1','5030100' union all
select '5800','1','2','5030100' union all
select '5800','1','3','5030100' union all
select '5800','2','0','5030100' union all
select '5801','1','1','5030200' union all
select '5801','1','2','5030200' union all
select '5801','1','3','5030200' union all
select '5801','2','0','5030200' union all
select '8888','1','1','1010100' union all
select '8888','1','2','1010100' union all
select '8888','1','3','1010100' union all
select '8888','2','0','1010100' ;


insert into itm01_item
select 'KR7005930003','삼성전자','SamsungElectronics','005930','','1','1','1',100,'00593' union all
select 'KR7035420009','NAVER','NAVER','035420','','1','1','1',100,'03542' union all
select 'KR7035720002','카카오','Kakao','035720','','1','1','1',100,'03572' union all
select 'KR7051910008','LG화학','LGCHEM,LTD','051910','','1','1','1',5000,'05191' union all
select 'KR7034020008','두산에너빌리티','DOOSAN ENERBILITY','034020','','1','1','1',5000,'03402' union all
select 'KR7009540006','한국조선해양','KOREA SHIPBUILDING & OFFSHORE ENGINEERING','009540','','1','1','1',5000,'00954' union all
select 'KR7003490000','대한항공','KoreanAirLines','003490','','1','1','1',5000,'00349' union all
select 'KR7000270009','기아','KIA CORPORATION','000270','','1','1','1',5000,'00027' union all
select 'KR7278280003','천보','Chunbo Co., Ltd.','278280','','1','1','2',500,'27828' union all
select 'KR7263750002','펄어비스','PearlAbyss Corp.','263750','','1','1','2',100,'26375' union all
select 'KR7104620000','노랑풍선','Yellow Balloon Tour Co., Ltd.','104620','','1','1','2',500,'10462' union all
select 'KR7389030008','지니너스','GENINUS Inc.','389030','','1','1','2',500,'38903' union all
select 'HK0000312568','오가닉티코스메틱','ORGANIC TEA COSMETICS HOLDINGS COMPANY LIMITED','900300','','1','1','2',null,'' union all
select 'KR7140610007','엔솔바이오사이언스','Ensol Biosciences','140610','','1','1','3',500,'14061' union all
select 'KR7176590008','코나솔','KONASOL','176590','','1','1','3',500,'17659' union all
select 'KR7176750008','듀켐바이오','DuChemBio Co.,LTD.','176750','','1','1','3',500,'17675' union all
select 'KR7215570003','크로넥스','CRONEX','215570','','1','1','3',500,'21557' union all
select 'KR7232530006','이엠티','Energy Material Tech','232530','','1','1','3',500,'23253' union all
select 'KR7079160008','CJ CGV','CJ CGV','079160','','1','1','1',500,'07916' union all
select 'KR7293490009','카카오게임즈','Kakao Games Corp.','293490','','1','1','2',100,'29349' union all
select 'KR7005490008','POSCO홀딩스','POSCO Holdings Inc.','005490','','1','1','1',5000,'00549' union all
select 'KR7115390007','락앤락','LOCK&LOCK CO.,LTD.','115390','','1','1','1',500,'11539' union all
select 'KR7211270004','AP위성','Asia Pacific Satellite Inc.','211270','','1','1','2',500,'21127' union all
select 'KR7047820006','초록뱀미디어','CHOROKBAEM MEDIA CO.,LTD.','047820','','1','1','2',5000,'04782' union all
select 'KR700405Z001','현대오일뱅크','','004050','','0','2','0',5000,'00405' union all
select 'KR738993Z001','두나무','','389930','','0','2','0',100,'38993' union all
select 'KR727957Z001','케이뱅크','','279570','','0','2','0',5000,'27957' union all
select 'KR731463Z001','노보셀바이오','','314630','','0','2','0',500,'31463' union all
select 'KR719139Z001','바디프랜드','','191390','','0','2','0',100,'19139' union all
select 'KR734165Z001','빗썸코리아','','341650','','0','2','0',5000,'34165';


insert into fnd01_fund 
select '1001','IPO일반사모투자신탁1호','91','4','1','1','','20211102','',12,'','KRW','KRZ502488400','K554J4DP1382','','0012744C0001','','','04001','03006','05001','' union all
select '1002','스마트하이일드 일반사모투자신탁 1호[채권혼합]','41','4','1','1','','20220106','',12,'','KRW','KRZ502497130','K554J4DQ7586','','0012744C0002','','','04001','03006','05001','' union all
select '1003','스마트메자닌 일반사모투자신탁 1호','91','4','4','1','','20220610','',12,'','KRW','KRZ502516020','K554J4DV1756','','0012744C0003','','','04001','03005','05001','' union all
select '2001','AssetEdu(주식) 종류C1','21','1','1','1','','20220105','',12,'20230105','KRW','','','','','','','04003','02004','05005','' union all
select '2002','AssetEdu(주식) 종류C2','21','1','1','1','','20190821','',12,'20200821','KRW','','','','','','','04004','02017','05001','' ;


insert into com03_date
select '20221101','화요일','true','' union all
select '20221102','수요일','true','' union all
select '20221103','목요일','true','' union all
select '20221104','금요일','true','' union all
select '20221105','토요일','false','' union all
select '20221106','일요일','false','' union all
select '20221107','월요일','true','' union all
select '20221108','화요일','true','' union all
select '20221109','수요일','true','' union all
select '20221110','목요일','true','' union all
select '20221111','금요일','true','' union all
select '20221112','토요일','false','' union all
select '20221113','일요일','false','' union all
select '20221114','월요일','true','' union all
select '20221115','화요일','true','' union all
select '20221116','수요일','true','' union all
select '20221117','목요일','true','' union all
select '20221118','금요일','true','' union all
select '20221119','토요일','false','' union all
select '20221120','일요일','false','' union all
select '20221121','월요일','true','' union all
select '20221122','화요일','true','' union all
select '20221123','수요일','true','' union all
select '20221124','목요일','true','' union all
select '20221125','금요일','true','' union all
select '20221126','토요일','false','' union all
select '20221127','일요일','false','' union all
select '20221128','월요일','true','' union all
select '20221129','화요일','true','' union all
select '20221130','수요일','true','' union all
select '20221201','목요일','true','' union all
select '20221202','금요일','true','' union all
select '20221203','토요일','false','' union all
select '20221204','일요일','false','' union all
select '20221205','월요일','true','' union all
select '20221206','화요일','true','' union all
select '20221207','수요일','true','' union all
select '20221208','목요일','true','' union all
select '20221209','금요일','true','' union all
select '20221210','토요일','false','' union all
select '20221211','일요일','false','' union all
select '20221212','월요일','true','' union all
select '20221213','화요일','true','' union all
select '20221214','수요일','true','' union all
select '20221215','목요일','true','' union all
select '20221216','금요일','true','' union all
select '20221217','토요일','false','' union all
select '20221218','일요일','false','' union all
select '20221219','월요일','true','' union all
select '20221220','화요일','true','' union all
select '20221221','수요일','true','' union all
select '20221222','목요일','true','' union all
select '20221223','금요일','true','' union all
select '20221224','토요일','false','' union all
select '20221225','일요일','false','크리스마스' union all
select '20221226','월요일','true','' union all
select '20221227','화요일','true','' union all
select '20221228','수요일','true','' union all
select '20221229','목요일','true','' union all
select '20221230','금요일','true','' union all
select '20221231','토요일','false','' union all
select '20230101','일요일','false','신정(양력설)' union all
select '20230102','월요일','true','' union all
select '20230103','화요일','true','' union all
select '20230104','수요일','true','' union all
select '20230105','목요일','true','' union all
select '20230106','금요일','true','' union all
select '20230107','토요일','false','' union all
select '20230108','일요일','false','' union all
select '20230109','월요일','true','' union all
select '20230110','화요일','true','' union all
select '20230111','수요일','true','' union all
select '20230112','목요일','true','' union all
select '20230113','금요일','true','' union all
select '20230114','토요일','false','' union all
select '20230115','일요일','false','' union all
select '20230116','월요일','true','' union all
select '20230117','화요일','true','' union all
select '20230118','수요일','true','' union all
select '20230119','목요일','true','' union all
select '20230120','금요일','true','' union all
select '20230121','토요일','false','설날연휴' union all
select '20230122','일요일','false','설날' union all
select '20230123','월요일','false','설날연휴' union all
select '20230124','화요일','false','대체공휴일(설날)' union all
select '20230125','수요일','true','' union all
select '20230126','목요일','true','' union all
select '20230127','금요일','true','' union all
select '20230128','토요일','false','' union all
select '20230129','일요일','false','' union all
select '20230130','월요일','true','' union all
select '20230131','화요일','true','' union all
select '20230201','수요일','true','' union all
select '20230202','목요일','true','' union all
select '20230203','금요일','true','' union all
select '20230204','토요일','false','' union all
select '20230205','일요일','false','' union all
select '20230206','월요일','true','' union all
select '20230207','화요일','true','' union all
select '20230208','수요일','true','' union all
select '20230209','목요일','true','' union all
select '20230210','금요일','true','' union all
select '20230211','토요일','false','' union all
select '20230212','일요일','false','' union all
select '20230213','월요일','true','' union all
select '20230214','화요일','true','' union all
select '20230215','수요일','true','' union all
select '20230216','목요일','true','' union all
select '20230217','금요일','true','' union all
select '20230218','토요일','false','' union all
select '20230219','일요일','false','' union all
select '20230220','월요일','true','' union all
select '20230221','화요일','true','' union all
select '20230222','수요일','true','' union all
select '20230223','목요일','true','' union all
select '20230224','금요일','true','' union all
select '20230225','토요일','false','' union all
select '20230226','일요일','false','' union all
select '20230227','월요일','true','' union all
select '20230228','화요일','true','' union all
select '20230301','수요일','false','3·1절' union all
select '20230302','목요일','true','' union all
select '20230303','금요일','true','' union all
select '20230304','토요일','false','' union all
select '20230305','일요일','false','' union all
select '20230306','월요일','true','' union all
select '20230307','화요일','true','' union all
select '20230308','수요일','true','' union all
select '20230309','목요일','true','' union all
select '20230310','금요일','true','' union all
select '20230311','토요일','false','' union all
select '20230312','일요일','false','' union all
select '20230313','월요일','true','' union all
select '20230314','화요일','true','' union all
select '20230315','수요일','true','' union all
select '20230316','목요일','true','' union all
select '20230317','금요일','true','' union all
select '20230318','토요일','false','' union all
select '20230319','일요일','false','' union all
select '20230320','월요일','true','' union all
select '20230321','화요일','true','' union all
select '20230322','수요일','true','' union all
select '20230323','목요일','true','' union all
select '20230324','금요일','true','' union all
select '20230325','토요일','false','' union all
select '20230326','일요일','false','' union all
select '20230327','월요일','true','' union all
select '20230328','화요일','true','' union all
select '20230329','수요일','true','' union all
select '20230330','목요일','true','' union all
select '20230331','금요일','true','' union all
select '20230401','토요일','false','' union all
select '20230402','일요일','false','' union all
select '20230403','월요일','true','' union all
select '20230404','화요일','true','' union all
select '20230405','수요일','true','' union all
select '20230406','목요일','true','' union all
select '20230407','금요일','true','' union all
select '20230408','토요일','false','' union all
select '20230409','일요일','false','' union all
select '20230410','월요일','true','' union all
select '20230411','화요일','true','' union all
select '20230412','수요일','true','' union all
select '20230413','목요일','true','' union all
select '20230414','금요일','true','' union all
select '20230415','토요일','false','' union all
select '20230416','일요일','false','' union all
select '20230417','월요일','true','' union all
select '20230418','화요일','true','' union all
select '20230419','수요일','true','' union all
select '20230420','목요일','true','' union all
select '20230421','금요일','true','' union all
select '20230422','토요일','false','' union all
select '20230423','일요일','false','' union all
select '20230424','월요일','true','' union all
select '20230425','화요일','true','' union all
select '20230426','수요일','true','' union all
select '20230427','목요일','true','' union all
select '20230428','금요일','true','' union all
select '20230429','토요일','false','' union all
select '20230430','일요일','false','' union all
select '20230501','월요일','true','' union all
select '20230502','화요일','true','' union all
select '20230503','수요일','true','' union all
select '20230504','목요일','true','' union all
select '20230505','금요일','false','어린이날' union all
select '20230506','토요일','false','' union all
select '20230507','일요일','false','' union all
select '20230508','월요일','true','' union all
select '20230509','화요일','true','' union all
select '20230510','수요일','true','' union all
select '20230511','목요일','true','' union all
select '20230512','금요일','true','' union all
select '20230513','토요일','false','' union all
select '20230514','일요일','false','' union all
select '20230515','월요일','true','' union all
select '20230516','화요일','true','' union all
select '20230517','수요일','true','' union all
select '20230518','목요일','true','' union all
select '20230519','금요일','true','' union all
select '20230520','토요일','false','' union all
select '20230521','일요일','false','' union all
select '20230522','월요일','true','' union all
select '20230523','화요일','true','' union all
select '20230524','수요일','true','' union all
select '20230525','목요일','true','' union all
select '20230526','금요일','true','' union all
select '20230527','토요일','false','부처님오신날' union all
select '20230528','일요일','false','' union all
select '20230529','월요일','true','' union all
select '20230530','화요일','true','' union all
select '20230531','수요일','true','' union all
select '20230601','목요일','true','' union all
select '20230602','금요일','true','' union all
select '20230603','토요일','false','' union all
select '20230604','일요일','false','' union all
select '20230605','월요일','true','' union all
select '20230606','화요일','false','현충일' union all
select '20230607','수요일','true','' union all
select '20230608','목요일','true','' union all
select '20230609','금요일','true','' union all
select '20230610','토요일','false','' union all
select '20230611','일요일','false','' union all
select '20230612','월요일','true','' union all
select '20230613','화요일','true','' union all
select '20230614','수요일','true','' union all
select '20230615','목요일','true','' union all
select '20230616','금요일','true','' union all
select '20230617','토요일','false','' union all
select '20230618','일요일','false','' union all
select '20230619','월요일','true','' union all
select '20230620','화요일','true','' union all
select '20230621','수요일','true','' union all
select '20230622','목요일','true','' union all
select '20230623','금요일','true','' union all
select '20230624','토요일','false','' union all
select '20230625','일요일','false','' union all
select '20230626','월요일','true','' union all
select '20230627','화요일','true','' union all
select '20230628','수요일','true','' union all
select '20230629','목요일','true','' union all
select '20230630','금요일','true','' union all
select '20230701','토요일','false','' union all
select '20230702','일요일','false','' union all
select '20230703','월요일','true','' union all
select '20230704','화요일','true','' union all
select '20230705','수요일','true','' union all
select '20230706','목요일','true','' union all
select '20230707','금요일','true','' union all
select '20230708','토요일','false','' union all
select '20230709','일요일','false','' union all
select '20230710','월요일','true','' union all
select '20230711','화요일','true','' union all
select '20230712','수요일','true','' union all
select '20230713','목요일','true','' union all
select '20230714','금요일','true','' union all
select '20230715','토요일','false','' union all
select '20230716','일요일','false','' union all
select '20230717','월요일','true','' union all
select '20230718','화요일','true','' union all
select '20230719','수요일','true','' union all
select '20230720','목요일','true','' union all
select '20230721','금요일','true','' union all
select '20230722','토요일','false','' union all
select '20230723','일요일','false','' union all
select '20230724','월요일','true','' union all
select '20230725','화요일','true','' union all
select '20230726','수요일','true','' union all
select '20230727','목요일','true','' union all
select '20230728','금요일','true','' union all
select '20230729','토요일','false','' union all
select '20230730','일요일','false','' union all
select '20230731','월요일','true','' union all
select '20230801','화요일','true','' union all
select '20230802','수요일','true','' union all
select '20230803','목요일','true','' union all
select '20230804','금요일','true','' union all
select '20230805','토요일','false','' union all
select '20230806','일요일','false','' union all
select '20230807','월요일','true','' union all
select '20230808','화요일','true','' union all
select '20230809','수요일','true','' union all
select '20230810','목요일','true','' union all
select '20230811','금요일','true','' union all
select '20230812','토요일','false','' union all
select '20230813','일요일','false','' union all
select '20230814','월요일','true','' union all
select '20230815','화요일','false','광복절' union all
select '20230816','수요일','true','' union all
select '20230817','목요일','true','' union all
select '20230818','금요일','true','' union all
select '20230819','토요일','false','' union all
select '20230820','일요일','false','' union all
select '20230821','월요일','true','' union all
select '20230822','화요일','true','' union all
select '20230823','수요일','true','' union all
select '20230824','목요일','true','' union all
select '20230825','금요일','true','' union all
select '20230826','토요일','false','' union all
select '20230827','일요일','false','' union all
select '20230828','월요일','true','' union all
select '20230829','화요일','true','' union all
select '20230830','수요일','true','' union all
select '20230831','목요일','true','' union all
select '20230901','금요일','true','' union all
select '20230902','토요일','false','' union all
select '20230903','일요일','false','' union all
select '20230904','월요일','true','' union all
select '20230905','화요일','true','' union all
select '20230906','수요일','true','' union all
select '20230907','목요일','true','' union all
select '20230908','금요일','true','' union all
select '20230909','토요일','false','' union all
select '20230910','일요일','false','' union all
select '20230911','월요일','true','' union all
select '20230912','화요일','true','' union all
select '20230913','수요일','true','' union all
select '20230914','목요일','true','' union all
select '20230915','금요일','true','' union all
select '20230916','토요일','false','' union all
select '20230917','일요일','false','' union all
select '20230918','월요일','true','' union all
select '20230919','화요일','true','' union all
select '20230920','수요일','true','' union all
select '20230921','목요일','true','' union all
select '20230922','금요일','true','' union all
select '20230923','토요일','false','' union all
select '20230924','일요일','false','' union all
select '20230925','월요일','true','' union all
select '20230926','화요일','true','' union all
select '20230927','수요일','true','' union all
select '20230928','목요일','false','추석연휴' union all
select '20230929','금요일','false','추석' union all
select '20230930','토요일','false','추석연휴' union all
select '20231001','일요일','false','' union all
select '20231002','월요일','true','' union all
select '20231003','화요일','false','개천절' union all
select '20231004','수요일','true','' union all
select '20231005','목요일','true','' union all
select '20231006','금요일','true','' union all
select '20231007','토요일','false','' union all
select '20231008','일요일','false','' union all
select '20231009','월요일','false','한글날' union all
select '20231010','화요일','true','' union all
select '20231011','수요일','true','' union all
select '20231012','목요일','true','' union all
select '20231013','금요일','true','' union all
select '20231014','토요일','false','' union all
select '20231015','일요일','false','' union all
select '20231016','월요일','true','' union all
select '20231017','화요일','true','' union all
select '20231018','수요일','true','' union all
select '20231019','목요일','true','' union all
select '20231020','금요일','true','' union all
select '20231021','토요일','false','' union all
select '20231022','일요일','false','' union all
select '20231023','월요일','true','' union all
select '20231024','화요일','true','' union all
select '20231025','수요일','true','' union all
select '20231026','목요일','true','' union all
select '20231027','금요일','true','' union all
select '20231028','토요일','false','' union all
select '20231029','일요일','false','' union all
select '20231030','월요일','true','' union all
select '20231031','화요일','true','' union all
select '20231101','수요일','true','' union all
select '20231102','목요일','true','' union all
select '20231103','금요일','true','' union all
select '20231104','토요일','false','' union all
select '20231105','일요일','false','' union all
select '20231106','월요일','true','' union all
select '20231107','화요일','true','' union all
select '20231108','수요일','true','' union all
select '20231109','목요일','true','' union all
select '20231110','금요일','true','' union all
select '20231111','토요일','false','' union all
select '20231112','일요일','false','' union all
select '20231113','월요일','true','' union all
select '20231114','화요일','true','' union all
select '20231115','수요일','true','' union all
select '20231116','목요일','true','' union all
select '20231117','금요일','true','' union all
select '20231118','토요일','false','' union all
select '20231119','일요일','false','' union all
select '20231120','월요일','true','' union all
select '20231121','화요일','true','' union all
select '20231122','수요일','true','' union all
select '20231123','목요일','true','' union all
select '20231124','금요일','true','' union all
select '20231125','토요일','false','' union all
select '20231126','일요일','false','' union all
select '20231127','월요일','true','' union all
select '20231128','화요일','true','' union all
select '20231129','수요일','true','' union all
select '20231130','목요일','true','' union all
select '20231201','금요일','true','' union all
select '20231202','토요일','false','' union all
select '20231203','일요일','false','' union all
select '20231204','월요일','true','' union all
select '20231205','화요일','true','' union all
select '20231206','수요일','true','' union all
select '20231207','목요일','true','' union all
select '20231208','금요일','true','' union all
select '20231209','토요일','false','' union all
select '20231210','일요일','false','' union all
select '20231211','월요일','true','' union all
select '20231212','화요일','true','' union all
select '20231213','수요일','true','' union all
select '20231214','목요일','true','' union all
select '20231215','금요일','true','' union all
select '20231216','토요일','false','' union all
select '20231217','일요일','false','' union all
select '20231218','월요일','true','' union all
select '20231219','화요일','true','' union all
select '20231220','수요일','true','' union all
select '20231221','목요일','true','' union all
select '20231222','금요일','true','' union all
select '20231223','토요일','false','' union all
select '20231224','일요일','false','' union all
select '20231225','월요일','false','크리스마스' union all
select '20231226','화요일','true','' union all
select '20231227','수요일','true','' union all
select '20231228','목요일','true','' union all
select '20231229','금요일','true','' union all
select '20231230','토요일','false','' union all
select '20231231','일요일','false','' union all
select '20240101','월요일','false','신정(양력설)' union all
select '20240102','화요일','true','' union all
select '20240103','수요일','true','' union all
select '20240104','목요일','true','' union all
select '20240105','금요일','true','' union all
select '20240106','토요일','false','' union all
select '20240107','일요일','false','' union all
select '20240108','월요일','true','' union all
select '20240109','화요일','true','' union all
select '20240110','수요일','true','' union all
select '20240111','목요일','true','' union all
select '20240112','금요일','true','' union all
select '20240113','토요일','false','' union all
select '20240114','일요일','false','' union all
select '20240115','월요일','true','' union all
select '20240116','화요일','true','' union all
select '20240117','수요일','true','' union all
select '20240118','목요일','true','' union all
select '20240119','금요일','true','' union all
select '20240120','토요일','false','' union all
select '20240121','일요일','false','' union all
select '20240122','월요일','true','' union all
select '20240123','화요일','true','' union all
select '20240124','수요일','true','' union all
select '20240125','목요일','true','' union all
select '20240126','금요일','true','' union all
select '20240127','토요일','false','' union all
select '20240128','일요일','false','' union all
select '20240129','월요일','true','' union all
select '20240130','화요일','true','' union all
select '20240131','수요일','true','' union all
select '20240201','목요일','true','' union all
select '20240202','금요일','true','' union all
select '20240203','토요일','false','' union all
select '20240204','일요일','false','' union all
select '20240205','월요일','true','' union all
select '20240206','화요일','true','' union all
select '20240207','수요일','true','' union all
select '20240208','목요일','true','' union all
select '20240209','금요일','false','설날연휴' union all
select '20240210','토요일','false','설날' union all
select '20240211','일요일','false','설날연휴' union all
select '20240212','월요일','false','대체공휴일(설날)' union all
select '20240213','화요일','true','' union all
select '20240214','수요일','true','' union all
select '20240215','목요일','true','' union all
select '20240216','금요일','true','' union all
select '20240217','토요일','false','' union all
select '20240218','일요일','false','' union all
select '20240219','월요일','true','' union all
select '20240220','화요일','true','' union all
select '20240221','수요일','true','' union all
select '20240222','목요일','true','' union all
select '20240223','금요일','true','' union all
select '20240224','토요일','false','' union all
select '20240225','일요일','false','' union all
select '20240226','월요일','true','' union all
select '20240227','화요일','true','' union all
select '20240228','수요일','true','' union all
select '20240229','목요일','true','' union all
select '20240301','금요일','false','3·1절' union all
select '20240302','토요일','false','' union all
select '20240303','일요일','false','' union all
select '20240304','월요일','true','' union all
select '20240305','화요일','true','' union all
select '20240306','수요일','true','' union all
select '20240307','목요일','true','' union all
select '20240308','금요일','true','' union all
select '20240309','토요일','false','' union all
select '20240310','일요일','false','' union all
select '20240311','월요일','true','' union all
select '20240312','화요일','true','' union all
select '20240313','수요일','true','' union all
select '20240314','목요일','true','' union all
select '20240315','금요일','true','' union all
select '20240316','토요일','false','' union all
select '20240317','일요일','false','' union all
select '20240318','월요일','true','' union all
select '20240319','화요일','true','' union all
select '20240320','수요일','true','' union all
select '20240321','목요일','true','' union all
select '20240322','금요일','true','' union all
select '20240323','토요일','false','' union all
select '20240324','일요일','false','' union all
select '20240325','월요일','true','' union all
select '20240326','화요일','true','' union all
select '20240327','수요일','true','' union all
select '20240328','목요일','true','' union all
select '20240329','금요일','true','' union all
select '20240330','토요일','false','' union all
select '20240331','일요일','false','' union all
select '20240401','월요일','true','' union all
select '20240402','화요일','true','' union all
select '20240403','수요일','true','' union all
select '20240404','목요일','true','' union all
select '20240405','금요일','true','' union all
select '20240406','토요일','false','' union all
select '20240407','일요일','false','' union all
select '20240408','월요일','true','' union all
select '20240409','화요일','true','' union all
select '20240410','수요일','true','' union all
select '20240411','목요일','true','' union all
select '20240412','금요일','true','' union all
select '20240413','토요일','false','' union all
select '20240414','일요일','false','' union all
select '20240415','월요일','true','' union all
select '20240416','화요일','true','' union all
select '20240417','수요일','true','' union all
select '20240418','목요일','true','' union all
select '20240419','금요일','true','' union all
select '20240420','토요일','false','' union all
select '20240421','일요일','false','' union all
select '20240422','월요일','true','' union all
select '20240423','화요일','true','' union all
select '20240424','수요일','true','' union all
select '20240425','목요일','true','' union all
select '20240426','금요일','true','' union all
select '20240427','토요일','false','' union all
select '20240428','일요일','false','' union all
select '20240429','월요일','true','' union all
select '20240430','화요일','true','' union all
select '20240501','수요일','false','근로자의 날' union all
select '20240502','목요일','true','' union all
select '20240503','금요일','true','' union all
select '20240504','토요일','false','' union all
select '20240505','일요일','false','어린이날' union all
select '20240506','월요일','false','대체공휴일(어린이날)' union all
select '20240507','화요일','true','' union all
select '20240508','수요일','true','' union all
select '20240509','목요일','true','' union all
select '20240510','금요일','true','' union all
select '20240511','토요일','false','' union all
select '20240512','일요일','false','' union all
select '20240513','월요일','true','' union all
select '20240514','화요일','true','' union all
select '20240515','수요일','false','부처님오신날' union all
select '20240516','목요일','true','' union all
select '20240517','금요일','true','' union all
select '20240518','토요일','false','' union all
select '20240519','일요일','false','' union all
select '20240520','월요일','true','' union all
select '20240521','화요일','true','' union all
select '20240522','수요일','true','' union all
select '20240523','목요일','true','' union all
select '20240524','금요일','true','' union all
select '20240525','토요일','false','' union all
select '20240526','일요일','false','' union all
select '20240527','월요일','true','' union all
select '20240528','화요일','true','' union all
select '20240529','수요일','true','' union all
select '20240530','목요일','true','' union all
select '20240531','금요일','true','' union all
select '20240601','토요일','false','' union all
select '20240602','일요일','false','' union all
select '20240603','월요일','true','' union all
select '20240604','화요일','true','' union all
select '20240605','수요일','true','' union all
select '20240606','목요일','false','현충일' union all
select '20240607','금요일','true','' union all
select '20240608','토요일','false','' union all
select '20240609','일요일','false','' union all
select '20240610','월요일','true','' union all
select '20240611','화요일','true','' union all
select '20240612','수요일','true','' union all
select '20240613','목요일','true','' union all
select '20240614','금요일','true','' union all
select '20240615','토요일','false','' union all
select '20240616','일요일','false','' union all
select '20240617','월요일','true','' union all
select '20240618','화요일','true','' union all
select '20240619','수요일','true','' union all
select '20240620','목요일','true','' union all
select '20240621','금요일','true','' union all
select '20240622','토요일','false','' union all
select '20240623','일요일','false','' union all
select '20240624','월요일','true','' union all
select '20240625','화요일','true','' union all
select '20240626','수요일','true','' union all
select '20240627','목요일','true','' union all
select '20240628','금요일','true','' union all
select '20240629','토요일','false','' union all
select '20240630','일요일','false','' union all
select '20240701','월요일','true','' union all
select '20240702','화요일','true','' union all
select '20240703','수요일','true','' union all
select '20240704','목요일','true','' union all
select '20240705','금요일','true','' union all
select '20240706','토요일','false','' union all
select '20240707','일요일','false','' union all
select '20240708','월요일','true','' union all
select '20240709','화요일','true','' union all
select '20240710','수요일','true','' union all
select '20240711','목요일','true','' union all
select '20240712','금요일','true','' union all
select '20240713','토요일','false','' union all
select '20240714','일요일','false','' union all
select '20240715','월요일','true','' union all
select '20240716','화요일','true','' union all
select '20240717','수요일','true','' union all
select '20240718','목요일','true','' union all
select '20240719','금요일','true','' union all
select '20240720','토요일','false','' union all
select '20240721','일요일','false','' union all
select '20240722','월요일','true','' union all
select '20240723','화요일','true','' union all
select '20240724','수요일','true','' union all
select '20240725','목요일','true','' union all
select '20240726','금요일','true','' union all
select '20240727','토요일','false','' union all
select '20240728','일요일','false','' union all
select '20240729','월요일','true','' union all
select '20240730','화요일','true','' union all
select '20240731','수요일','true','' union all
select '20240801','목요일','true','' union all
select '20240802','금요일','true','' union all
select '20240803','토요일','false','' union all
select '20240804','일요일','false','' union all
select '20240805','월요일','true','' union all
select '20240806','화요일','true','' union all
select '20240807','수요일','true','' union all
select '20240808','목요일','true','' union all
select '20240809','금요일','true','' union all
select '20240810','토요일','false','' union all
select '20240811','일요일','false','' union all
select '20240812','월요일','true','' union all
select '20240813','화요일','true','' union all
select '20240814','수요일','true','' union all
select '20240815','목요일','false','광복절' union all
select '20240816','금요일','true','' union all
select '20240817','토요일','false','' union all
select '20240818','일요일','false','' union all
select '20240819','월요일','true','' union all
select '20240820','화요일','true','' union all
select '20240821','수요일','true','' union all
select '20240822','목요일','true','' union all
select '20240823','금요일','true','' union all
select '20240824','토요일','false','' union all
select '20240825','일요일','false','' union all
select '20240826','월요일','true','' union all
select '20240827','화요일','true','' union all
select '20240828','수요일','true','' union all
select '20240829','목요일','true','' union all
select '20240830','금요일','true','' union all
select '20240831','토요일','false','' union all
select '20240901','일요일','false','' union all
select '20240902','월요일','true','' union all
select '20240903','화요일','true','' union all
select '20240904','수요일','true','' union all
select '20240905','목요일','true','' union all
select '20240906','금요일','true','' union all
select '20240907','토요일','false','' union all
select '20240908','일요일','false','' union all
select '20240909','월요일','true','' union all
select '20240910','화요일','true','' union all
select '20240911','수요일','true','' union all
select '20240912','목요일','true','' union all
select '20240913','금요일','true','' union all
select '20240914','토요일','false','' union all
select '20240915','일요일','false','' union all
select '20240916','월요일','false','추석연휴' union all
select '20240917','화요일','false','추석' union all
select '20240918','수요일','false','추석연휴' union all
select '20240919','목요일','true','' union all
select '20240920','금요일','true','' union all
select '20240921','토요일','false','' union all
select '20240922','일요일','false','' union all
select '20240923','월요일','true','' union all
select '20240924','화요일','true','' union all
select '20240925','수요일','true','' union all
select '20240926','목요일','true','' union all
select '20240927','금요일','true','' union all
select '20240928','토요일','false','' union all
select '20240929','일요일','false','' union all
select '20240930','월요일','true','' union all
select '20241001','화요일','true','' union all
select '20241002','수요일','true','' union all
select '20241003','목요일','false','개천절' union all
select '20241004','금요일','true','' union all
select '20241005','토요일','false','' union all
select '20241006','일요일','false','' union all
select '20241007','월요일','true','' union all
select '20241008','화요일','true','' union all
select '20241009','수요일','false','한글날' union all
select '20241010','목요일','true','' union all
select '20241011','금요일','true','' union all
select '20241012','토요일','false','' union all
select '20241013','일요일','false','' union all
select '20241014','월요일','true','' union all
select '20241015','화요일','true','' union all
select '20241016','수요일','true','' union all
select '20241017','목요일','true','' union all
select '20241018','금요일','true','' union all
select '20241019','토요일','false','' union all
select '20241020','일요일','false','' union all
select '20241021','월요일','true','' union all
select '20241022','화요일','true','' union all
select '20241023','수요일','true','' union all
select '20241024','목요일','true','' union all
select '20241025','금요일','true','' union all
select '20241026','토요일','false','' union all
select '20241027','일요일','false','' union all
select '20241028','월요일','true','' union all
select '20241029','화요일','true','' union all
select '20241030','수요일','true','' union all
select '20241031','목요일','true','' union all
select '20241101','금요일','true','' union all
select '20241102','토요일','false','' union all
select '20241103','일요일','false','' union all
select '20241104','월요일','true','' union all
select '20241105','화요일','true','' union all
select '20241106','수요일','true','' union all
select '20241107','목요일','true','' union all
select '20241108','금요일','true','' union all
select '20241109','토요일','false','' union all
select '20241110','일요일','false','' union all
select '20241111','월요일','true','' union all
select '20241112','화요일','true','' union all
select '20241113','수요일','true','' union all
select '20241114','목요일','true','' union all
select '20241115','금요일','true','' union all
select '20241116','토요일','false','' union all
select '20241117','일요일','false','' union all
select '20241118','월요일','true','' union all
select '20241119','화요일','true','' union all
select '20241120','수요일','true','' union all
select '20241121','목요일','true','' union all
select '20241122','금요일','true','' union all
select '20241123','토요일','false','' union all
select '20241124','일요일','false','' union all
select '20241125','월요일','true','' union all
select '20241126','화요일','true','' union all
select '20241127','수요일','true','' union all
select '20241128','목요일','true','' union all
select '20241129','금요일','true','' union all
select '20241130','토요일','false','' union all
select '20241201','일요일','false','' union all
select '20241202','월요일','true','' union all
select '20241203','화요일','true','' union all
select '20241204','수요일','true','' union all
select '20241205','목요일','true','' union all
select '20241206','금요일','true','' union all
select '20241207','토요일','false','' union all
select '20241208','일요일','false','' union all
select '20241209','월요일','true','' union all
select '20241210','화요일','true','' union all
select '20241211','수요일','true','' union all
select '20241212','목요일','true','' union all
select '20241213','금요일','true','' union all
select '20241214','토요일','false','' union all
select '20241215','일요일','false','' union all
select '20241216','월요일','true','' union all
select '20241217','화요일','true','' union all
select '20241218','수요일','true','' union all
select '20241219','목요일','true','' union all
select '20241220','금요일','true','' union all
select '20241221','토요일','false','' union all
select '20241222','일요일','false','' union all
select '20241223','월요일','true','' union all
select '20241224','화요일','true','' union all
select '20241225','수요일','false','크리스마스' union all
select '20241226','목요일','true','' union all
select '20241227','금요일','true','' union all
select '20241228','토요일','false','' union all
select '20241229','일요일','false','' union all
select '20241230','월요일','true','' union all
select '20241231','화요일','true','' ;


insert into sys02_dict
select f_seq(),'SLIP','slip','전표','' union all
select f_seq(),'','recovery','복구','' union all
select f_seq(),'','Demand Forecasting','수요예측','' union all
select f_seq(),'','Director','임원','누군가를 감독한다는 의미로, 낮은 임원부터 높은 임원까지 디렉터라고 부를 수 있다.' union all
select f_seq(),'','General Manager','임원','Manager들의 상관. 일반적으로 낮은 직급이며, 최고레벨인 경우는 드물다.' union all
select f_seq(),'','Partner','임원','회사의 배당금을 받을 정도의, 즉 임원이라는 뉘앙스다.' union all
select f_seq(),'','Executive','임원','가장 높은 자리에 있는 최고책임자라는 뉘앙스다. Chief Executive Officer 등.' union all
select f_seq(),'','Chief','임원','매우 높은 자리에 있는 장관, 임원이라는 뉘앙스다. Chief Executive Officer, Chief Operations Officer 등. 이들를 C레벨이라고 한다.' union all
select f_seq(),'','Expire','만료되다, 만기가 되다','' union all
select f_seq(),'','Retire','전역하다, 사임하다, 퇴직하다, 은퇴하다','' union all
select f_seq(),'FLOOR_TR','Floor Trading','자기매매','' union all
select f_seq(),'COLLT','collect','회수하다','' union all
select f_seq(),'CHAR','Characteristics','특성','' union all
select f_seq(),'RCNT','recent','최근','' union all
select f_seq(),'OFFCR','Officer','임원','일선이 아니라 사무실에서 일하는 뉘앙스로, 말단 임원부터 최고임원까지 싸잡는다. 다만 실무자 직급으로 쓰이는 경우도 있다.' union all
select f_seq(),'EXTN','External','외부, 대외','' union all
select f_seq(),'','Vice','부, 보조, 대리','' union all
select f_seq(),'','Associate','견습, 초보','' union all
select f_seq(),'','Assign','선임하다, 할당하다','특정 작업, 역할, 임무 또는 책임을 사람에게 지정하거나 할당하는 것을 의미' union all
select f_seq(),'HIRE','Hire','고용하다, 채용하다','' union all
select f_seq(),'SPAR','Separation','분리','' union all
select f_seq(),'UNSPAR','Nonseparation','미분리','' union all
select f_seq(),'ARB_DCSN','Arbitrary Decision','전결','' union all
select f_seq(),'DCM','Document','문서, 서류','' union all
select f_seq(),'CONS','Construction','공사, 건설','' union all
select f_seq(),'CMPLT','Completion','완료, 완성','' union all
select f_seq(),'CMPLT','Complete','준공','' union all
select f_seq(),'RSPTY','Responsibility','책임, 의무','' union all
select f_seq(),'OTH_CMP','Other Company','타사','' union all
select f_seq(),'PR_ORD','Prior Order','선순위, 앞순위','' union all
select f_seq(),'STR','Structured','구조화','' union all
select f_seq(),'SR','Service Request','서비스 요청','' union all
select f_seq(),'HY','half-yearly','반기','' union all
select f_seq(),'CNFM','Confirm','확인','' union all
select f_seq(),'BMT','Business Management','경영관리','' union all
select f_seq(),'COMPLTY','complexity','복잡도','' union all
select f_seq(),'WOATH','Written Oath','서약서','' union all
select f_seq(),'OVS','Overseas','해외','' union all
select f_seq(),'COMM','Committee','위원회','' union all
select f_seq(),'JDGM','Judgment','심사, 감정, 판단','' union all
select f_seq(),'CLLTR','Collateral','담보물','' union all
select f_seq(),'OWNER','Owner','소유자, 주인','' union all
select f_seq(),'LAND','Landed','소유지','' union all
select f_seq(),'FXRATE','FOREIGN EXCHANGE RATE','환율','' union all
select f_seq(),'ADTR','Auditor','감사관','' union all
select f_seq(),'VIOLATE','violate','위반, 어기다','' union all
select f_seq(),'EQUP','equipment','비품, 용품, 장비','' union all
select f_seq(),'JRT','Join Rate','참여율','' union all
select f_seq(),'DFR','Deferment','거치, 연기','' union all
select f_seq(),'TS_GRD','Trust Grade','신용등급','' union all
select f_seq(),'ALT','Alternative','대체','' union all
select f_seq(),'SELL','Sell','매도, 매출, 판매, 팔다','' union all
select f_seq(),'COM','Common','공통','' union all
select f_seq(),'BUY','Buy','매수, 매입','' union all
select f_seq(),'INFO','Information','정보','' union all
select f_seq(),'RPT ','Report','보고서','' union all
select f_seq(),'DATE','Date','일자','' union all
select f_seq(),'CD','Code','코드','' union all
select f_seq(),'CMP','Company','회사','' union all
select f_seq(),'NM','Name','명','' union all
select f_seq(),'BIZ','Business','사업','' union all
select f_seq(),'NO','Number','번호, 순위','' union all
select f_seq(),'TEL','Telephone','전화, 연락처','' union all
select f_seq(),'ADDR','Address','주소','' union all
select f_seq(),'RMK','Remarks','비고','' union all
select f_seq(),'USR','User','사용자','' union all
select f_seq(),'EMAIL','E-Mail','E-Mail','' union all
select f_seq(),'MENU','Menu','메뉴','' union all
select f_seq(),'USE','Use','사용','' union all
select f_seq(),'YN','YesNo','유무(여부)','' union all
select f_seq(),'SEQ','Sequence','순번(순서), 일련번호','' union all
select f_seq(),'PRNT','Parent','상위, 모','' union all
select f_seq(),'CSS','Class','클래스, 분류','' union all
select f_seq(),'ROLE','Role','역할','' union all
select f_seq(),'PRC','Price','가격, 가액, 단가','' union all
select f_seq(),'ACNT','Account','계정, 계좌','' union all
select f_seq(),'JNL','Journalize','분개장','' union all
select f_seq(),'DPT','Department','부서','' union all
select f_seq(),'DR','Debit','차변','' union all
select f_seq(),'CR','Credit','대변','' union all
select f_seq(),'AMT','Amount','금액','' union all
select f_seq(),'INT','Interest','이자, 관심, 흥미','' union all
select f_seq(),'PAY','Pay','지급, 납부, 납입','' union all
select f_seq(),'INS','Insert','생성, 삽입','' union all
select f_seq(),'UPD','Update','수정','' union all
select f_seq(),'TERMS','Terms','용어','' union all
select f_seq(),'DICT','dictionary','사전','' union all
select f_seq(),'SHT','Short','약어, 단축','' union all
select f_seq(),'FULL','Full','전체','' union all
select f_seq(),'KOR','Korea','한국, 한글','' union all
select f_seq(),'AVG','Average','평균','' union all
select f_seq(),'DELIST','DELIST','폐지','' union all
select f_seq(),'FACE','Surface','표면','' union all
select f_seq(),'LMT','Limit','한도, 제한','' union all
select f_seq(),'POS','Position','위치, 시점','' union all
select f_seq(),'BRK','Brokerage','위탁, 중개','' union all
select f_seq(),'RSK','Risk','위험','' union all
select f_seq(),'BNK','Bank','은행','' union all
select f_seq(),'CRFWD','Carried forward','이월','' union all
select f_seq(),'REG','Recognition','인식, 승인','' union all
select f_seq(),'ADV','Advisory','자문','' union all
select f_seq(),'CORP','Corporation','기업, 업체, 기관, 법인','' union all
select f_seq(),'TRSY','Treasury','자금','' union all
select f_seq(),'CAP','Capital','자본, 자본금','' union all
select f_seq(),'CND','Condition','조건','' union all
select f_seq(),'MDW','Midway','중도','' union all
select f_seq(),'END','End','종료','' union all
select f_seq(),'RRNO','Resident Registration Number','주민등록번호','' union all
select f_seq(),'ITN','Internal','내부, 자체','' union all
select f_seq(),'YEAR','Year','년','' union all
select f_seq(),'SESN','Session','회기','' union all
select f_seq(),'MDF','Modify','수정, 정정, 보정','' union all
select f_seq(),'MKT','Market','시장','' union all
select f_seq(),'DIV','Dividend','안분, 배당, 배당금, 분할','' union all
select f_seq(),'ENG','English','영문','' union all
select f_seq(),'ENM','English Name','영문명','' union all
select f_seq(),'UNT','Unit','단위','' union all
select f_seq(),'ODDL','Odd Lot','단주, 단물','거래단위 미만의 주식' union all
select f_seq(),'SCRT','Security','담보','' union all
select f_seq(),'TDY','Today','당일','' union all
select f_seq(),'COST','Cost','대금, 비용','' union all
select f_seq(),'COMP','Compare','비교, 대사','' union all
select f_seq(),'BRLD','Borrowing and lending','대차','' union all
select f_seq(),'GRT','Guarantee','보장','' union all
select f_seq(),'MGRT','Maturity guarantee','만기보장','' union all
select f_seq(),'EMAIL','E-Mail','메일','' union all
select f_seq(),'TR','Transaction','거래, 매매','' union all
select f_seq(),'GRP','Group','그룹','' union all
select f_seq(),'MAP','Mapping','매핑','' union all
select f_seq(),'TMP','Temp','임시','' union all
select f_seq(),'OLD','Old','구','' union all
select f_seq(),'ISS','Issue','발행, 발급','' union all
select f_seq(),'PROC','Process','프로세스, 처리','' union all
select f_seq(),'CNNT','Connect','접속','' union all
select f_seq(),'CNT','Count','건수, 횟수','' union all
select f_seq(),'OCC','Occurrence','발생','' union all
select f_seq(),'KNM','Korea Name','한글명','' union all
select f_seq(),'GLB','Global','전역, 세계적인, 전반적인','' union all
select f_seq(),'VAR','Variable','변수','프로그램에서 기억 장소의 상징적인 주소를 나타내기 위하여 사용되는 이름' union all
select f_seq(),'HLF','Half','반, 절반','' union all
select f_seq(),'ERR','Error','에러, 오류','' union all
select f_seq(),'MSG','Message','메세지','' union all
select f_seq(),'QU','Quarter','분기','' union all
select f_seq(),'LOCK','Lock','잠금, 잠그다','' union all
select f_seq(),'BKMK','Book Mark','즐겨찾기','' union all
select f_seq(),'RETR','RETROACTION','소급, 재처리','' union all
select f_seq(),'ETY','Entry','편입','' union all
select f_seq(),'LIST','List','목록','' union all
select f_seq(),'MIN','Minimum','하한','' union all
select f_seq(),'DISC','Discount','할인','' union all
select f_seq(),'FND','Fund','펀드','' union all
select f_seq(),'MRG','Merger','합병','' union all
select f_seq(),'AST','Asset','자산','' union all
select f_seq(),'SCR','Securities','유가증권','' union all
select f_seq(),'LIQDT','Liquidity','유동성','' union all
select f_seq(),'EIR','Effective interest rate','유효이자율','' union all
select f_seq(),'EFF','Effective','유효','' union all
select f_seq(),'ABS','Asset-backed security','유동화','' union all
select f_seq(),'THPRC','Theory price','이론가','' union all
select f_seq(),'CROV','Carryover','이연','' union all
select f_seq(),'PRFT','Profit','이익, 수익','' union all
select f_seq(),'UDR','Underwriting','인수','기업이 유가증권을 발행하는 경우 인수업무를 영위하는 회사가 매출할 목적으로 당해 유가증권의 전부 또는 일부를 취득하거나 당해 유가증권의 매출을 주선하면서 수수료를  취득하는 업무' union all
select f_seq(),'DVR','Delivery','인수도','' union all
select f_seq(),'IAMT','In Amt','입금','' union all
select f_seq(),'OAMT','Out Amt','출금','' union all
select f_seq(),'IOAMT','In Out Amt','입출금','' union all
select f_seq(),'WRK','Work','작업','' union all
select f_seq(),'BAL','Balance','잔고, 잔액','' union all
select f_seq(),'LPRC','Low Price','저가','' union all
select f_seq(),'SND','Send','전송, 제출','' union all
select f_seq(),'CUT','Cut','절사','' union all
select f_seq(),'TAXN','Taxation','세제, 과세제도','' union all
select f_seq(),'UPPER','Upper','상위, 상급, 위쪽','' union all
select f_seq(),'RECSS','Reclassification','재분류','' union all
select f_seq(),'LTV','Loan to Value','담보인정비율','' union all
select f_seq(),'LOSS','Loss','손실','' union all
select f_seq(),'AFBD','Allowance for bad debt','대손충당금','' union all
select f_seq(),'INSPC','Inspection','점검, 검사','' union all
select f_seq(),'LUNAR','Lunar calendar','음력','' union all
select f_seq(),'DAMG','Damage','피해','' union all
select f_seq(),'LOSS_RT','Loss Rate','손실율','' union all
select f_seq(),'CONTN_LOSS','Continuous Loss','지속적 손실','' union all
select f_seq(),'OFFR','offer','제공, 제안, 제의','' union all
select f_seq(),'SORT','Sort','정렬','' union all
select f_seq(),'QTY','Quantity','주수, 수량','' union all
select f_seq(),'WEK','Week','주, 주일, 주차','' union all
select f_seq(),'NAV','Net Asset Value per unit','기준가격','' union all
select f_seq(),'YIELD','Yield','수익률','' union all
select f_seq(),'TYP','Type','구분, 유형','' union all
select f_seq(),'MKT_PRC','Market Price','시가, 시세','' union all
select f_seq(),'NEW','New','신규, 신종','' union all
select f_seq(),'REAL','Real terms','실물, 실질, 알맹이','' union all
select f_seq(),'REAL_RCV','Real receiving','실수령','' union all
select f_seq(),'PAR','Par value','액면, 액면가액','' union all
select f_seq(),'ABBR','Abbreviation','약명, 약어','' union all
select f_seq(),'SOLAR','Solar calendar','양력','' union all
select f_seq(),'LNK','Link','연동','' union all
select f_seq(),'TDY_BAL','Today Balance','당잔','' union all
select f_seq(),'L_CSS','Large Class','대분류','' union all
select f_seq(),'TGT','Target','대상, 상대, 목표','' union all
select f_seq(),'LON','Loan','대여','' union all
select f_seq(),'SUBT','Substitute','대용','' union all
select f_seq(),'DEAL','Deal','매매','' union all
select f_seq(),'TR_CO','Trade Company','매매처','' union all
select f_seq(),'MAX','Maximum','상한','' union all
select f_seq(),'FIX','Fix','고정, 확정','' union all
select f_seq(),'EXRT','Exchange rate','환율','' union all
select f_seq(),'STL','Settlement','결제','' union all
select f_seq(),'BIZ_DATE','Business day','영업일','' union all
select f_seq(),'BIZ','Business','영업','' union all
select f_seq(),'MNTR','Monitoring','모니터링','' union all
select f_seq(),'MNT','Monitor','모니터','' union all
select f_seq(),'PWD','PassWord','암호, 비밀번호','' union all
select f_seq(),'LVL','Level','레벨, 단계','' union all
select f_seq(),'ATT','Attribute','속성','' union all
select f_seq(),'USTL','Unsettled','미결, 미결제','' union all
select f_seq(),'BIZ_REG_NO','Business registration number','사업자등록번호','' union all
select f_seq(),'EST','Establish','설립, 개설','' union all
select f_seq(),'CHRG','Charge','담당','' union all
select f_seq(),'STT','Start','시작, 개시','' union all
select f_seq(),'ACR_INT','Accrual Interest','경과이자','' union all
select f_seq(),'FOR','Foreign','해외, 외국','' union all
select f_seq(),'TRS_RUL','Transition rule','경과규정','' union all
select f_seq(),'CNC','Cancel','말소, 해제, 취소','' union all
select f_seq(),'HDAY','Holiday','휴일, 휴무','' union all
select f_seq(),'DFW','Day of the week','요일','' union all
select f_seq(),'RGH','Rights','권리','' union all
select f_seq(),'PRN','Principal','원금','' union all
select f_seq(),'DRCR','Debit & Credit','차대','' union all
select f_seq(),'GEN_LDGER','General ledger','총계정원장','' union all
select f_seq(),'PRD','Period','기간','' union all
select f_seq(),'PRT','Product','상품','' union all
select f_seq(),'RND','Round','반올림','' union all
select f_seq(),'DEC','Decimal','소수','' union all
select f_seq(),'TR_CO','Transaction Company','거래처','' union all
select f_seq(),'FSS','Financial Supervisory Service','금융감독원, 금감원','' union all
select f_seq(),'CONT','Contract','계약, 체결, 약정','' union all
select f_seq(),'DPRT','Depreciation ','상각, 감가상각','특정기간 일정 금액을 제각처리하는 것으로 채권의 경우는 액면가 액 초과 혹은 미달액 상당액을 상환기간에 걸쳐 상각함으로써 액면가액 에 접근시키는 것.' union all
select f_seq(),'WIN','Window','화면','' union all
select f_seq(),'TIME','Time','시간','' union all
select f_seq(),'RESULT','Result','결과','' union all
select f_seq(),'RVSN','REVISION','개정, 수정, 검토','' union all
select f_seq(),'ACT','ACTUAL','실제, 현실','' union all
select f_seq(),'GRD','Grade','등급','' union all
select f_seq(),'VAT','Value Added Tax','부가가치세','' union all
select f_seq(),'FV','Fair Value','공정가치','' union all
select f_seq(),'SERS','Series','시리즈, 계열','' union all
select f_seq(),'STK','Stock','주식','' union all
select f_seq(),'BND','Bond','채권, 사채','' union all
select f_seq(),'ITEM','Item','종목','' union all
select f_seq(),'OPR','Operation','운용지시, 주문','' union all
select f_seq(),'EVAL','Evaluation','평가','' union all
select f_seq(),'STD','Standard','기준, 표준','' union all
select f_seq(),'CHK','Check','검증','' union all
select f_seq(),'ETC','Etc.','기타','' union all
select f_seq(),'SYS','System','시스템','' union all
select f_seq(),'MNG','Management','관리','' union all
select f_seq(),'TAX','Tax','세금, 과세','' union all
select f_seq(),'KRX','Korea Exchange','거래소','한국거래소' union all
select f_seq(),'IND','Industry ','산업, 업, 업종','' union all
select f_seq(),'MNG','Manager','담당자, 운용역','' union all
select f_seq(),'ADD','Add','가산, 추가','' union all
select f_seq(),'CHG','Change','변경','' union all
select f_seq(),'WH_TAX','Withholding tax','원천과세','' union all
select f_seq(),'WH_CO','Withholding Company','원천징수처','' union all
select f_seq(),'CALC','Calculation','계산','' union all
select f_seq(),'PDY','Pre Day','전일','' union all
select f_seq(),'FST','First','최초','' union all
select f_seq(),'BSC','Basic','기본, 기초','' union all
select f_seq(),'PC','Parent & Child','모자','' union all
select f_seq(),'PRE_SELL','Previous sell','선매출','' union all
select f_seq(),'IRR','Irregular','불규칙','' union all
select f_seq(),'PRCS','Prices','물가','' union all
select f_seq(),'CONN','Connect','연결','' union all
select f_seq(),'CFC','Coefficient','계수','' union all
select f_seq(),'LNKG','Linkage','결합','' union all
select f_seq(),'CRT','Create','생성, 창조, 창출','' union all
select f_seq(),'AUTO','Automatic','자동','' union all
select f_seq(),'EXC','Exception','예외','' union all
select f_seq(),'BNC','Beneficiary Certificate','수익증권','' union all
select f_seq(),'BMI','Benchmark Index','기준지수','' union all
select f_seq(),'MID','Middle','중간, 중앙, 가운데','' union all
select f_seq(),'OPT','Option','옵션, 선택권','' union all
select f_seq(),'ACQ','Acquisition','취득, 구입, 매입, 인수','' union all
select f_seq(),'BF','Before','전, 전에','' union all
select f_seq(),'AF','After','후, 후에, 뒤에','' union all
select f_seq(),'RTN','Return','환급','' union all
select f_seq(),'RFN','Refund','환급금','' union all
select f_seq(),'PRR','Prearranged','예정','' union all
select f_seq(),'UNRCV','UnReceiving','미수령','' union all
select f_seq(),'PV','Present Value','현재가치','' union all
select f_seq(),'COL','Column','컬럼','' union all
select f_seq(),'TBL','Table','테이블','' union all
select f_seq(),'TTL','Title','제목','' union all
select f_seq(),'TBR','Tool Bar','툴바','' union all
select f_seq(),'AUTH','Authority','권한','' union all
select f_seq(),'OPT_ON','Option On','옵션부','' union all
select f_seq(),'VAL','Value','가치','' union all
select f_seq(),'INEQUL','inequality','불균등','' union all
select f_seq(),'EQUL','equality','균등','' union all
select f_seq(),'YTP','Yield To Put','조기상환수익률','' union all
select f_seq(),'YTM','Yield To Maturity','만기수익률','' union all
select f_seq(),'OTC_DEV','Over The Counter derivatives','장외파생금융상품','' union all
select f_seq(),'LOAN','Loan','대출','' union all
select f_seq(),'MODEL','Model','모형, 모델','' union all
select f_seq(),'FINC','Financial','금융','' union all
select f_seq(),'PRE_OCC','Preoccupy','선취','' union all
select f_seq(),'STF','Short-term funds','단기자금','' union all
select f_seq(),'DEV','Derivatives','파생상품','' union all
select f_seq(),'PRV','Private','개인, 사모','' union all
select f_seq(),'CORP_REG_NO','Corporation Registration Number','법인등록번호','' union all
select f_seq(),'KSC','Koscom','증권전산, 코스콤','' union all
select f_seq(),'STN_IND_CSS','Standard of Industry Classification','표준산업분류','' union all
select f_seq(),'ABRO','Abroad','국내외, 해외, 외국, 역내외','' union all
select f_seq(),'DSH','Dishonor','부도','' union all
select f_seq(),'BRN','Branch','지점','' union all
select f_seq(),'TAX_RT','Tax Rate','세율','' union all
select f_seq(),'WH','With Holding','원천징수','' union all
select f_seq(),'XTNC','Extinction','소멸','' union all
select f_seq(),'NTN','Nation','국가','' union all
select f_seq(),'PRINT','Principal & Interest','원리금','' union all
select f_seq(),'BOK_PRC','Book Price','장부가','' union all
select f_seq(),'KRW','','원, 국내','국내의 의미로 사용하기로 함.' union all
select f_seq(),'USD','','달러','' union all
select f_seq(),'IO','In Out','입출','' union all
select f_seq(),'PSB','Possible','가능','' union all
select f_seq(),'SET','Set','설정','' union all
select f_seq(),'BSS','Basis','기초','' union all
select f_seq(),'LIQ','Liquidation','청산','' union all
select f_seq(),'AVS','Aversion','회피','' union all
select f_seq(),'ACR','Accrual','경과','' union all
select f_seq(),'UNPAY','UnPayment','미지급','' union all
select f_seq(),'STS','Status','상태','' union all
select f_seq(),'UDIV','UnDividend','미안분','' union all
select f_seq(),'HIS','History','내역, 역사','' union all
select f_seq(),'BF_CLO','','전기결산','' union all
select f_seq(),'INV_CO','Invest Company','투자처','' union all
select f_seq(),'FLC','Forward Looking Criteria','자산건전성분류','' union all
select f_seq(),'DTL','Detail','세부, 상세','' union all
select f_seq(),'RT','Rate','비율, 율, 금리','' union all
select f_seq(),'BOK','Book','원장, 장부','' union all
select f_seq(),'EABBR','English Abbreviation','영문약명','' union all
select f_seq(),'IRT','Interest of rate','이율, 이자율','' union all
select f_seq(),'FEE','Fee','수수료, 이용료, 보수','' union all
select f_seq(),'PRE','Pre','이전','' union all
select f_seq(),'TRN','Transfer','이체, 양도','' union all
select f_seq(),'CPN','Coupon','이표','' union all
select f_seq(),'DAY','Day','일','' union all
select f_seq(),'BULK','Bulk','일괄','' union all
select f_seq(),'GEN','General','일반','' union all
select f_seq(),'DAYS','Days','일수','' union all
select f_seq(),'SCHD','schedule','일정','' union all
select f_seq(),'CRS','Cross','자전','' union all
select f_seq(),'REM','Remain','잔금, 잔존, 잔여','' union all
select f_seq(),'CLO','Close','마감, 결산','' union all
select f_seq(),'RECLO','ReClose','재마감','' union all
select f_seq(),'INV','Invest','투자, 출자','' union all
select f_seq(),'ACM','Accumulation','적수, 누적, 누계','' union all
select f_seq(),'APY','Apply','적용','' union all
select f_seq(),'CONV','Convertible','전환','' union all
select f_seq(),'ADJ','Adjust','정산, 조정','' union all
select f_seq(),'KND','Kind','종류','' union all
select f_seq(),'CYC','Cycle','주기','' union all
select f_seq(),'M_CSS','Middle Class','중분류','' union all
select f_seq(),'DIFF','Difference','증감, 차이','' union all
select f_seq(),'SIGN','Signature','기명, 서명','' union all
select f_seq(),'CNTE','Contents','내용','' union all
select f_seq(),'PL','Profit And Loss','손익','' union all
select f_seq(),'RCV','Receiving','수령, 수신, 수취','' union all
select f_seq(),'TS','Trust','수탁, 신용','' union all
select f_seq(),'TRUST_CO','Trust Company','수탁사','' union all
select f_seq(),'SWAP','Swap','스왑','' union all
select f_seq(),'APRL','Approval','승인','' union all
select f_seq(),'WRNT','Warrant','신주인수권','' union all
select f_seq(),'EXEC','Execution','실행','' union all
select f_seq(),'OVD','OverDue','연체','' union all
select f_seq(),'MAT','Maturity','만기','' union all
select f_seq(),'EDD','End Date','말일, 종료일자','' union all
select f_seq(),'SDD','Start Date','초일, 개시일자','' union all
select f_seq(),'PRPS','Purpose','목적','' union all
select f_seq(),'REPR','Representation','대표','' union all
select f_seq(),'EX','Exchange','교환','' union all
select f_seq(),'TRM','Term','구간','' union all
select f_seq(),'RDM','Redemption','상환','' union all
select f_seq(),'ACC','Accounting','회계','' union all
select f_seq(),'CHD','Child','자','' union all
select f_seq(),'TLG','Telegram','전문','' union all
select f_seq(),'LIST','List','상장','' union all
select f_seq(),'ULST','Non List','비상장','' union all
select f_seq(),'AREA','Area','지역','' union all
select f_seq(),'ORG','Original','원, 원래의, 본래의, 최초의','' union all
select f_seq(),'GRT','Guarantee','보증','' union all
select f_seq(),'MNG_CO','Manager Company','운용사','' union all
select f_seq(),'MON','Month','월','' union all
select f_seq(),'CUR','Currency','통화','' union all
select f_seq(),'PUB','Public','공모','' union all
select f_seq(),'RSN','Reason','이유, 사유','' union all
select f_seq(),'APPN','Appointment','지정','' union all
select f_seq(),'FRML','Formula','방식','' union all
select f_seq(),'RCVB','Receivable','미수','' union all
select f_seq(),'RCVB_INT','Receivable Interest','미수이자','' union all
select f_seq(),'DLY','Delay','지연','' union all
select f_seq(),'SPC','Special','특별, 특정, 특이, 특수','' union all
select f_seq(),'FLW','Flow','흐름, 기일','' union all
select f_seq(),'FP','Fragment Period','단절구간','' union all
select f_seq(),'MON','Monday','월요일','' union all
select f_seq(),'TUE','Tuesday','화요일','' union all
select f_seq(),'WED','Wednesday','수요일','' union all
select f_seq(),'THU','Thursday','목요일','' union all
select f_seq(),'FRI','Friday','금요일','' union all
select f_seq(),'SAT','Saturday','토요일','' union all
select f_seq(),'SUN','Sunday','일요일','' union all
select f_seq(),'STK_RLT_BND','Stock-Related Bond','주식관련사채','' union all
select f_seq(),'RLT','Relate','관련, 관계','' union all
select f_seq(),'EXR','Exercise','행사','' union all
select f_seq(),'MTH','Method','방법','' union all
select f_seq(),'WNT','Warrant','워런트','' union all
select f_seq(),'BB','Buy Back','바이백','' union all
select f_seq(),'PRM','Premium','프리미엄, 할증료','' union all
select f_seq(),'FRN','Floating Rate Note','FRN, 변동금리부채권','' union all
select f_seq(),'FLT','Floating','변동, 유동','' union all
select f_seq(),'CF','Cash Flow','현금흐름표','' union all
select f_seq(),'TOT','Total','총, 합계, 총계','' union all
select f_seq(),'ERL','Early','이른, 조기','' union all
select f_seq(),'ERDM','Early Redemption','조기상환','' union all
select f_seq(),'SMP','Simple','간이, 심플, 간략','' union all
select f_seq(),'REG','Registration','등록, 기재','' union all
select f_seq(),'HD','Hold','보유','' union all
select f_seq(),'PRE','Previous','선수, 이른, 먼저의','' union all
select f_seq(),'EXT','Extension','연장, 확대, 확장','' union all
select f_seq(),'EXC','Except','제외','' union all
select f_seq(),'PREPAY','Prepayment','선납, 선급, 선지급','' union all
select f_seq(),'LCL','Local','지방','' union all
select f_seq(),'DEPT','Depository','보관소, 보관처','' union all
select f_seq(),'PUR','Purchase','구입, 구매, 매입, 취득','' union all
select f_seq(),'REF','Reference','참조','' union all
select f_seq(),'EXDIFF','Exchange Difference','환차, 환산','' union all
select f_seq(),'GNNY','GRANT MONEY','교부금','' union all
select f_seq(),'IMPR','Impair','손상, 손해','' union all
select f_seq(),'DRT','DRAWING OUT','인출','' union all
select f_seq(),'OBJ','Object','객체','' union all
select f_seq(),'LEAP_YEAR','Leap Year','윤년','' union all
select f_seq(),'INDRCT','Indirect','간접','' union all
select f_seq(),'STR','Structure','구조','' union all
select f_seq(),'KO','Knock-Out','넉아웃, 녹아욱, Knock-Out','' union all
select f_seq(),'KI','Knock-In','넉인, 녹인, Knock-In','' union all
select f_seq(),'BRR','Barrier','배리어','' union all
select f_seq(),'LZD','Lizard','리자드, 도마뱀','' union all
select f_seq(),'DRCT','Direct','직접','' union all
select f_seq(),'UP','Up','상승, 위','' union all
select f_seq(),'DOWN','Down','하락, 아래, 밑','' union all
select f_seq(),'JOIN','Join','참여, 결합','' union all
select f_seq(),'PSUD','PSEUDO','가상, 가짜','' union all
select f_seq(),'DLI','Deal In','취급하다. 다루다.','' union all
select f_seq(),'INC','Inception','시작, 개시, 창업, 창설','' union all
select f_seq(),'EXR_PRC','Exercise Price','행사가격 (권리행사가)','(=  Strike Price)' union all
select f_seq(),'RFRN_ENTT','Reference Entity','준거자산','' union all
select f_seq(),'CRTR','Criterion','준거, 근거, 기준','' union all
select f_seq(),'SCP','Scope','범위','' union all
select f_seq(),'NWPT','new type bond','신종사채','' union all
select f_seq(),'EXPT','Expect','예정, 기대','' union all
select f_seq(),'SILT','sell in lots','분양','' union all
select f_seq(),'CONSR','Constructor','시공사','' union all
select f_seq(),'DEBT','Debt','빚, 부채, 채무','' union all
select f_seq(),'DEBTR','Debtor','채무자','' union all
select f_seq(),'DFR_INCOM','deferred income','이연수익','' union all
select f_seq(),'LPAY','Later Pay','후취, 후급','' union all
select f_seq(),'REPAY','Repay','변제','' union all
select f_seq(),'CERT','certificate','증명서','' union all
select f_seq(),'DISCR','Discretionary ','일임','' union all
select f_seq(),'KSD','KOREA SECURITIES DEPOSITORY','예탁원, 예탁결제원','' union all
select f_seq(),'','withdraw','인출하다, 철수하다, 중단(취소/철회)하다','' union all
select f_seq(),'','draw','인출하다, 그리다, 끌어당기다','' union all
select f_seq(),'UNAPPR_EARN_SURP','unappropriated earned surplus','미처분이익잉여금','' union all
select f_seq(),'EARN_SURP','an earned surplus.','이익잉여금','' union all
select f_seq(),'','Allocate','할당하다','리소스, 자원, 시간, 예산 등을 특정 목적을 위해 분배하거나 할당하는 것을 의미. 일반적으로 큰 범위의 리소스 또는 예산을 처리하거나 분배하는데 사용' union all
select f_seq(),'PRSN','person','사람, 개인','' union all
select f_seq(),'FINC','Finance','재정, 재무','' union all
select f_seq(),'KEP','Keep','유지','' union all
select f_seq(),'KOFIA','Kofia','금융투자협회','' union all
select f_seq(),'PRIORITY','priority','우선순위(중요순위), 우선사항','' union all
select f_seq(),'CURR','Current','현재','' union all
select f_seq(),'LOCK_UP','Lock-Up','의무보유확약','' union all
select f_seq(),'','Senior','숙련, 경력자','' union all
select f_seq(),'BIZ_PERFO_EVAL','BIZ_PERFO_EVAL','사업성평가','' union all
select f_seq(),'PERFO','Performance','성과, 실적, 성적','' union all
select f_seq(),'INDCR','Indicator','지표','' union all
select f_seq(),'RECODE','recode','기록','' union all
select f_seq(),'ACC_STTM','Account Statement','정산서','' union all
select f_seq(),'ANSWER','answer','답변, 회신, 대응','' union all
select f_seq(),'EXPN','Explan','설명, 설명하다','' union all
select f_seq(),'','Career','경력','' union all
select f_seq(),'PREFER','Preference','선호, 좋아함, 선택, 우선권, 우선적으로','' ;



