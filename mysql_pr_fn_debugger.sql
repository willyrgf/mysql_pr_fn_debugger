delimiter //

drop database if exists debug//
create database debug//

drop table if exists debug.debug//
create table  debug.debug (
  id bigint not null auto_increment,
  proc_id varchar(32) default 'proc_id_undefined',
  debug_text text not null,
  created_at datetime default now(),
  primary key (id)
)//
create index idx_created_at on debug.debug(created_at)//

drop procedure if exists debug._log//
create procedure debug._log(in proc_id varchar(32), in debug_text text)
begin
  insert into debug.debug (id,debug_output)
  values (p_proc_id,p_debug_info);
end//

drop procedure if exists debug._show//
create procedure debug._show()
begin
    select
        bug.proc_id,
        bug.debug_text,
        bug.created_at
    from
        debug.debug bug
    order by 
        bug.created_at desc
    limit 50;
end//

drop procedure if exists debug._cleanup//
create procedure debug._cleanup()
begin
    truncate table 
        debug.debug;
end//

delimiter ;
