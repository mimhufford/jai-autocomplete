# Jai Autocomplete
This is a simple command line tool to list which procedures accept a given struct as a parameter. It lists the matching procedures with the filepath and line number which most editors will turn into a clickable link for quick browsing.

## Example
```
> jai autocomplete.jai - main.jai Vector2
       
Procedures with 'Vector2' as a parameter:
- dot_product: C:/jai/modules/Math/module.jai:274
- length: C:/jai/modules/Math/module.jai:291
- make_vector3: C:/jai/modules/Math/module.jai:350
- make_vector4: C:/jai/modules/Math/module.jai:377
- abs: C:/jai/modules/Math/module.jai:421
- min: C:/jai/modules/Math/module.jai:445
- max: C:/jai/modules/Math/module.jai:472
- lerp: C:/jai/modules/Math/module.jai:526
- multiply: C:/jai/modules/Math/module.jai:596
- distance: C:/jai/modules/Math/module.jai:629
- unit_vector: C:/jai/modules/Math/module.jai:690
- normalize_or_zero: C:/jai/modules/Math/module.jai:704
- rotate: C:/jai/modules/Math/module.jai:715
- rotate: C:/jai/modules/Math/module.jai:726
- +: C:/jai/modules/Math/module.jai:767
- -: C:/jai/modules/Math/module.jai:776
- *: C:/jai/modules/Math/module.jai:785
- *: C:/jai/modules/Math/module.jai:792
- /: C:/jai/modules/Math/module.jai:800
- /: C:/jai/modules/Math/module.jai:807
- /: C:/jai/modules/Math/module.jai:815
- ==: C:/jai/modules/Math/module.jai:826
- saturate: C:/jai/modules/Math/module.jai:830
- multiply: C:/jai/modules/Math/matrix.jai:169
```