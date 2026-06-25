{%  macro get_season(x)  %}

CASE WHEN MONTH(TO_TIMESTAMP({{x}})) IN(12,1,2)
THEN 'WINTTER'
WHEN MONTH(TO_TIMESTAMP({{x}})) IN(3,4,5)
THEN 'SPRING'
WHEN MONTH(TO_TIMESTAMP({{x}})) IN(6,7,8)
THEN 'SUMER'
ELSE 'AUTUMN'

END {% endmacro %}
