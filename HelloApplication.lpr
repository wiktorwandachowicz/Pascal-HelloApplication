program HelloApplication;
{$mode objfpc}{$H+}

uses
  SysUtils, Crt;

const
  RANGE=10;
  ENTER_KEY=#13;
  ESCAPE_KEY=#27;
var
  ParentName: string;
  ParentNumber: Integer;
  ChildNumber: Integer;
  ch:char;
  PlayAgain: Boolean;
  StatsWon, StatsLost, StatsTied: Integer;

procedure PlayGame;
begin
  WriteLn('[ENTER] = generate your number');
  ReadLn;
  ParentNumber := random(RANGE)+1;
  Writeln('You got a ' + IntToStr(ParentNumber) + ' out of ' + IntToStr(RANGE));

  WriteLn('[ENTER] = generate my number');
  ReadLn;
  ChildNumber := random(RANGE)+1;
  Writeln('I got a ' + IntToStr(ChildNumber) + ' out of ' + IntToStr(RANGE));

  WriteLn;
  Write('AND ...  ');
  Delay(1000);

  if ParentNumber > ChildNumber then
  begin
    WriteLn ('You Won, Congratulations!');
    StatsWon:=StatsWon+1;
  end
  else if ParentNumber < ChildNumber then
  begin
    WriteLn ('I Won, Yay!');
    StatsLost:=StatsLost+1;
  end
  else
  begin
    WriteLn ('Tie!');
    Inc(StatsTied);
  end;

  WriteLn;
end;

procedure DisplayStats;
begin
  WriteLn('* I won   : ' + IntToStr(StatsLost) + ' times!');
  WriteLn;
  WriteLn('* You won : ' + IntToStr(StatsWon) + ' times!');
  WriteLn;
  WriteLn('* We tied : ' + IntToStr(StatsTied) + ' times!');
  WriteLn;
end;

{ main program }
begin
  Write('What is your name? ');
  ReadLn(ParentName);
  if ParentName = '' then
    ParentName := 'Person';

  WriteLn('Hello ' + ParentName + ', let''s play a Game!');
  WriteLn('This is a game!');

  { Init game }
  randomize;
  StatsWon := 0;
  StatsLost := 0;
  StatsTied := 0;
  PlayAgain := False;

  repeat
    if PlayAgain then
    begin
      WriteLn ('That was fun, let''s play again!');
      WriteLn;
      Delay(1000);
    end;

    PlayGame;

    DisplayStats;

    WriteLn('Press [ESC] to finish playing');
    WriteLn('Press [ENTER] to play again');
    WriteLn;
    ch:= ReadKey;
    PlayAgain := True;

  until ch=ESCAPE_KEY;

  WriteLn ('Goodbye ' + ParentName +'!');
  WriteLn;

  Delay(2000);

end.

