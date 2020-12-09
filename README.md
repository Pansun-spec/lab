# newton
Грамматика языка программирования Ньютон, представляющего собой синтаксически урезанный Паскаль.

Регистр букв не важен.

Возможные типы данных:

-- простые типы
integer
boolean
real
string

-- составные типы
array[start_index..end_index] of TYPE, где TYPE -- корректный тип

Объявление переменных:

var
    a,b,c: type1;
    d,e: type2;

Присваивание:
var_name := value;

Циклы:
for counter := init_value to final_value do
<выражение>

Поддерживаются функции:

function <function_name> () : result_type;
[var ...;]
begin
    ...
end;

Выражения могут быть простые и составные. Составные имеют вид
begin
    <statement1>
    <statement2>
    ...
    <statement_n>
end;
