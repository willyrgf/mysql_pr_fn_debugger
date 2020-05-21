# mysql_pr_fn_debugger
A debugger to MySQL procedure and functions. RAISE NOTICE '???'

### Installing
```sh
mysql -uroot -proot < mysql_pr_fn_debugger.sql
```

### Example call log
```sql
create procedure run_parallel(
  in cores int
) 
begin
    call debug._log('run_parallel', concat('cores: ', cores));
    call debug._xlog(concat('without identified, cores: ', cores));
end;

```

### Example show logs
```sql
call debug._show();

#	proc_id             debug_text                      created_at
1	run_parallel        "cores: 8"                      2020-05-21 16:42:19.0
2	proc_id_undefined   "without identified, cores: 8"  2020-05-21 16:42:19.0
```

### Example cleanup logs
```sql
call debug._cleanup();
call debug._show();

#	proc_id	debug_text	created_at

```
