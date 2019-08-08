with i(rrni,i) as (sELECT rrn(i),                      
trim(char(CLID))                                       
||','||trim(char(CLCOMPANY))                           
||','||trim(char(CLNAME))                              
||','||trim(char(CLadr))                               
||','||trim(char(CLcity))                              
||','||trim(char(CLzip))                               
||'#'                                                  
FROM client i)                                         
,o(r,o,rrn,p) as (                                     
values(1,cast('' as varchar(200)),1,0) union           
select case when length(o)<131 then r else r+1 end     
,case when length(o)<131 then o else '' end            
||substr(i,p+1,min(length(i)-p,131-length(o)))         
,case when p+min(length(i)-p,131-length(o))<length(i)  
      then rrn else rrn+1 end                          
,case when p+min(length(i)-p,131-length(o))<length(i)  
      then p+min(length(i)-p,131-length(o)) else 0 end 
from i, o                                              
where rrn=rrni)                                        
select max(o) from o group by r order by r             