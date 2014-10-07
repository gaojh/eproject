set names gbk;
insert into e_district (id,parent_id,level,type,name,code,sequence,state) values(2,-1,1,'省','北京市','BJ',1,'U');
insert into e_district (id,parent_id,level,type,name,code,sequence,state) values(20001,2,3,'区/县','西城区','XCQ',1,'U');
insert into e_district (id,parent_id,level,type,name,code,sequence,state) values(2000101,20001,4,'街道/乡镇','西长安街道','XCAJD',1,'U');

insert into e_district (id,parent_id,level,type,name,code,sequence,state) values(1,-1,1,'省','江苏省','JS',2,'U');
insert into e_district (id,parent_id,level,type,name,code,sequence,state) values(101,1,2,'市','南京市','NJ',1,'U');
insert into e_district (id,parent_id,level,type,name,code,sequence,state) values(10101,101,3,'区/县','玄武区','XWQ',1,'U');
insert into e_district (id,parent_id,level,type,name,code,sequence,state) values(1010101,10101,4,'街道/乡镇','玄武湖街道','XWHJD',1,'U');
