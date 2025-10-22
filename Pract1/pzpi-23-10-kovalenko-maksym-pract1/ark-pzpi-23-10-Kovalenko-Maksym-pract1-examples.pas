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

  CalculateValue := resultValue; // Повернення результату
end;








