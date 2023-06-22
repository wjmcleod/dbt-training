/*Putting __config opens up a configuration block. Much easier and quicker than typing it out myself*/

{{
    config(
        materialized='table'
    )
}}


select * from  
   {{ source('globalmart', 'orders') }}