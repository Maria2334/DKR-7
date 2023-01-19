uses GraphABC; 
var
  n: Integer;
  x1, y1, x2, y2: Real;
 
procedure Serp(x1, y1, x2, y2: Real);
var
  x1n, y1n, x2n, y2n: Real;
begin
  if abs(x1-x2) > n then
  begin
    x1n := 2 * x1 / 3 + x2 / 3;
    x2n := x1 / 3 + 2 * x2 / 3;
    y1n := 2 * y1 / 3 + y2 / 3;
    y2n := y1 / 3 + 2 * y2 / 3;
    Rectangle(Round(x1n), Round(y1n), Round(x2n), Round(y2n));
    Serp(x1, y1, x1n, y1n);
    Serp(x1n, y1, x2n, y1n);
    Serp(x2n, y1, x2, y1n);
    Serp(x1, y1n, x1n, y2n);
    Serp(x2n, y1n, x2, y2n);
    Serp(x1, y2n, x1n, y2);
    Serp(x1n, y2n, x2n, y2);
    Serp(x2n, y2n, x2, y2)
  end
end;
 
Procedure KeyDown(key: integer);
begin
  case key of
    VK_W: if n div 3 >3 then n := n div 3; 
    VK_S: if n*3 < x2-x1 then n := n*3;
    VK_P : begin x1-=10; y1+=10; x2+=10; y2-=10 end;
    VK_O: begin x1+=10; y1-=10; x2-=10; y2+=10 end;
    VK_Left: begin x1+=10; x2+=10 end; 
    VK_Right: begin x1-=10; x2-=10 end;
    VK_Up: begin y1+=10; y2+=10 end;
    VK_Down: begin y1-=10; y2-=10 end;
    end;
  Window.Clear;
  Rectangle(Round(x1), Round(y1), Round(x2), Round(y2));
  Serp(x1, y1, x2, y2);
  ReDraw;
end;
 
begin
  SetWindowCaption('Фракталы: Ковер Серпинского');
  x1 := 20; y1 := 20; x2 := 460; y1 := 460; n := round((x2-x1) / (3*3*3));
  LockDrawing;
  KeyDown(1);
  OnKeyDown += KeyDown;
end.