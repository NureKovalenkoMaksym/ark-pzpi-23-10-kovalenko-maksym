program CodeExamplesRefactoringMethods;

// Примітка: Цей файл містить збірку прикладів коду для презентації.
// Багато частин закоментовано, оскільки вони є лише ілюстративними фрагментами.

// --- Слайд 3: Метод №1: Перейменування методу (Rename Method) ---

// Код ДО (незрозуміла назва):
function proc(val: integer): string;
begin
  if (val > 0) and (val < 100) then
    proc := 'Valid'
  else
    proc := 'Error';
end;

// Код ПІСЛЯ (змістовна назва):
// Назва чітко описує дію
function ValidateInputRange(val: integer): string;
begin
  if (val > 0) and (val < 100) then
    ValidateInputRange := 'Valid'
  else
    ValidateInputRange := 'Error';
end;

// --- Слайд 4: Метод №2: Заміна "магічного" числа (Replace Magic Number) ---

// Код ДО (використовує "магічні" числа):
(*
var Attempts, UserStatus, BaseBonus, Bonus: integer; // Приклад оголошення
begin
  // Що означають 10, 2, 5?
  if (Attempts < 10) then
  begin
    if (UserStatus = 2) then
      Bonus := BaseBonus * 5;
  end;
end;
*)

// Код ПІСЛЯ (використовує константи):
const
  MaxLoginAttempts = 10;
  UserStatusAdmin = 2;
  AdminBonusMultiplier = 5;

(*
var Attempts, UserStatus, BaseBonus, Bonus: integer; // Приклад оголошення
begin
  // Код стає самодокументованим
  if (Attempts < MaxLoginAttempts) then
  begin
    if (UserStatus = UserStatusAdmin) then
      Bonus := BaseBonus * AdminBonusMultiplier;
  end;
end;
*)

// --- Слайд 5: Метод №3: Розділення умовної конструкції (Decompose Conditional) ---

// (Примітка: Потребує оголошення типу TUser та процедури GrantSpecialAccess)
(*
type
  TUser = record
    IsAdmin: Boolean;
    IsSupport: Boolean;
    IsActive: Boolean;
    IsOnVacation: Boolean;
  end;
var
  user: TUser;

procedure GrantSpecialAccess;
begin
  // ... логіка надання доступу ...
end;

// Код ДО (складна умова "в одному рядку"):
begin
  // Умова перевантажена логікою
  if (user.IsAdmin) or (user.IsSupport) and (user.IsActive) and (not user.IsOnVacation) then
  begin
    GrantSpecialAccess;
  end;
end;
*)

// Код ПІСЛЯ (умова розбита на функції):

(*
// Окрема функція для перевірки ролі
function HasPrivilegedRole(u: TUser): Boolean;
begin
  Result := u.IsAdmin or u.IsSupport;
end;

// Окрема функція для перевірки статусу
function IsAvailableForWork(u: TUser): Boolean;
begin
  Result := u.IsActive and (not u.IsOnVacation);
end;

// Основна логіка стала набагато чистішою
begin
  if HasPrivilegedRole(user) and IsAvailableForWork(user) then
  begin
    GrantSpecialAccess;
  end;
end;
*)


// --- Слайд 6 та 7: Приклад на основі "коду студента" ---

// Оригінальний код ("До"):
procedure Calculate(var salary: real; level: integer; isNew: boolean);
var
  b: real; // Погане ім'я
begin
  b := 0.0;
  // Складна умова з "магічними" числами
  if (level > 5) and (salary > 10000) and (not isNew) then
  begin
    b := salary * 0.15; // Магічне число
  end
  else
  begin
    b := salary * 0.05; // Магічне число
  end;
  salary := salary + b;
end;


// Код ПІСЛЯ (застосовано 3 методи):

// 1. "Магічні" числа винесені в константи
const
  SeniorLevelThreshold = 5;
  SeniorSalaryThreshold = 10000;
  SeniorBonusRate = 0.15;
  DefaultBonusRate = 0.05;

// 3. Складна умова винесена в окрему функцію ("Decompose Conditional")
function IsSeniorEmployee(level: integer; salary: real; isNew: boolean): boolean;
begin
  Result := (level > SeniorLevelThreshold) and
            (salary > SeniorSalaryThreshold) and
            (not isNew);
end;

// 1. Процедура отримала змістовну назву ("Rename Method")
procedure CalculateBonus(var salary: real; level: integer; isNew: boolean);
var
  bonusAmount: real; // Ім'я змінної теж покращено
begin
  if IsSeniorEmployee(level, salary, isNew) then
    bonusAmount := salary * SeniorBonusRate
  else
    bonusAmount := salary * DefaultBonusRate;

  salary := salary + bonusAmount;
end;


// Головний блок програми (для перевірки, чи файл компілюється)
begin
  // Цей блок порожній, оскільки файл містить лише приклади
  // процедур та функцій для демонстрації.
end.