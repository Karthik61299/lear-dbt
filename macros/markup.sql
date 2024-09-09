/*{% macro markup() %}

(ORDER_SELLING_PRICE - ORDER_COST_PRICE)

{% endmacro %}*/

{% macro markups(a,b) %}

({{a}} - {{b}})

{% endmacro %}


