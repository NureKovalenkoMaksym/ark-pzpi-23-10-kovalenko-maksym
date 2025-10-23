// --- В.1 Приклад структури програми Pascal ---
program StructureExample; // Заголовок програми
uses Crt;                // Секція підключення модулів

const
  MaxItems = 100;        // Секція констант

type
  TItem = record         // Секція типів
    ID: Integer;
    Name: String;
  end;

var
  itemsList: array[1..MaxItems] of TItem; // Секція змінних
  itemCount: Integer;

procedure InitializeItems; // Секція процедур та функцій
begin
  itemCount := 0;
  WriteLn('Item list initialized.');
end;

begin // Основний блок програми
  InitializeItems;
  WriteLn('Program structure example.');
  // ... інший код ...
  ReadKey;
end. // Кінець програми (Примітка: для компіляції треба буде додати оголошення ReadKey або Crt)

// --- В.2 Приклад форматування коду (відступи) ---
// (Примітка: цей код є фрагментом і потребує оголошення змінних та процедури ProcessItem для компіляції)

var
  a, b, maxValue, i, sum: Integer;
  isSunny, temperature: Integer; // Припустимо temperature > 20
  activity: string;

procedure ProcessItem(itemIndex: Integer);
begin
  WriteLn('Processing item: ', itemIndex);
end;

begin // Початок основного блоку для прикладу
  a := 10; b:= 5; isSunny := 1; temperature := 25; // Приклад значень

  // Приклад з умовою IF
  if (temperature > 20) and (isSunny = 1) then // Умова Boolean
  begin
    WriteLn('Good weather for a walk.'); // Відступ всередині блоку
    activity := 'Walking';
  end
  else
  begin
    WriteLn('Maybe stay indoors.');
    activity := 'Reading';
  end; // Кінець блоку на рівні IF/ELSE

  // Приклад з циклом FOR
  sum := 0;
  for i := 1 to 5 do
  begin // Початок блоку циклу
    sum := sum + i; // Відступ для тіла циклу
    WriteLn('Current sum: ', sum);
    ProcessItem(i); // Відступ для тіла циклу
  end; // Кінець блоку на рівні FOR

end. // Кінець основного блоку для прикладу



// --- В.3 Приклади іменування ---
// (Примітка: цей код є фрагментом і потребує контексту для компіляції)

var
  // Погані імена
  x1, cnt, vl: integer; // Незрозуміло
  // Хороші імена
  studentCount: integer;   // Відразу ясно
  isValidInput: boolean; // Очевидне призначення
  currentUser: TUserProfile; // Змінна camelCase або PascalCase
  loginAttempts: Integer;
  score: Integer;
  isWinner: Boolean;
  r, area: Real;

const
  MaxAttempts = 3; // Константа великими літерами або PascalCase
  DefaultTimeout = 1000; // Зрозуміла константа
  WinningScoreThreshold = 100;
  Pi = 3.14;

type
  TUserProfile = record // Тип запису з префіксом T і PascalCase
    userId: Integer;
    userName: string[50];
    isActive: Boolean;
  end;
  TOrderDetails = record   // Тип з префіксом T
    orderId: integer;
    customerName: string;
  end;

procedure DoIt; // Погана назва
begin end;

procedure CheckLoginCredentials(name: string; pass: string); // Назва процедури описує дію
begin
  // ... логіка перевірки ...
end;

procedure ValidateUserInput; // Дієслово описує дію
begin end;

begin // Початок основного блоку для прикладу
  // Приклад з "магічним" числом
  // Погано - що таке 100?
  score := 101;
  if score > 100 then
    isWinner := True;

  // Добре - зрозуміло, що це порогове значення
  if score > WinningScoreThreshold then
    isWinner := True;

  // Приклад з Pi
  r := 5.0;
  // Погано:
  area := 3.14 * r * r;
  // Добре:
  area := Pi * r * r;

end. // Кінець основного блоку для прикладу


// --- В.4 Приклад документування коду ---
// (Примітка: Потребує оголошення типу TUserProfile та класу Exception для компіляції)

type
  TUserProfile = record // Оголошення типу запису (структури)
    userId: Integer;
    userName: string[50];
    isActive: Boolean;
  end;

{-----------------------------------------------------------------------
  Procedure: ClearUserData
  Purpose:   Resets the user profile data to default values.
  Params:    user - The TUserProfile record to clear.
  Modified:  2025-10-23 by Maksym Kovalenko
 -----------------------------------------------------------------------}
procedure ClearUserData(var user: TUserProfile);
begin
  user.userId := 0;
  user.userName := '';
  user.isActive := False;
end;

{***
  Function: GetUserStatus
  Returns the active status of a user profile.
  @param user The user profile record.
  @return True if user is active, False otherwise.
***}
function GetUserStatus(user: TUserProfile): Boolean;
begin
  Result := user.isActive;
end;

{-----------------------------------------------------------------------------
  Calculates the factorial of a non-negative integer.
  @param n The integer number (must be >= 0).
  @return The factorial of n.
  @author Maksym Kovalenko
  @version 1.0
 ----------------------------------------------------------------------------}
function Factorial(n: Integer): LongInt;
var
  i: Integer;
  res: LongInt;
begin
  if n < 0 then
    // У реальному коді тут мав би бути клас Exception або обробка помилки
    raise Exception.Create('Factorial is not defined for negative numbers');
  res := 1;
  for i := 2 to n do
    res := res * i;
  Result := res;
end;

var
  myUser: TUserProfile;
  factValue: LongInt;

begin // Початок основного блоку для прикладу
  ClearUserData(myUser);
  if not GetUserStatus(myUser) then
    WriteLn('User is not active.');

  factValue := Factorial(5);
  WriteLn('Factorial of 5 is: ', factValue);

end. // Кінець основного блоку для прикладу

// --- В.5 Приклад обробки винятків (try...except) ---
// (Примітка: Потребує оголошення CalculateSomethingRisky та result, класу Exception)

var result: Integer; // Припустимо
function CalculateSomethingRisky: Integer; // Припустимо
begin
  // ... може викликати помилку ...
end;

begin // Початок основного блоку для прикладу
  try
    // Код, що може викликати помилку
    result := CalculateSomethingRisky;
    WriteLn('Calculation successful: ', result);
  except
    on E: Exception do // Обробка конкретного винятку
      WriteLn('An error occurred: ', E.Message);
  end;
end. // Кінець основного блоку для прикладу


// --- В.6 Приклад коду для тестування (концептуальний) ---
// (Примітка: Цей код є частиною тестового модуля і потребує фреймворку типу FPCUnit/DUnit та функції Factorial)

unit TestMathUtilsUnit; // Приклад назви тестового модуля

interface
uses TestFramework, MathUtilsUnit; // Підключення фреймворку та модуля з Factorial

type
  TTestMathUtils = class(TTestCase) // Клас для тестів
  published
    procedure TestFactorial_Zero;
    procedure TestFactorial_Positive;
    // ... інші тести ...
  end;

implementation

procedure TTestMathUtils.TestFactorial_Zero;
begin
  // Перевіряємо, чи Factorial(0) повертає 1
  CheckEquals(1, Factorial(0), 'Factorial of 0 should be 1');
end;

procedure TTestMathUtils.TestFactorial_Positive;
begin
  // Перевіряємо, чи Factorial(5) повертає 120
  CheckEquals(120, Factorial(5), 'Factorial of 5 should be 120');
end;

initialization // Реєстрація тестів для запуску
  RegisterTest(TTestMathUtils.Suite);
end.


// Кінець об'єднаного коду




// --- В.7 Приклад коду "До" та "Після" оформлення ---

// Код ДО застосування правил (важко читати):
function calc(a:integer; b:integer):integer;
var res:integer; t:integer;
begin
t:=a+b; if t>10 then res:=t*2 else res:=t+5;
calc:=res; end; // Все в один рядок, незрозумілі імена

// Той самий код ПІСЛЯ застосування правил:
// Функція обчислює значення залежно від суми вхідних параметрів
function CalculateValue(param1: Integer; param2: Integer): Integer;
var
  sumValue: Integer;    // Змістовне ім'я
  resultValue: Integer; // Змістовне ім'я
const
  Threshold = 10;      // "Магічне" число винесено в константу
  Multiplier = 2;
  Addition = 5;
begin
  sumValue := param1 + param2; // Відступи та пробіли

  if sumValue > Threshold then // Використання константи
  begin // Відступи для блоку
    resultValue := sumValue * Multiplier;
  end
  else
  begin
    resultValue := sumValue + Addition;
  end;

  CalculateValue := resultValue; // Повернення результату (старий стиль Pascal)
  // Або: Result := resultValue; (сучасний стиль Free Pascal/Delphi)
end;

