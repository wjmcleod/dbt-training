/*Can reference another model in dbt rather than having to hard pull from the database by using __ref.
I'm not sure, but maybe this is useful because it could be faster?*/

/*Can run the model and all the models downstream of the model by doing -s +'modelname'*/

select
-- from raw_orders
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,
-- from raw_customer
c.customerid,
c.customername,
c.segment,
c.country,
-- from raw_product
p.productid,
p.category,
p.productname,
p.subcategory
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
    on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p
    on o.productid = p.productid