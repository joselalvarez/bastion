<?xml version="1.0"?>
<distributed-cache name="userinfo" owners="2" mode="SYNC" statistics="true">
   <encoding>
      <key media-type="text/plain"/>
      <value media-type="text/plain"/>
   </encoding>
   <locking acquire-timeout="60000"/>
   <memory max-count="500" when-full="REMOVE"/>
</distributed-cache>
