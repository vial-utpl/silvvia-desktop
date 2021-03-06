function [EstVehicul,EstVehiculo,EstMoto,EstMotocicleta,EstCicl,EstCiclista,EstPeato,EstPeaton]=Calculo_nueva_estrella(x)
%0.Clasificacion por estrellas para ocupante de vehiculo
%%Salida del camino (lado del conductor)
%Ancho carril
%Tipo de area 1=Rural; 2=Urbano
tipoare=x(38);
anchocarri=x(13);
if tipoare==1 && anchocarri==1 %Ancho (≥ 3,25 m)
   anchocarril=1;
else if tipoare==1 && anchocarri==2 %Medio (≥ 2,75 m a < 3,25 m)
   anchocarril=1.2;
else if tipoare==1 && anchocarri==3 %Estrecho (≥ 0 m a < 2,75 m)
   anchocarril=1.5;
    end
    end
end
if tipoare==2 && anchocarri==1 %Ancho (≥ 3,25 m)
   anchocarril=1;
else if tipoare==2 && anchocarri==2 %Medio (≥ 2,75 m a < 3,25 m)
   anchocarril=1.05;
else if tipoare==2 && anchocarri==3 %Estrecho (≥ 0 m a < 2,75 m)
   anchocarril=1.1;
    end
    end
end
%Curvatura
T2=[1 1 1 1;1.8 2 2 1.8;3.5 3.8 3.8 3.5;6 6.5 6.5 6];
disp('1 = Recto')
disp('2 = Moderado')
disp('3 = Cerrada')
disp('4 = Muy cerrada')
curvatur=x(14);
if curvatur==1 %Recto
    for i=1:4
curvatura(1,i)=T2(1,i);
    end
end
if curvatur==2 %Moderado
    for i=1:4
curvatura(1,i)=T2(2,i);
    end
end
if curvatur==3 %Cerrada
    for i=1:4
curvatura(1,i)=T2(3,i);
    end
end
if curvatur==4 %Muy cerrada
    for i=1:4
curvatura(1,i)=T2(4,i);
    end
end
%Calidad de curva
T3=[1 1 1 1;1.25 1.4 1.25 1.4;1 1 1 1];
disp('1 = Adecuado')
disp('2 = Deficiente')
disp('3 = No Aplica')
calidadcurv=x(15);
if calidadcurv==1
    for i=1:3
    calidadcurva(1,i)=T3(1,i);
    end
end
if calidadcurv==2
    for i=1:3
    calidadcurva(1,i)=T3(2,i);
    end
end
if calidadcurv==3
    for i=1:3
    calidadcurva(1,i)=T3(3,i);
    end
end
%Delineación
%T4=[1 1 1 1;1.2 1.2 1.2 1.2];
disp('1 = Adecuado')
disp('2 = Deficiente')
delineacio=x(19);
if delineacio==1
    delineacion=1;
else if delineacio==2
    delineacion=1.2;
    end
end
%Bandas sonoras en el espaldón
%T5=[1.25;1]
disp('1 = Ausente')
disp('2 = Presente')
bandasonorae=x(5);
if bandasonorae==1
    bandasonoraes=1.25;
else if bandasonorae==2
    bandasonoraes=1;
    end
end
%Estado de la superficie de la vía
%%Cojo A lo largo peaton= Alo Largo Ciclista
T6=[1 1 1 1;1.2 1.25 1.2 1.25;1.4 1.5 1.4 1.5];
disp('1 = Bueno')
disp('2 = Regular')
disp('3 = Malo')
estadosuperfici=x(17);
if estadosuperfici==1
    for i=1:4
    estadosuperficie(1,i)=T6(1,i);
    end
end
if estadosuperfici==2
    for i=1:4
    estadosuperficie(1,i)=T6(2,i);
    end
end    
if estadosuperfici==3
    for i=1:4
    estadosuperficie(1,i)=T6(3,i);
    end
end
%Pendiente
T7=[1 1 1 1;1.2 1.2 1.2 1.2;1.7 1.7 1.7 1.7];
pendient=x(16);
if pendient==3 %≥ 10 
   pendiente=1.7;
else if pendient==2 %7,5  a 10 
        pendiente=1.2
else pendient==1 %0 % a < 7,5 %
        pendiente=1
    end
end
%Resistencia al deslizamiento
T8=[1 1 1 1;1.4 1.6 1.4 1.6;2 2.5 2 2.5;3 4 3 4;5.5 7.5 5.5 7.5];
disp('1 = Pavimentado - adecuado')
disp('2 = Pavimentado - regular')
disp('3 = Pavimentado – pobre')
disp('4 = Sin Pavimentar – adecuado')
disp('5 = Sin Pavimentar - pobre')
resdeslizamient=x(18);
if resdeslizamient==1
    for i=1:4
   resdeslizamiento(1,i)=T8(1,i);
    end
end
if resdeslizamient==2
    for i=1:4
   resdeslizamiento(1,i)=T8(2,i);
   end
end
if resdeslizamient==3
    for i=1:4
   resdeslizamiento(1,i)=T8(3,i);
   end
end
if resdeslizamient==4
    for i=1:4
   resdeslizamiento(1,i)=T8(4,i);
   end
end
if resdeslizamient==5
    for i=1:4
   resdeslizamiento(1,i)=T8(5,i);
   end
end
%Severidad en la carretera: distancia del lado del conductor
T9=[1 1 1;0.8 0.8 0.6;0.35 0.35 0.1;0.1 0.1 0.01];
distconducto=x(1);
if distconducto==1
    for i=1:3
  distconductor(1,i)=T9(1,i);
    end
end
if distconducto==2
    for i=1:3
  distconductor(1,i)=T9(2,i);
    end
end
if distconducto==3
    for i=1:3
  distconductor(1,i)=T9(3,i);
    end
end
if distconducto==4
    for i=1:3
  distconductor(1,i)=T9(4,i);
    end
end
%Severidad en la carretera: objeto del lado del conductor
T10=[12 30 30;15 25 25;12 20 20;9 30 30;55 55 55;45 45 45;40 40 40;55 55 55;45 45 45;90 90 3000;60 60 60;60 60 60;60 60 60;30 30 30;60 60 60;60 60 60;35 35 35];
disp('1 = Barrera de seguridad – metal')
disp('2 = Barrera de seguridad – hormigón')
disp('3 = Barrera de seguridad: amigable para motocicletas')
disp('4 = Barrera de seguridad - cable de acero')
disp('5 = Cara vertical agresiva')
disp('6 = Pendiente ascendente (15º a 75º)')
disp('7 = Pendiente empinada hacia arriba (> 75º)')
disp('8 = Cuneta de drenaje profundo')
disp('9 = Terraplén')
disp('10 = Precipicio')
disp('11 = Árbol (> = 10 cm de diámetro)')
disp('12 = Letrero / poste / polo (> = 10 cm de diámetro)')
disp('13 = Estructura / edificio o puente rígido')
disp('14 = Estructura o edificio semi rígidos')
disp('15 = Extremo de barrera desprotegido')
disp('16 = Grandes rocas (> = 20 cm de altura)')
disp('17 = Ninguno (u objeto a > 20 m de la carretera)')
objconducto=x(2);
if objconducto==1
    for i=1:3
 objconductor(1,i)=T10(1,i);
    end
end
if objconducto==2
    for i=1:3
 objconductor(1,i)=T10(2,i);
    end
end
if objconducto==3
    for i=1:3
 objconductor(1,i)=T10(3,i);
    end
end
if objconducto==4
    for i=1:3
 objconductor(1,i)=T10(4,i);
    end
end
if objconducto==5
    for i=1:3
 objconductor(1,i)=T10(5,i);
    end
end
if objconducto==6
    for i=1:3
 objconductor(1,i)=T10(6,i);
    end
end
if objconducto==7
    for i=1:3
 objconductor(1,i)=T10(7,i);
    end
end
if objconducto==8
    for i=1:3
 objconductor(1,i)=T10(8,i);
    end
end
if objconducto==9
    for i=1:3
 objconductor(1,i)=T10(9,i);
    end
end
if objconducto==10
    for i=1:3
 objconductor(1,i)=T10(10,i);
    end
end
if objconducto==11
    for i=1:3
 objconductor(1,i)=T10(11,i);
    end
end
if objconducto==12
    for i=1:3
 objconductor(1,i)=T10(12,i);
    end
end
if objconducto==13
    for i=1:3
 objconductor(1,i)=T10(13,i);
    end
end
if objconducto==14
    for i=1:3
 objconductor(1,i)=T10(14,i);
    end
end
if objconducto==15
    for i=1:3
 objconductor(1,i)=T10(15,i);
    end
end
if objconducto==16
    for i=1:3
 objconductor(1,i)=T10(16,i);
    end
end
if objconducto==17
    for i=1:3
 objconductor(1,i)=T10(17,i);
    end
end
%Ancho de espaldón pavimentado (lado del conductor)
T11=[0.77 16 1.2 90 14;0.83 17 1.2 90 15;0.95 18 1.2 90 18;1 20 1.2 90 20];
anchoespaldo=x(6);
if anchoespaldo==1
    for i=1:5
  anchoespaldon(1,i)=T11(1,i);
    end
end
if anchoespaldo==2
    for i=1:5
  anchoespaldon(2,i)=T11(2,i);
    end
end
if anchoespaldo==3
    for i=1:5
  anchoespaldon(3,i)=T11(3,i);
    end
end
if anchoespaldo==4
    for i=1:5
  anchoespaldon(4,i)=T11(4,i);
    end
end
%Influencia del flujo externo
flujoex=x(30);
if flujoex>=18000
    flujoext=0.5;
else if flujoex>=2000&flujoex<18000
    flujoext=0.5
    else if flujoex<2000
            flujoext=0
        end
    end
end
%Transitabilidad media
disp('1 = Transitable')
disp('2 = No saturada')
transitabilidad=x(53);
if transitabilidad==1
   transitabilidad=1;
else transitabilidad==2
   transitabilidad=0;
end
%Velocidad de operacion (aqui toma el +10km/h)
veloperacio=x(52);
 if veloperacio==150
    veloperacion=1;
 else if veloperacio==145
    veloperacion=0.91;
 else if veloperacio==140
         veloperacion=0.81;
 else if veloperacio==135
         veloperacion=0.73;
 else if veloperacio==130
         veloperacion=0.66;
 else if veloperacio==125
         veloperacion=0.58;
 else if veloperacio==120
        veloperacion=0.51;
 else if veloperacio==115
         veloperacion=0.44;
 else if veloperacio==110
         veloperacion=0.39;
 else if veloperacio==105
         veloperacion=0.34;
 else if veloperacio==100
         veloperacion=0.29;
 else if veloperacio==95
         veloperacion=0.25;  
 else if veloperacio==90
         veloperacion=0.21;
 else if veloperacio==85
         veloperacion=0.18;
 else if veloperacio==80
         veloperacion=0.15;
 else if veloperacio==75
         veloperacion=0.11;
 else if veloperacio==70
         veloperacion=0.1;
 else if veloperacio==65
         veloperacion=0.08;
 else if veloperacio==60
         veloperacion=0.06;
 else if veloperacio==55
         veloperacion=0.05;
 else if veloperacio==50
         veloperacion=0.04;
 else if veloperacio==45
         veloperacion=0.03;
 else if veloperacio==40
         veloperacion=0.02;
 else if veloperacio==35
         veloperacion=0.01;
 else if veloperacio==30
         veloperacion=0;
 end
     end
 end
 end
 end
 end
 end
 end
 end
 end
 end
 end
 end
 end
 end
 end
 end
 end
 end
 end
 end
 end
 end
 end
 end
 %%1.Clasificación por Estrellas para la salida del camino (lado del conductor)
 if curvatur==1
     curvatura2=curvatura(1,1);
 else if curvatur==2
         curvatura2=curvatura(1,1);
 else if curvatur==3
         curvatura2=curvatura(1,1);
 else if curvatur==4
         curvatura2=curvatura(1,1);
 end
 end
 end
 end
 if calidadcurv==1
    calidadcurva2=calidadcurva(1,1);
 else if calidadcurv==2
    calidadcurva2=calidadcurva(1,1);
 else  if calidadcurv==3
    calidadcurva2=calidadcurva(1,1);
 end
     end
 end
if estadosuperfici==1
    estadosuperficie2=estadosuperficie(1,1);
else if estadosuperfici==2
    estadosuperficie2=estadosuperficie(1,1);
    else estadosuperfici==3
    estadosuperficie2=estadosuperficie(1,1);
    end
end
if resdeslizamient==1
   resdeslizamiento2=resdeslizamiento(1,1);
else if resdeslizamient==2
   resdeslizamiento2=resdeslizamiento(1,1);
    else if resdeslizamient==3
   resdeslizamiento2=resdeslizamiento(1,1);
        else if resdeslizamient==4
   resdeslizamiento2=resdeslizamiento(1,1);
            else if resdeslizamient==5
   resdeslizamiento2=resdeslizamiento(1,1);
end
end
end
    end
end
if distconducto==1
  distconductor2=distconductor(1,1);
else if distconducto==2
  distconductor2=distconductor(1,1);
    else if distconducto==3
  distconductor2=distconductor(1,1);
        else if distconducto==4
  distconductor2=distconductor(1,1);
end
end
    end
end
if objconducto==1
 objconductor2=objconductor(1,1);
else if objconducto==2
 objconductor2=objconductor(1,1);
else if objconducto==3
 objconductor2=objconductor(1,1);
 else if objconducto==4
 objconductor2=objconductor(1,1);
 else if objconducto==5
 objconductor2=objconductor(1,1);
 else if objconducto==6
 objconductor2=objconductor(1,1);
 else if objconducto==7
 objconductor2=objconductor(1,1);
 else if objconducto==8
 objconductor2=objconductor(1,1);
 else if objconducto==9
 objconductor2=objconductor(1,1);
 else if objconducto==10
 objconductor2=objconductor(1,1);
 else if objconducto==11
 objconductor2=objconductor(1,1);
 else if objconducto==12
 objconductor2=objconductor(1,1);
 else if objconducto==13
 objconductor2=objconductor(1,1);
 else if objconducto==14
 objconductor2=objconductor(1,1);
 else if objconducto==15
 objconductor2=objconductor(1,1);
 else if objconducto==16
 objconductor2=objconductor(1,1);
 else if objconducto==17
 objconductor2=objconductor(1,1);
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
    end
    end
end
if anchoespaldo==1
  anchoespaldon2=anchoespaldon(1,1);
else if anchoespaldo==2
  anchoespaldon2=anchoespaldon(1,1);
    else if anchoespaldo==3
  anchoespaldon2=anchoespaldon(1,1);
        else if anchoespaldo==4
  anchoespaldon2=anchoespaldon(1,1);
end
end
    end
end
A=anchocarril*curvatura2*calidadcurva2*delineacion*bandasonoraes*estadosuperficie2*pendiente*resdeslizamiento2*distconductor2*objconductor2*anchoespaldon2*flujoext*veloperacion*transitabilidad
%%Salida del camino (lado del copiloto)
%Severidad en la carretera: distancia del lado del conductor
distcopilot=x(3);
if distcopilot==1
    for i=1:3
  distcopiloto(1,i)=T9(1,i);
    end
end
if distcopilot==2
        for i=1:3
  distcopiloto(1,i)=T9(2,i);
    end
end
if distcopilot==3
        for i=1:3
  distcopiloto(1,i)=T9(3,i);
    end
end
if distcopilot==4
        for i=1:3
  distcopiloto(1,i)=T9(4,i);
    end
end
%Severidad en la carretera: objeto del lado del conductor
disp('1 = Barrera de seguridad – metal')
disp('2 = Barrera de seguridad – hormigón')
disp('3 = Barrera de seguridad: amigable para motocicletas')
disp('4 = Barrera de seguridad - cable de acero')
disp('5 = Cara vertical agresiva')
disp('6 = Pendiente ascendente (15º a 75º)')
disp('7 = Pendiente empinada hacia arriba (> 75º)')
disp('8 = Cuneta de drenaje profundo')
disp('9 = Terraplén')
disp('10 = Precipicio')
disp('11 = Árbol (> = 10 cm de diámetro)')
disp('12 = Letrero / poste / polo (> = 10 cm de diámetro)')
disp('13 = Estructura / edificio o puente rígido')
disp('14 = Estructura o edificio semi rígidos')
disp('15 = Extremo de barrera desprotegido')
disp('16 = Grandes rocas (> = 20 cm de altura)')
disp('17 = Ninguno (u objeto a > 20 m de la carretera)')
objcopilot=x(4);
if objcopilot==1
    for i=1:3
 objcopiloto(1,i)=T10(1,i);
    end
end
if objcopilot==2
    for i=1:3
 objcopiloto(1,i)=T10(2,i);
    end;
end
if objcopilot==3
    for i=1:3
 objcopiloto(1,i)=T10(3,i);
    end
end
if objcopilot==4
    for i=1:3
 objcopiloto(1,i)=T10(4,i);
    end
end
if objcopilot==5
    for i=1:3
 objcopiloto(1,i)=T10(5,i);
    end
end
if objcopilot==6
    for i=1:3
 objcopiloto(1,i)=T10(6,i);
    end
end
if objcopilot==7
    for i=1:3
 objcopiloto(1,i)=T10(7,i);
    end
end
if objcopilot==8
    for i=1:3
 objcopiloto(1,i)=T10(8,i);
    end
end
if objcopilot==9
    for i=1:3
 objcopiloto(1,i)=T10(9,i);
    end
end
if objcopilot==10
    for i=1:3
 objcopiloto(1,i)=T10(10,i);
    end
end
if objcopilot==11
    for i=1:3
 objcopiloto(1,i)=T10(11,i);
    end
end
if objcopilot==12
    for i=1:3
 objcopiloto(1,i)=T10(12,i);
    end
end
if objcopilot==13
    for i=1:3
 objcopiloto(1,i)=T10(13,i);
    end
end
if objcopilot==14
    for i=1:3
 objcopiloto(1,i)=T10(14,i);
    end
end
if objcopilot==15
    for i=1:3
 objcopiloto(1,i)=T10(15,i);
    end
end
if objcopilot==16
    for i=1:3
 objcopiloto(1,i)=T10(16,i);
    end
end
if objcopilot==17
    for i=1:3
 objcopiloto(1,i)=T10(17,i);
    end
end
%Ancho espaldones
anchoespaldonco=x(7);
if anchoespaldonco==1
    for i=1:5
  anchoespaldoncop(1,i)=T11(1,i);
    end
end
if anchoespaldonco==2
    for i=1:5
  anchoespaldoncop(2,i)=T11(2,i);
    end
end
if anchoespaldonco==3
    for i=1:5
  anchoespaldoncop(3,i)=T11(3,i);
    end
end
if anchoespaldonco==4
    for i=1:5
  anchoespaldoncop(4,i)=T11(4,i);
    end
end
if distcopilot==1
  distcopiloto2=distcopiloto(1,1);
else if distcopilot==2
  distcopiloto2=distcopiloto(1,1);
    else if distcopilot==3
  distcopiloto2=distcopiloto(1,1);
        else if  distcopilot==4
  distcopiloto2=distcopiloto(1,1);
end
end
    end
end
if objcopilot==1
 objcopiloto2=objcopiloto(1,1);
else if objcopilot==2
 objcopiloto2=objcopiloto(1,1);
else if objcopilot==3
 objcopiloto2=objcopiloto(1,1);
 else if objcopilot==4
 objcopiloto2=objcopiloto(1,1);
 else if objcopilot==5
 objcopiloto2=objcopiloto(1,1);
 else if objcopilot==6
 objcopiloto2=objcopiloto(1,1);
 else if objcopilot==7
 objcopiloto2=objcopiloto(1,1);
 else if objcopilot==8
 objcopiloto2=objcopiloto(1,1);
 else if objcopilot==9
 objcopiloto2=objcopiloto(1,1);
 else if objcopilot==10
 objcopiloto2=objcopiloto(1,1);
 else if objcopilot==11
 objcopiloto2=objcopiloto(1,1);
 else if objcopilot==12
 objcopiloto2=objcopiloto(1,1);
 else if objcopilot==13
 objcopiloto2=objcopiloto(1,1);
 else if objcopilot==14
 objcopiloto2=objcopiloto(1,1);
 else if objcopilot==15
 objcopiloto2=objcopiloto(1,1);
 else if objcopilot==16
 objcopiloto2=objcopiloto(1,1);
 else if objcopilot==17
 objcopiloto2=objcopiloto(1,1);
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
    end
    end
end
if anchoespaldonco==1
  anchoespaldoncop2=anchoespaldon(1,1);
else if anchoespaldonco==2
  anchoespaldoncop2=anchoespaldon(1,1);
    else if anchoespaldonco==3
  anchoespaldoncop2=anchoespaldon(1,1);
        else anchoespaldonco==4
  anchoespaldoncop2=anchoespaldon(1,1);
end
end
end
B=anchocarril*curvatura2*calidadcurva2*delineacion*bandasonoraes*estadosuperficie2*pendiente*resdeslizamiento2*distcopiloto2*objcopiloto2*anchoespaldoncop2*flujoext*veloperacion
%%Choque frontal (pérdida de control)
%Bandas sonoras centrales
disp('1= Ausente')
disp('2 = Presente')
bandassonora=x(11);
if bandassonora==1
    bandassonoras=1.20;
else bandassonora==2
        bandassonoras=1;
end
%Tipo de mediana
T13=[0 0 1 0.7;0 0 1 0.7;2 0 1 0.7;10 0 1 0.7;35 0 1 0.7;80 0 1 0.7;90 0 1.6 0.7;77 25 3 1;90 0 2.7 1;83 82.5 2.4 1;100 100 3 1;0 0 1 0.7;0 0 1 0.7;95 100 2.7 1;0 0 1 0.7];
disp('1 = Barrera de seguridad – metal')
disp('2 = Barrera de seguridad – hormigón')
disp('3 = Faja separadora central física de ancho > = 20 m')
disp('4 = Faja separadora central física de ancho > = 10 a <20 m')
disp('5 = Faja separadora central física de ancho > = 5 a <10 m')
disp('6 = Faja separadora central física de ancho > = 1 a <5 m')
disp('7 = Faja separadora central física de ancho > = 0 a <1 m')
disp('8 = Carril central continuo para vueltas')
disp('9 = Indicadores de alineamiento flexibles')
disp('10 = Raya separadora de sentidos de circulación doble > 1m y rayas diagonales a 45°')
disp('11 = Línea central')
disp('12 = Barrera de seguridad - amigable para motociclistas')
disp('13 = Un solo sentido')
disp('14 = Raya separadora de sentidos de circulación doble (0.3m a 1m) y rayas diagonales a 45°')
disp('15 = Barrera de seguridad - cable de acero')
tipomedian=x(10);
if tipomedian==1
    for i=1:4
 tipomediana(1,i)=T13(1,i);
    end
end
if tipomedian==2
    for i=1:4
 tipomediana(1,i)=T13(2,i);
    end
end
if tipomedian==3
    for i=1:4
 tipomediana(1,i)=T13(3,i);
    end
end
if tipomedian==4
    for i=1:4
 tipomediana(1,i)=T13(4,i);
    end
end
if tipomedian==5
    for i=1:4
 tipomediana(1,i)=T13(5,i);
    end
end
if tipomedian==6
    for i=1:4
 tipomediana(1,i)=T13(6,i);
    end
end
if tipomedian==7
    for i=1:4
 tipomediana(1,i)=T13(7,i);
    end
end
if tipomedian==8
    for i=1:4
 tipomediana(1,i)=T13(8,i);
    end
end
if tipomedian==9
    for i=1:4
 tipomediana(1,i)=T13(9,i);
    end
end
if tipomedian==10
    for i=1:4
 tipomediana(1,i)=T13(10,i);
    end
end
if tipomedian==11
    for i=1:4
 tipomediana(1,i)=T13(11,i);
    end
end
if tipomedian==12
    for i=1:4
 tipomediana(1,i)=T13(12,i);
    end
end
if tipomedian==13
    for i=1:4
 tipomediana(1,i)=T13(13,i);
    end
end
if tipomedian==14
    for i=1:4
 tipomediana(1,i)=T13(14,i);
    end
end
if tipomedian==15
    for i=1:4
 tipomediana(1,i)=T13(15,i);
    end
end
%Influencia del flujo externo
if flujoex<8099
    flujoext1=0.375781625781626;
else if flujoex>=8100&flujoex<16099
        flujoext1=0.626302709636043;
else if flujoex>=16100&flujoex<24099
        flujoext1=0.72651114317781;
    else if flujoex>=24100&flujoex<32000
        flujoext1=0.683170995670996;
end
end
    end
end
%Velocidad de operacion (aqui toma el -10km/h)
 if veloperacio==150
        veloperacion1=1
 else if veloperacio==145
         veloperacion1=0.91
else if veloperacio==140
         veloperacion1=0.81
else if veloperacio==135
         veloperacion1=0.73
else if veloperacio==130
         veloperacion1=0.66
else if veloperacio==125
         veloperacion1=0.58
else if veloperacio==120
        veloperacion1=0.51
else if veloperacio==115
         veloperacion1=0.44
else if veloperacio==110
         veloperacion1=0.39
else if veloperacio==105
         veloperacion1=0.34
else if veloperacio==100
         veloperacion1=0.29
else if veloperacio==95
         veloperacion1=0.25   
else if veloperacio==90
         veloperacion1=0.21
else if veloperacio==85
         veloperacion1=0.18
else if veloperacio==80
         veloperacion1=0.15
else if veloperacio==75
         veloperacion1=0.11
else if veloperacio==70
         veloperacion1=0.1
else if veloperacio==65
         veloperacion1=0.08
else if veloperacio==60
         veloperacion1=0.06
else if veloperacio==55
         veloperacion1=0.05
else if veloperacio==50
         veloperacion1=0.04
else if veloperacio==45
         veloperacion1=0.03
else if veloperacio==40
         veloperacion1=0.02
else if veloperacio==35
         veloperacion1=0.01
else if veloperacio==30
         veloperacion1=0
end
end
end
end
end
end
end
    end
    end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
 end
if tipomedian==1
 tipomediana2=tipomediana(1,1);
else if tipomedian==2
 tipomediana2=tipomediana(1,1);
 else if tipomedian==3
 tipomediana2=tipomediana(1,1);
 else if tipomedian==4
 tipomediana2=tipomediana(1,1);
 else if tipomedian==5
 tipomediana2=tipomediana(1,1);
 else if tipomedian==6
 tipomediana2=tipomediana(1,1);
 else if tipomedian==7
 tipomediana2=tipomediana(1,1);
 else if tipomedian==8
 tipomediana2=tipomediana(1,1);
 else if tipomedian==9
 tipomediana2=tipomediana(1,1);
 else if tipomedian==10
 tipomediana2=tipomediana(1,1);
 else if tipomedian==11
 tipomediana2=tipomediana(1,1);
 else if tipomedian==12
 tipomediana2=tipomediana(1,1);
 else if tipomedian==13
 tipomediana2=tipomediana(1,1);
 else if tipomedian==14
 tipomediana2=tipomediana(1,1);
 else if tipomedian==15
 tipomediana2=tipomediana(1,1);
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end 
C=anchocarril*curvatura2*calidadcurva2*delineacion*bandassonoras*estadosuperficie2*pendiente*resdeslizamiento2*tipomediana2*flujoext1*veloperacion1*transitabilidad
%%Clasificación por Estrellas Choque frontal (adelantamiento) 
%Velocidades diferenciales
disp('1 = Presente')
disp('2 = Ausente')
velodiferenci=x(50);
if velodiferenci==1
    velodiferencial=1.2;
else velodiferenci==2
        velodiferencial=1;
end
%Numero de carriles
T14=[1 1;0.02 2.8;0.01 5.2;0.01 8;0.5 1.8;0.02 4]
disp('1 = Uno')
disp('2 = Dos')
disp('3 = Tres')
disp('4 = Cuatro o mas')
disp('5 = Dos y uno')
disp('6 = Tres y dos')
ncarrile=x(12);
if ncarrile==1
    ncarriles=1;
else if ncarrile==2
        ncarriles=0.02;
else if ncarrile==3
        ncarriles=0.01;
else if ncarrile==4
        ncarriles=0.01;
else if ncarrile==5
        ncarriles=0.5;
else ncarrile==6
        ncarriles=0.02;
end
end
end
end
end
if tipomedian==1
 tipomediana3=tipomediana(1,2);
else if tipomedian==2
 tipomediana3=tipomediana(1,2);
 else if tipomedian==3
 tipomediana3=tipomediana(1,2);
 else if tipomedian==4
 tipomediana3=tipomediana(1,2);
 else if tipomedian==5
 tipomediana3=tipomediana(1,2);
 else if tipomedian==6
 tipomediana3=tipomediana(1,2);
 else if tipomedian==7
 tipomediana3=tipomediana(1,2);
 else if tipomedian==8
 tipomediana3=tipomediana(1,2);
 else if tipomedian==9
 tipomediana3=tipomediana(1,2);
 else if tipomedian==10
 tipomediana3=tipomediana(1,2);
 else if tipomedian==11
 tipomediana3=tipomediana(1,2);
 else if tipomedian==12
 tipomediana3=tipomediana(1,2);
 else if tipomedian==13
 tipomediana3=tipomediana(1,2);
 else if tipomedian==14
 tipomediana3=tipomediana(1,2);
 else if tipomedian==15
 tipomediana3=tipomediana(1,2);
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
D=pendiente*resdeslizamiento2*velodiferencial*ncarriles*tipomediana3*0*veloperacion1
%%Interseccion 
%Tipo de interseccion
T15=[6 15 1.05 40 6 20;15 15 1.5 150 30 30;13 45 1.1 45 17 45;16 45 1.1 55 20 45;9 45 1.1 30 9 45;12 45 1.1 40 14 45;16 50 1.2 55 16 50;23 50 1.2 80 26 50;10 50 1.2 35 10 50;15 50 1.2 50 16 50;0 0 1 0 0 0;0 0 1 0 0 0;1 150 1 3 1 150;0.5 150 1 1 0.5 150;0.5 45 1.1 2 0.5 45;0.3 45 1.1 1 0.3 45;16 35 1.3 55 16 35;2 50 1.01 1.01 2 50;1.3 50 1.01 1.01 1.3 50;1 50 1.01 1.01 1 50];
disp('1 = Carril de incorporacion')
disp('2 = Rotonda')
disp('3 = 3 ramas (no semaforizada) con giro continuo')
disp('4 = 3 ramas (no semaforizada) sin giro continuo')
disp('5 = 3 ramas (semaforizada) con giro continuo')
disp('6 = 3 ramas (semaforizada) sin giro continuo')
disp('7 = 4 ramas (no semaforizada) con giro continuo')
disp('8 = 4 ramas (no semaforizada) sin giro continuo')
disp('9 = 4 ramas (semaforizada) con giro continuo')
disp('10 = 4 ramas (semaforizada) sin giro continuo')
disp('11 = Codigo no utilizado (interes no principales)')
disp('12 = Ninguno')
disp('13 = Cruce de ferrocarril - pasivo (solo señalizacion vertical)')
disp('14 = Cruce de ferrocarril - activo (semaforo intermitente/pluma)')
disp('15 = Punto de cruce de faja separadora central - informal')
disp('16 = Punto de cruce de faja separadora central - formal')
disp('17 = Minirotonda')
disp('18 = Acceso comercial 1+')
disp('19 = Acceso residencial 1+acc')
disp('20 = Acceso residencial 1 O 2')
tipointe=x(25);
if tipointe==1
    for i=1:6
    tipointer(1,i)=T15(1,i);
    end
end
if tipointe==2
    for i=1:6
    tipointer(1,i)=T15(2,i);
    end
end
if tipointe==3
    for i=1:6
    tipointer(1,i)=T15(3,i)
    end
end
if tipointe==4
    for i=1:6
    tipointer(1,i)=T15(4,i);
    end
end
if tipointe==5
    for i=1:6
    tipointer(1,i)=T15(5,i);
    end
end
if tipointe==6
    for i=1:6
    tipointer(1,i)=T15(6,i);
    end
end
if tipointe==7
    for i=1:6
    tipointer(1,i)=T15(7,i);
    end
end
if tipointe==8
    for i=1:6
    tipointer(1,i)=T15(8,i);
    end
end
if tipointe==9
    for i=1:6
    tipointer(1,i)=T15(9,i);
    end
end
if tipointe==10
    for i=1:6
    tipointer(1,i)=T15(10,i);
    end
end
if tipointe==11
    for i=1:6
    tipointer(1,i)=T15(11,i);
    end
end
if tipointe==12
    for i=1:6
    tipointer(1,i)=T15(12,i);
    end
end
if tipointe==13
    for i=1:6
    tipointer(1,i)=T15(13,i);
    end
end
if tipointe==14
    for i=1:6
    tipointer(1,i)=T15(14,i);
    end
end
if tipointe==15
    for i=1:6
    tipointer(1,i)=T15(15,i);
    end
end
if tipointe==16
    for i=1:6
    tipointer(1,i)=T15(15,i);
    end
end
if tipointe==17
    for i=1:6
    tipointer(1,i)=T15(15,i);
    end
end
if tipointe==18
    for i=1:6
    tipointer(1,i)=T15(15,i);
    end
end
if tipointe==19
    for i=1:6
    tipointer(1,i)=T15(15,i);
    end
end
if tipointe==20
    for i=1:6
    tipointer(1,i)=T15(15,i);
    end
end
%Calidad de la interseccion 
%T16=[1 1 1 1;1.2 1.2 1.2 1.2;1 1 1 1]
disp('1 = Adecuado')
disp('2 = Deficiente')
disp('3 = No aplica')
calinte=x(28);
if calinte==1
    calinter=1;
else if calinte==2
     calinter=1.2;
else  calinte==3
      calinter=1;
end
end
%Alumbrado publico
T17=[1 1 1;1.15 1.25 1.25];
disp('1 = Presente')
disp('2 = Ausente')
alumbrad=x(20);
if alumbrad==1
    for i=1:3
    alumbrado(1,i)=T17(1,i);
    end
end
if alumbrad==2
    for i=1:3
    alumbrado(1,i)=T17(2,i);
    end
end
%Distancia visual
T18=[1 1 1;1.42 1.42 1.42];
disp('1 = Adecuada')
disp('2 = Deficiente')
distvisua=x(24);
if distvisua==1
    distvisual=1;
else distvisua==2
    distvisual=1.42;
end
%Canalización de la intersección
disp('1 = Ausente')
disp('2 = Presente')
caninte=x(26);
if caninte==1
    caninter=1.2;
else caninte==2
    caninter=1;
end
%Gestión de la velocidad / Calmante del tráfico
T19=[1.25 1.25 1.25;1 1 1];
disp('1 = Ausente')
disp('2 = Presente')
gestvel=x(51);
if gestvel==1
    gestvelo=1.25;
else gestvel==2 
    gestvelo=1;
end
if tipointe==1
    tipointer2=tipointer(1,1);
else if tipointe==2
    tipointer2=tipointer(1,1);
else if tipointe==3
    tipointer2=tipointer(1,1);
else if tipointe==4
    tipointer2=tipointer(1,1);
else if tipointe==5
    tipointer2=tipointer(1,1);
else if tipointe==6
    tipointer2=tipointer(1,1);
else if tipointe==7
    tipointer2=tipointer(1,1);
else if tipointe==8
    tipointer2=tipointer(1,1);
else if tipointe==9
    tipointer2=tipointer(1,1);
else if tipointe==10
    tipointer2=tipointer(1,1);
else if tipointe==12
    tipointer2=tipointer(1,1);
else if tipointe==13
    tipointer2=tipointer(1,1);
else if tipointe==14
    tipointer2=tipointer(1,1);
else if tipointe==15
    tipointer2=tipointer(1,1);
    else if tipointe==16
    tipointer2=tipointer(1,1);
    else if tipointe==17
    tipointer2=tipointer(1,1);
    else if tipointe==18
    tipointer2=tipointer(1,1);
    else if tipointe==19
    tipointer2=tipointer(1,1);
    else if tipointe==20
    tipointer2=tipointer(1,1);
end
end
end
end
end
end
end
end
end
    end
    end
end
end
    end 
    end
    end
    end
    end
end
if alumbrad==1
    alumbrado1=alumbrado(1,1);
else  alumbrad==2
   alumbrado1=alumbrado(1,1);
end
if tipointe==1
    tipointer3=tipointer(1,2);
else if tipointe==2
    tipointer3=tipointer(1,2);
else if tipointe==3
    tipointer3=tipointer(1,2);
else if tipointe==4
    tipointer3=tipointer(1,2);
else if tipointe==5
    tipointer3=tipointer(1,2);
else if tipointe==6
    tipointer3=tipointer(1,2);
else if tipointe==7
    tipointer3=tipointer(1,2);
else if tipointe==8
    tipointer3=tipointer(1,2);
else if tipointe==9
    tipointer3=tipointer(1,2);
else if tipointe==10
    tipointer3=tipointer(1,2);
else if tipointe==12
    tipointer3=tipointer(1,2);
else if tipointe==13
    tipointer3=tipointer(1,2);
else if tipointe==14
    tipointer3=tipointer(1,2);
else if tipointe==15
    tipointer3=tipointer(1,2);
    else if tipointe==16
    tipointer3=tipointer(1,2);
    else if tipointe==17
    tipointer3=tipointer(1,2);
    else if tipointe==18
    tipointer3=tipointer(1,2);
    else if tipointe==19
    tipointer3=tipointer(1,2);
    else if tipointe==20
    tipointer3=tipointer(1,2);
end
end
end
end
end
end
end
end
end
end
end
end
    end 
    end
    end
    end
    end
    end
end
%Intersección del volumen de la carretera
volinte=x(27)
if volinte==1
    volinter=0.2247
else if volinte==2
        volinter=0.2247
else if volinte==3
        volinter=0.2247
else if volinte==4
        volinter=0.125
else if volinte==5
        volinter=0.06365
else if volinte==6
        volinter=0.00374
else if volinte==7
        volinter=0
    end
    end
    end
    end
    end
    end
end
E=tipointer2*calinter*pendiente*distvisual*alumbrado1*resdeslizamiento2*caninter*gestvelo*tipointer3*volinter*veloperacion
%%Acceso a propiedades
if tipomedian==1
 tipomediana4=tipomediana(1,4);
else if tipomedian==2
 tipomediana4=tipomediana(1,4);
 else if tipomedian==3
 tipomediana4=tipomediana(1,4);
 else if tipomedian==4
 tipomediana4=tipomediana(1,4);
 else if tipomedian==5
 tipomediana4=tipomediana(1,4);
 else if tipomedian==6
 tipomediana4=tipomediana(1,4);
 else if tipomedian==7
 tipomediana4=tipomediana(1,4);
 else if tipomedian==8
 tipomediana4=tipomediana(1,4);
 else if tipomedian==9
 tipomediana4=tipomediana(1,4);
 else if tipomedian==10
 tipomediana4=tipomediana(1,4);
 else if tipomedian==11
 tipomediana4=tipomediana(1,4);
 else if tipomedian==12
 tipomediana4=tipomediana(1,4);
 else if tipomedian==13
 tipomediana4=tipomediana(1,4);
 else if tipomedian==14
 tipomediana4=tipomediana(1,4);
 else if tipomedian==15
 tipomediana4=tipomediana(1,4);
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
%Via de servicio
disp('1 = Presente')
disp('2 = Ausente')
vacces=x(22);
if vacces==1
    vacceso=1;
else  vacces==2
        vacceso=1.5;
end
%Puntos de acceso
T19=[2 50;1.3 50;1.1 50;1 0];
disp('1 = Acceso comercial 1+')
disp('2 = Acceso residencial >=3')
disp('3 = Acceso residencial <3')
disp('4 = Ninguno')
puntacces=x(29);
if puntacces==1
    for i=1:2
    puntacceso(1,i)=T19(1,i);
    end
end
if puntacces==2
    for i=1:2
    puntacceso(1,i)=T19(2,i);
    end
end
if puntacces==3
    for i=1:2
    puntacceso(1,i)=T19(3,i);
    end
end
if puntacces==4
    for i=1:2
    puntacceso(1,i)=T19(4,i);
    end
end
if puntacces==1
    puntacceso1=puntacceso(1,1);
else if puntacces==2
    puntacceso1=puntacceso(1,1);
else if puntacces==3
    puntacceso1=puntacceso(1,1);
else if puntacces==4
    puntacceso1=puntacceso(1,1);
end
end
    end
end
if puntacces==1
    puntacceso2=puntacceso(1,1);
else if puntacces==2
    puntacceso2=puntacceso(1,1);
else if puntacces==3
    puntacceso2=puntacceso(1,1);
else if puntacces==4
    puntacceso2=puntacceso(1,1);
end
end
    end
end
%Influencia del flujo externo - Flujo predeterminado
flujopre=0.01;
F=tipomediana4*vacceso*puntacceso1*puntacceso2*flujopre*veloperacion;
EstVehicul=A+B+C+D+E+F;
if EstVehicul>=22.5
    EstVehiculo=1;
else if EstVehicul>=12.5&EstVehicul<22.5
    EstVehiculo=2;
else if EstVehicul>=5&EstVehicul<12.5
    EstVehiculo=3;
else if EstVehicul>=2.5&EstVehicul<5
    EstVehiculo=4;
else EstVehicul>=0&EstVehicul<2.5
    EstVehiculo=5;
end
end
end
end
%Clasificacion para motociclistas
if curvatur==1
    curvatura3=curvatura(1,2);
else if curvatur==2
    curvatura3=curvatura(1,2);
else if curvatur==3
    curvatura3=curvatura(1,2);
else curvatur==4
    curvatura3=curvatura(1,2);
end
end
end
if calidadcurv==1
    calidadcurva3=calidadcurva(1,2);
 else if calidadcurv==2
    calidadcurva3=calidadcurva(1,2);
 else  calidadcurv==3
    calidadcurva3=calidadcurva(1,2);
 end
 end
if estadosuperfici==1
    estadosuperficie3=estadosuperficie(1,2);
else if estadosuperfici==2
    estadosuperficie3=estadosuperficie(1,2);
    else estadosuperfici==3
    estadosuperficie3=estadosuperficie(1,2);
    end
end
if resdeslizamient==1
   resdeslizamiento3=resdeslizamiento(1,2);
else if resdeslizamient==2
   resdeslizamiento3=resdeslizamiento(1,2);
    else if resdeslizamient==3
   resdeslizamiento3=resdeslizamiento(1,2);
        else if resdeslizamient==4
   resdeslizamiento3=resdeslizamiento(1,2);
            else resdeslizamient==5
   resdeslizamiento3=resdeslizamiento(1,2);
end
end
end
end
if distconducto==1
  distconductor3=distconductor(1,2);
else if distconducto==2
  distconductor3=distconductor(1,2);
    else if distconducto==3
  distconductor3=distconductor(1,2);
        else distconducto==4
  distconductor3=distconductor(1,2);
end
end
end
if objconducto==1
 objconductor3=objconductor(1,2);
else if objconducto==2
 objconductor3=objconductor(1,2);
else if objconducto==3
 objconductor3=objconductor(1,2);
 else if objconducto==4
 objconductor3=objconductor(1,2);
 else if objconducto==5
 objconductor3=objconductor(1,2);
 else if objconducto==6
 objconductor3=objconductor(1,2);
 else if objconducto==7
 objconductor3=objconductor(1,2);
 else if objconducto==8
 objconductor3=objconductor(1,2);
 else if objconducto==9
 objconductor3=objconductor(1,2);
 else if objconducto==10
 objconductor3=objconductor(1,2);
 else if objconducto==11
 objconductor3=objconductor(1,2);
 else if objconducto==12
 objconductor3=objconductor(1,2);
 else if objconducto==13
 objconductor3=objconductor(1,2);
 else if objconducto==14
 objconductor3=objconductor(1,2);
 else if objconducto==15
 objconductor3=objconductor(1,2);
 else if objconducto==16
 objconductor3=objconductor(1,2);
 else if objconducto==17
 objconductor3=objconductor(1,2);
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
    end
    end
end
if anchoespaldo==1
  anchoespaldon3=anchoespaldon(1,2);
else if anchoespaldo==2
  anchoespaldon3=anchoespaldon(1,2);
    else if anchoespaldo==3
  anchoespaldon3=anchoespaldon(1,2);
        else anchoespaldo==4
  anchoespaldon3=anchoespaldon(1,2);
end
end
end
G=anchocarril*curvatura3*calidadcurva3*delineacion*bandasonoraes*estadosuperficie3*pendiente*resdeslizamiento3+distconductor3*objconductor3*anchoespaldon3+flujoext*veloperacion*transitabilidad
%%Salida del camino (lado del copiloto)
if distcopilot==1
  distcopiloto3=distcopiloto(1,2);
else if distcopilot==2
  distcopiloto3=distcopiloto(1,2);
    else if distcopilot==3
  distcopiloto3=distcopiloto(1,2);
        else distcopilot==4
  distcopiloto3=distcopiloto(1,2);
end
end
end
if objcopilot==1
 objcopiloto3=objcopiloto(1,2);
else if objcopilot==2
 objcopiloto3=objcopiloto(1,2);
else if objcopilot==3
 objcopiloto3=objcopiloto(1,2);
 else if objcopilot==4
 objcopiloto3=objcopiloto(1,2);
 else if objcopilot==5
 objcopiloto3=objcopiloto(1,2);
 else if objcopilot==6
 objcopiloto3=objcopiloto(1,2);
 else if objcopilot==7
 objcopiloto3=objcopiloto(1,2);
 else if objcopilot==8
 objcopiloto3=objcopiloto(1,2);
 else if objcopilot==9
 objcopiloto3=objcopiloto(1,2);
 else if objcopilot==10
 objcopiloto3=objcopiloto(1,2);
 else if objcopilot==11
 objcopiloto3=objcopiloto(1,2);
 else if objcopilot==12
 objcopiloto3=objcopiloto(1,2);
 else if objcopilot==13
 objcopiloto3=objcopiloto(1,2);
 else if objcopilot==14
 objcopiloto3=objcopiloto(1,2);
 else if objcopilot==15
 objcopiloto3=objcopiloto(1,2);
 else if objcopilot==16
 objcopiloto3=objcopiloto(1,2);
 else if objcopilot==17
 objcopiloto3=objcopiloto(1,2);
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
    end
    end
end
H=anchocarril*curvatura3*calidadcurva3*delineacion*bandasonoraes*estadosuperficie3*pendiente*resdeslizamiento3*distcopiloto3*objcopiloto3*anchoespaldoncop2*flujoext*veloperacion
%Frontal (pérdida del control) 
%Bandas sonoras centrales
disp('1= Ausente')
disp('2 = Presente')
bandassonora=x(11);
if bandassonora==1
    bandassonoras=1.20;
else bandassonora==2
    bandassonoras=1;
end
I=bandassonoras*anchocarril*curvatura3*calidadcurva3*delineacion*estadosuperficie3*pendiente*resdeslizamiento3*tipomediana2*flujoext1*veloperacion1*transitabilidad
%%Frontal (Adelantamiento)
J=pendiente*resdeslizamiento3*velodiferencial*ncarriles*tipomediana3*0*veloperacion1
%%Interseccion
if tipointe==1
    tipointer4=tipointer(1,5);
else if tipointe==2
    tipointer4=tipointer(1,5);
else if tipointe==3
    tipointer4=tipointer(1,5);
else if tipointe==4
    tipointer4=tipointer(1,5);
else if tipointe==5
    tipointer4=tipointer(1,5);
else if tipointe==6
    tipointer4=tipointer(1,5);
else if tipointe==7
    tipointer4=tipointer(1,5);
else if tipointe==8
    tipointer4=tipointer(1,5);
else if tipointe==9
    tipointer4=tipointer(1,5);
else if tipointe==10
    tipointer4=tipointer(1,5);
else if tipointe==12
    tipointer4=tipointer(1,5);
else if tipointe==13
    tipointer4=tipointer(1,5);
else if tipointe==14
    tipointer4=tipointer(1,5);
else tipointe==15
    tipointer4=tipointer(1,5);
end
end
end
end
end
end
end
end
end
end
end
end
end 
if tipointe==1
    tipointer5=tipointer(1,6);
else if tipointe==2
    tipointer5=tipointer(1,6);
else if tipointe==3
    tipointer5=tipointer(1,6);
else if tipointe==4
    tipointer5=tipointer(1,6);
else if tipointe==5
    tipointer5=tipointer(1,6);
else if tipointe==6
    tipointer5=tipointer(1,6);
else if tipointe==7
    tipointer5=tipointer(1,6);
else if tipointe==8
    tipointer5=tipointer(1,6);
else if tipointe==9
    tipointer5=tipointer(1,6);
else if tipointe==10
    tipointer5=tipointer(1,6);
else if tipointe==12
    tipointer5=tipointer(1,6);
else if tipointe==13
    tipointer5=tipointer(1,6);
else if tipointe==14
    tipointer5=tipointer(1,6);
else tipointe==15
    tipointer5=tipointer(1,6);
end
end
end
end
end
end
end
end
end
end
end
end
end 
%Intersección del volumen de la carretera
volinte=x(27)
if volinte==1
    volinter2=0.15463
else if volinte==2
        volinter2=0.15463
else if volinte==3
        volinter2=0.15463
else if volinte==4
        volinter2=0.125
else if volinte==5
        volinter2=0.01310
else if volinte==6
        volinter2=0.003931
else if volinte==7
        volinter2=0
    end
    end
    end
    end
    end
    end
end
K=tipointer4*calinte*pendiente*alumbrado1*distvisual*caninter*gestvelo*resdeslizamiento3*tipointer5*volinter2*veloperacion
%%Acceso a propiedades
%Via de servicio
disp('1 = Presente')
disp('2 = Ausente')
vacces=x(22);
if vacces==1
    vacceso2=1;
else  vacces==2
        vacceso2=1.5;
end
%Puntos de acceso
T19=[2 50;1.3 50;1.1 50;1 0];
disp('1 = Acceso comercial 1+')
disp('2 = Acceso residencial >=3')
disp('3 = Acceso residencial <3')
disp('4 = Ninguno')
puntacces=x(29);
if puntacces==1
    for i=1:2
    puntacceso(1,i)=T19(1,i);
    end
end
if puntacces==2
    for i=1:2
    puntacceso(1,i)=T19(2,i);
    end
end
if puntacces==3
    for i=1:2
    puntacceso(1,i)=T19(3,i);
    end
end
if puntacces==4
    for i=1:2
    puntacceso(1,i)=T19(4,i);
    end
end
if puntacces==1
    puntacceso3=puntacceso(1,1);
else if puntacces==2
    puntacceso3=puntacceso(1,1);
else if puntacces==3
    puntacceso3=puntacceso(1,1);
else if puntacces==4
    puntacceso3=puntacceso(1,1);
end
end
    end
end
if puntacces==1
    puntacceso4=puntacceso(1,1);
else if puntacces==2
    puntacceso4=puntacceso(1,1);
else if puntacces==3
    puntacceso4=puntacceso(1,1);
else if puntacces==4
    puntacceso4=puntacceso(1,1);
end
end
    end
end
%Influencia del flujo externo - Flujo predeterminado
flujopre=0.01;
Z=vacceso2*puntacceso3*puntacceso4*flujopre*veloperacion;
%%A lo largo
%Infraestructura para motocicletas
T20=[0 50;0.1 50;0 50;0.1 50;1 50;2 50];
disp('1 = Motovía exclusiva de un sentido con barrera')
disp('2 = Motovía exclusiva de un sentido sin barrera')
disp('3 = Motovía exclusiva de dos sentidos con barrera')
disp('4 = Motovía exclusiva de dos sentidos sin barrera')
disp('5 = Motovía compartida en la carretera')
disp('6 = Ninguno')
infmot=x(45);
if infmot==1
    for i=1:2
    infmoto(1,i)=T20(1,i)
    end
end
if infmot==2
    for i=1:2
    infmoto(1,i)=T20(2,i)
    end
end
if infmot==3
    for i=1:2
    infmoto(1,i)=T20(3,i)
    end
end
if infmot==4
    for i=1:2
    infmoto(1,i)=T20(4,i)
    end
end
if infmot==5
    for i=1:2
    infmoto(1,i)=T20(5,i)
    end
end
if infmot==6
    for i=1:2
    infmoto(1,i)=T20(6,i)
    end
end
if infmot==1
    infmoto1=infmoto(1,1)
else if infmot==2
        infmoto1=infmoto(1,1)
else if infmot==3
        infmoto1=infmoto(1,1)
else if infmot==4
        infmoto1=infmoto(1,1)
else if infmot==5
        infmoto1=infmoto(1,1)
else infmot==6
        infmoto1=infmoto(1,1)
end
end
end
end
end
if infmot==1
    infmoto2=infmoto(1,2)
else if infmot==2
        infmoto2=infmoto(1,2)
else if infmot==3
        infmoto2=infmoto(1,2)
else if infmot==4
        infmoto2=infmoto(1,2)
else if infmot==5
        infmoto2=infmoto(1,2)
else infmot==6
        infmoto2=infmoto(1,2)
end
end
end
end
end
%Influencia del flujo externo - Sin TDPA de motocicletas (M/C) por carril
flujomoto=0.1;
L=infmoto1*infmoto2*flujomoto*veloperacion;
pormoto=x(31);
if pormoto==1
        EstMoto=0;
else if pormoto==2
        EstMoto=0;
else if pormoto==3
        EstMoto=(G+H+I+J+K+L+Z);   
else if pormoto==4
        EstMoto=(G+H+I+J+K+L+Z);
else if pormoto==5
        EstMoto=(G+H+I+J+K+L+Z);      
else if pormoto==6
        EstMoto=(G+H+I+J+K+L+Z);
else if pormoto==7
        EstMoto=(G+H+I+J+K+L+Z);       
else if pormoto==8
        EstMoto=(G+H+I+J+K+L+Z);
else if pormoto==9
        EstMoto=(G+H+I+J+K+L+Z);        
else if pormoto==10
        EstMoto=(G+H+I+J+K+L+Z);
    end
    end
    end
    end
    end
    end
    end
    end
    end
end
if EstMoto>=22.5
    EstMotocicleta=1;
else if EstMoto>=12.5&EstMoto<22.5
    EstMotocicleta=2;
else if EstMoto>=5&EstMoto<12.5
    EstMotocicleta=3;
else if EstMoto>=2.5&EstMoto<5
    EstMotocicleta=4;
else if EstMoto>0.00001&EstMoto<2.5
    EstMotocicleta=5;
else if EstMoto==0
    EstMotocicleta=0;
end
end
end
    end
    end
end
%%%Clasificación por Estrellas para ciclistas
%Infraestructura para bicicletas
T21=[0 1 0;0.1 1 90;12 1 90;20 1.2 90;17 1.2 90;19 1 90;1 1 90;16 1.2 90;17 1.2 90;18 1.2 90];
disp('1 = Vía fuera de la carretera con barrera')
disp('2 = Vía fuera de la carretera sin barrera')
disp('3 = Carril en la carretera')
disp('4 = Ninguno')
disp('5 = Extremo derecho extra-ancho (?4.2 m)')
disp('6 = Vía compartida con señalamiento vertical')
disp('7 = Ciclovía de uso compartidO')
disp('8 = Berma pavimentada > = 2.4 m')
disp('9 = Berma pavimentada 1.0 m < ancho <2.4 m')
disp('10 = Berma pavimentado 0m < ancho <= 1.0m')
infbic=x(46);
if infbic==1
    for i=1:3
    infbici(1,i)=T21(1,i);
    end
end
if infbic==2
    for i=1:3
    infbici(1,i)=T21(2,i);
    end
end
if infbic==3
    for i=1:3
    infbici(1,i)=T21(3,i);
    end
end
if infbic==4
    for i=1:3
    infbici(1,i)=T21(4,i);
    end
end
if infbic==5
    for i=1:3
    infbici(1,i)=T21(5,i);
    end
end
if infbic==6
    for i=1:3
    infbici(1,i)=T21(6,i);
    end
end
if infbic==7
    for i=1:3
    infbici(1,i)=T21(7,i);
    end
end
if infbic==8
    for i=1:3
    infbici(1,i)=T21(8,i);
    end
end
if infbic==9
    for i=1:3
    infbici(1,i)=T21(9,i);
    end
end
if infbic==10
    for i=1:3
    infbici(1,i)=T21(10,i);
    end
end
if infbic==1
    infbici1=infbici(1,1);
else if infbic==2
        infbici1=infbici(1,1);
else if infbic==3
        infbici1=infbici(1,1);
else if infbic==4
        infbici1=infbici(1,1);
else if infbic==5
        infbici1=infbici(1,1);
else if infbic==6
        infbici1=infbici(1,1);
else if infbic==7
        infbici1=infbici(1,1);
else if infbic==8
        infbici1=infbici(1,1);
else if infbic==9
        infbici1=infbici(1,1);
else if infbic==10
        infbici1=infbici(1,1);
    end
    end
    end
    end
    end
    end
    end
    end
    end
end
if estadosuperfici==1
    estadosuperficie4=estadosuperficie(1,4);
else if estadosuperfici==2
    estadosuperficie4=estadosuperficie(1,4);
    else if estadosuperfici==3
    estadosuperficie4=estadosuperficie(1,4);
    end
    end
end
%Estacionamiento de vehiculos
disp('1 = Ninguno')
disp('2 = Un lado')
disp('3 = Dos lados')
disp('4 = Ninguno (presencia de peatones o de ciclistas)')
disp('5 = Un lado (presencia de peatones o de ciclistas)')
disp('6 = Dos lados (presencia de peatones o de ciclistas)')
estve=x(21);
if estve==1
    estveh=1
else if estve==2
    estveh=1.2
    else if estve==3
    estveh=1.33
    else if estve==4
    estveh=1
    else if estve==5
    estveh=1
    else estve==6
    estveh=1
        end
        end
        end
        end
end
if alumbrad==1
    alumbrado2=alumbrado(1,3);
else  alumbrad==2
   alumbrado2=alumbrado(1,3);
end
if infbic==1
    infbici2=infbici(1,3);
else if infbic==2
        infbici2=infbici(1,3);
else if infbic==3
        infbici2=infbici(1,3);
else if infbic==4
        infbici2=infbici(1,3);
else if infbic==5
        infbici2=infbici(1,3);
else if infbic==6
        infbici2=infbici(1,3);
else if infbic==7
        infbici2=infbici(1,3);
else if infbic==8
        infbici2=infbici(1,3);
else if infbic==9
        infbici2=infbici(1,3);
else if infbic==10
        infbici2=infbici(1,3);
    end
    end
    end
    end
    end
    end
    end
    end
    end
end
%Velocidad de operacion (+10 km/h)
veloperacionb=x(52);
 if veloperacionb==150
        veloperacionbi=1;
 else if veloperacionb==145
         veloperacionbi=0.97;
 else if veloperacionb==140
         veloperacionbi=0.93;
 else if veloperacionb==135
         veloperacionbi=0.9;
 else if veloperacionb==130
         veloperacionbi=0.87;
 else if veloperacionb==125
         veloperacionbi=0.83;
 else if veloperacionb==120
        veloperacionbi=0.8;
 else if veloperacionb==115
         veloperacionbi=0.77;
 else if veloperacionb==110
         veloperacionbi=0.73;
 else if veloperacionb==105
         veloperacionbi=0.7;
 else if veloperacionb==100
         veloperacionbi=0.67;
 else if veloperacionb==95
         veloperacionbi=0.63;  
 else if veloperacionb==90
         veloperacionbi=0.53;
 else if veloperacionb==85
         veloperacionbi=0.44;
 else if veloperacionb==80
         veloperacionbi=0.36;
 else if veloperacionb==75
         veloperacionbi=0.28;
 else if veloperacionb==70
         veloperacionbi=0.22;
 else if veloperacionb==65
         veloperacionbi=0.18;
 else if veloperacionb==60
         veloperacionbi=0.14;
 else if veloperacionb==55
         veloperacionbi=0.1;
 else if veloperacionb==50
         veloperacionbi=0.07;
 else if veloperacionb==45
         veloperacionbi=0.05;
 else if veloperacionb==40
         veloperacionbi=0.03;
 else if veloperacionb==35
         veloperacionbi=0.02;
 else if veloperacionb==30
         veloperacionbi=0.01;
 end
 end
 end
 end            
 end
 end            
 end
 end            
 end
 end
 end
 end            
 end
 end            
 end
 end
 end
 end
 end
 end
 end    
 end
 end
 end
 end
%Flujoext
%flujoext=input('Ingresar flujo externo : ');
if flujoex<8099
    flujoext5=0.0148308481641815;
else if flujoex>=8100&flujoex<16099
        flujoext5=0.0307038640371974;
else if flujoex>=16100&flujoex<24099
        flujoext5=0.041686708353375;
else flujoex>=24100&flujoex<3200
        flujoext5=0.0521083854417188;
end
end
end
M=infbici1*curvatura2*calidadcurva3*distvisual*anchocarril*delineacion*pendiente*estadosuperficie4*resdeslizamiento3*gestvelo*bandasonoraes*estveh*alumbrado2+infbici2+veloperacionbi*flujoext5
%%Salida de via
if distconducto==1
  distconductor4=distconductor(1,3);
else if distconducto==2
  distconductor4=distconductor(1,3);
    else if distconducto==3
  distconductor4=distconductor(1,3);
        else distconducto==4
  distconductor4=distconductor(1,3);
end
end
end
if objconducto==1
 objconductor4=objconductor(1,3);
else if objconducto==2
 objconductor4=objconductor(1,3);
else if objconducto==3
 objconductor4=objconductor(1,3);
 else if objconducto==4
 objconductor4=objconductor(1,3);
 else if objconducto==5
 objconductor4=objconductor(1,3);
 else if objconducto==6
 objconductor4=objconductor(1,3);
 else if objconducto==7
 objconductor4=objconductor(1,3);
 else if objconducto==8
 objconductor4=objconductor(1,3);
 else if objconducto==9
 objconductor4=objconductor(1,3);
 else if objconducto==10
 objconductor4=objconductor(1,3);
 else if objconducto==11
 objconductor4=objconductor(1,3);
 else if objconducto==12
 objconductor4=objconductor(1,3);
 else if objconducto==13
 objconductor4=objconductor(1,3);
 else if objconducto==14
 objconductor4=objconductor(1,3);
 else if objconducto==15
 objconductor4=objconductor(1,3);
 else if objconducto==16
 objconductor4=objconductor(1,3);
 else if objconducto==17
 objconductor4=objconductor(1,3);
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
    end
    end
end
if distcopilot==1
  distcopiloto4=distcopiloto(1,3);
else if distcopilot==2
  distcopiloto4=distcopiloto(1,3);
    else if distcopilot==3
  distcopiloto4=distcopiloto(1,3);
        else distcopilot==4
  distcopiloto4=distcopiloto(1,3);
end
end
end
if objcopilot==1
 objcopiloto4=objcopiloto(1,3);
else if objcopilot==2
 objcopiloto4=objcopiloto(1,3);
else if objcopilot==3
 objcopiloto4=objcopiloto(1,3);
 else if objcopilot==4
 objcopiloto4=objcopiloto(1,3);
 else if objcopilot==5
 objcopiloto4=objcopiloto(1,3);
 else if objcopilot==6
 objcopiloto4=objcopiloto(1,3);
 else if objcopilot==7
 objcopiloto4=objcopiloto(1,3);
 else if objcopilot==8
 objcopiloto4=objcopiloto(1,3);
 else if objcopilot==9
 objcopiloto4=objcopiloto(1,3);
 else if objcopilot==10
 objcopiloto4=objcopiloto(1,3);
 else if objcopilot==11
 objcopiloto4=objcopiloto(1,3);
 else if objcopilot==12
 objcopiloto4=objcopiloto(1,3);
 else if objcopilot==13
 objcopiloto4=objcopiloto(1,3);
 else if objcopilot==14
 objcopiloto4=objcopiloto(1,3);
 else if objcopilot==15
 objcopiloto4=objcopiloto(1,3);
 else if objcopilot==16
 objcopiloto4=objcopiloto(1,3);
 else if objcopilot==17
 objcopiloto4=objcopiloto(1,3);
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
     end
    end
    end
end
W=(distconductor4*objconductor4)+(distcopiloto4*objcopiloto4)/2
N=anchocarril*curvatura2*calidadcurva3*delineacion*pendiente*estadosuperficie4*resdeslizamiento3*alumbrado2*W*veloperacionbi*flujoext5
%%Interseccion
if tipointe==1
    tipointer6=tipointer(1,4);
else if tipointe==2
    tipointer6=tipointer(1,4);
else if tipointe==3
    tipointer6=tipointer(1,4);
else if tipointe==4
    tipointer6=tipointer(1,4);
else if tipointe==5
    tipointer6=tipointer(1,4);
else if tipointe==6
    tipointer6=tipointer(1,4);
else if tipointe==7
    tipointer6=tipointer(1,4);
else if tipointe==8
    tipointer6=tipointer(1,4);
else if tipointe==9
    tipointer6=tipointer(1,4);
else if tipointe==10
    tipointer6=tipointer(1,4);
else if tipointe==12
    tipointer6=tipointer(1,4);
else if tipointe==13
    tipointer6=tipointer(1,4);
else if tipointe==14
    tipointer6=tipointer(1,4);
else tipointe==15
    tipointer6=tipointer(1,4);
end
end
end
end
end
end
end
end
end
end
end
end
end 
if infbic==1
    infbici3=infbici(1,2);
else if infbic==2
        infbici3=infbici(1,2);
else if infbic==3
        infbici3=infbici(1,2);
else if infbic==4
        infbici3=infbici(1,2);
else if infbic==5
        infbici3=infbici(1,2);
else if infbic==6
        infbici3=infbici(1,2);
else if infbic==7
        infbici3=infbici(1,2);
else if infbic==8
        infbici3=infbici(1,2);
else if infbic==9
        infbici3=infbici(1,2);
else infbic==10
        infbici3=infbici(1,2);
    end
    end
    end
    end
    end
    end
    end
    end
end 
if volinte==1
    volinter3=0.02922
else if volinte==2
        volinter3=0.02922
else if volinte==3
        volinter3=0.02922
else if volinte==4
        volinter3=0.02
else if volinte==5
        volinter3=0.005010
else if volinte==6
        volinter3=0.002505
else if volinte==7
        volinter3=0
    end
    end
    end
    end
    end
    end
end
%Infraestructura para cruce peatonal 
disp('1 = Infraestructura a desnivel')
disp('2 = Semaforizada con refugio')
disp('3 = Semaforizada sin refugio')
disp('4 = No semaforizada. señalizada con pintura y con refugio')
disp('5 = No semaforizada. señalizada con pintura y sin refugio')
disp('6 = Solo refugio')
disp('7 =  Sin infraestructura')
disp('8 = Instalación separada a nivel - presencia de cerca para peatones') 
disp('9 = Cruce demarcado elevado. sin semáforo. con refugio')
disp('10 = Cruce demarcado elevado. sin semáforo. sin refugio')
disp('11 = Cruce no demarcado elevado. con refugio')
disp('12 = Cruce no demarcado elevado. sin refugio')
infcrucepe=x(41);
if infcrucepe==1
    infcrucep=0.4;
else if infcrucepe==2
    infcrucep=1;
else if infcrucepe==3
    infcrucep=1.25;
else if infcrucepe==4
    infcrucep=3.8;
else if infcrucepe==5
    infcrucep=4.8;
else if infcrucepe==6
    infcrucep=5.1;
else if infcrucepe==7
    infcrucep=6.7;    
else if infcrucepe==8
    infcrucep=0;     
else if infcrucepe==9
    infcrucep=2.5;    
else if infcrucepe==10
    infcrucep=3.2;   
else if infcrucepe==11
    infcrucep=3.4;    
else if infcrucepe==12
    infcrucep=4.5;    
end    
end
end
end
end
    end
    end
    end
    end
    end
    end
end
O=tipointer6*calinter*pendiente*resdeslizamiento3*infbici3*alumbrado2*distvisual*caninter*gestvelo*tipointer5*veloperacionbi*volinter3*infcrucep;
porcicli=x(35);
if porcicli==1
        EstCicl=0;
else if porcicli==2
        EstCicl=M+N+O;
else if porcicli==3
        EstCicl=M+N+O;   
else if porcicli==4
        EstCicl=M+N+O;
else if porcicli==5
        EstCicl=M+N+O;      
else if porcicli==6
        EstCicl=M+N+O;
else if porcicli==7
        EstCicl=M+N+O;       
else if porcicli==8
        EstCicl=M+N+O;
else if porcicli==9
        EstCicl=M+N+O;        
else if porcicli==10
        EstCicl=M+N+O;
else if porcicli==11
        EstCicl=M+N+O;
    end
    end
    end
    end
    end
    end
    end
    end
    end
    end
end
if EstCicl>=60
    EstCiclista=1
else if EstCicl>=30&EstCicl<60
    EstCiclista=2
else if EstCicl>=10&EstCicl<30
    EstCiclista=3;
else if EstCicl>=5&EstCicl<10
    EstCiclista=4
else if EstCicl>0.00001&EstCicl<5
    EstCiclista=5
else if EstCicl==0
    EstCiclista=0;
end
end
end
    end
    end
    end
%%Calificación de estrellas para peatones
%A lo largo (lado del conductor) 
%Atributo vial (probabilidad)
%Acera-lado de conductor
T22=[0 0;0.075 0;0.09 0;0.1 0;20 90;5 50;6 60];
disp('1 = Barrera fisica')
disp('2 = Separación no física >= 3.0 m')
disp('3 = Separación no física 1.0 m a 3.0 m')
disp('4 = Separación no física 0 m < 1.0 m')
disp('5 = Ninguno')
disp('6 = Camino informal ? 1.0 m')
disp('7 = Camino informal de 0 m a <1.0 m')
aceconducto=x(43);
if aceconducto==1
    for i=1:2
    aceconductor(1,i)=T22(1,i)
    end
end
if aceconducto==2
    for i=1:2
    aceconductor(1,i)=T22(2,i)
    end
end
if aceconducto==3
    for i=1:2
    aceconductor(1,i)=T22(3,i)
    end
end
if aceconducto==4
    for i=1:2
    aceconductor(1,i)=T22(4,i)
    end
end
if aceconducto==5
    for i=1:2
    aceconductor(1,i)=T22(5,i)
    end
end
if aceconducto==6
    for i=1:2
    aceconductor(1,i)=T22(6,i)
    end
end
if aceconducto==7
    for i=1:2
    aceconductor(1,i)=T22(7,i)
    end
end
if aceconducto==1
    aceconductor1=aceconductor(1,1);
else if aceconducto==2
        aceconductor1=aceconductor(1,1);
else if aceconducto==3
        aceconductor1=aceconductor(1,1);
else if aceconducto==4
        aceconductor1=aceconductor(1,1);
else if aceconducto==5
        aceconductor1=aceconductor(1,1);
else if aceconducto==6
        aceconductor1=aceconductor(1,1);
else if aceconducto==7
        aceconductor1=aceconductor(1,1);
    end
    end
    end
    end
    end
    end
end
P=aceconductor1*curvatura2*anchocarril*calidadcurva2*delineacion*bandasonoraes*estadosuperficie2*pendiente*resdeslizamiento2*gestvelo*distvisual*estveh*alumbrado2;
if aceconducto==1
    aceconductor2=aceconductor(1,2);
else if aceconducto==2
        aceconductor2=aceconductor(1,2);
else if aceconducto==3
        aceconductor2=aceconductor(1,2);
else if aceconducto==4
        aceconductor2=aceconductor(1,2);
else if aceconducto==5
        aceconductor2=aceconductor(1,2);
else if aceconducto==6
        aceconductor2=aceconductor(1,2);
else if aceconducto==7
        aceconductor2=aceconductor(1,2);
    end
    end
    end
    end
    end
    end
end
%Influencia del flujo externo
if flujoex<8099
    flujoext8=0.00874546329091784;
else if flujoex>=8100&flujoex<16099
        flujoext8=0.0116606177212238;
    else if flujoex>=16100&flujoex<24099
            flujoext8=0.116897692655268;
        else if flujoex>=24100&flujoex<32000
                flujoext8=0.15236054629994;
        end
    end
    end
end
%Velocidad de operacion (+10 km/h)
veloperacionp=x(52);
 if veloperacionp==150
        veloperacionpe=1;
 else if veloperacionp==145
         veloperacionpe=0.97;
 else if veloperacion==140
         veloperacionpe=0.93;
 else if veloperacionp==135
         veloperacionpe=0.9;
 else if veloperacionp==130
         veloperacionpe=0.87;
 else if veloperacionp==125
         veloperacionpe=0.83;
 else if veloperacionp==120
        veloperacionpe=0.8;
 else if veloperacionp==115
         veloperacionpe=0.77;
 else if veloperacionp==110
         veloperacionpe=0.73;
 else if veloperacionp==105
         veloperacionpe=0.7;
 else if veloperacionp==100
         veloperacionpe=0.67;
 else if veloperacionp==95
         veloperacionpe=0.63;  
 else if veloperacionp==90
         veloperacionpe=0.6;
 else if veloperacionp==85
         veloperacionpe=0.57;
 else if veloperacionp==80
         veloperacionpe=0.53;
 else if veloperacionp==75
         veloperacionpe=0.46;
 else if veloperacionp==70
         veloperacionpe=0.38;
 else if veloperacionp==65
         veloperacionpe=0.3;
 else if veloperacionp==60
         veloperacionpe=0.22;
 else if veloperacionp==55
         veloperacionpe=0.16;
 else if veloperacionp==50
         veloperacionpe=0.12;
 else if veloperacionp==45
         veloperacionpe=0.08;
 else if veloperacionp==40
         veloperacionpe=0.05;
 else if veloperacionp==35
         veloperacionpe=0.03;
 else if veloperacionp==30
         veloperacionpe=0.01;
 end
 end
 end
 end            
 end
 end            
 end
 end            
 end
 end
 end
 end            
 end
 end            
 end
 end
 end
 end
 end
 end
 end    
 end
 end
 end
 end
%A lo largo (lado del copiloto) 
%Atributo vial (probabilidad)
%Acera-lado de conductor
T22=[0 0;0.075 0;0.09 0;0.1 0;20 90;5 50;6 60];
disp('1 = Barrera fisica')
disp('2 = Separación no física >= 3.0 m')
disp('3 = Separación no física 1.0 m a 3.0 m')
disp('4 = Separación no física 0 m < 1.0 m')
disp('5 = Ninguno')
disp('6 = Camino informal ? 1.0 m')
disp('7 = Camino informal de 0 m a <1.0 m')
acecopilot=x(44);
if acecopilot==1
    for i=1:2
    acecopiloto(1,i)=T22(1,i)
    end
end
if acecopilot==2
    for i=1:2
    acecopiloto(1,i)=T22(2,i)
    end
end
if acecopilot==3
    for i=1:2
    acecopiloto(1,i)=T22(3,i)
    end
end
if acecopilot==4
    for i=1:2
    acecopiloto(1,i)=T22(4,i)
    end
end
if acecopilot==5
    for i=1:2
    acecopiloto(1,i)=T22(5,i)
    end
end
if acecopilot==6
    for i=1:2
    acecopiloto(1,i)=T22(6,i)
    end
end
if acecopilot==7
    for i=1:2
    acecopiloto(1,i)=T22(7,i)
    end
end
if acecopilot==1
    acecopiloto1=acecopiloto(1,1);
else if acecopilot==2
        acecopiloto1=acecopiloto(1,1);
else if acecopilot==3
        acecopiloto1=acecopiloto(1,1);
else if acecopilot==4
        acecopiloto1=acecopiloto(1,1);
else if acecopilot==5
        acecopiloto1=acecopiloto(1,1);
else if acecopilot==6
        acecopiloto1=acecopiloto(1,1);
else if acecopilot==7
        acecopiloto1=acecopiloto(1,1);
    end
    end
    end
    end
    end
    end 
end
R=acecopiloto1*curvatura2*anchocarril*calidadcurva2*delineacion*bandasonoraes*estadosuperficie2*pendiente*resdeslizamiento2*gestvelo*distvisual*estveh*alumbrado2;
if aceconducto==1
     acecopiloto2=acecopiloto(1,2);
else if aceconducto==2
        acecopiloto2=acecopiloto(1,2);
else if aceconducto==3
        acecopiloto2=acecopiloto(1,2);
else if aceconducto==4
        acecopiloto2=acecopiloto(1,2);
else if aceconducto==5
        acecopiloto2=acecopiloto(1,2);
else if aceconducto==6
        acecopiloto2=acecopiloto(1,2);
else if aceconducto==7
        acecopiloto2=acecopiloto(1,2);
    end
    end
    end
    end
    end
    end 
end
%Cruce peatonal (vía inpseccionada)
%Atributo vial (probabilidad)
%Numero de carriles
if tipomedian==1
 tipomediana5=tipomediana(1,3);
else if tipomedian==2
 tipomediana5=tipomediana(1,3);
 else if tipomedian==3
 tipomediana5=tipomediana(1,3);
 else if tipomedian==4
 tipomediana5=tipomediana(1,3);
 else if tipomedian==5
 tipomediana5=tipomediana(1,3);
 else if tipomedian==6
 tipomediana5=tipomediana(1,3);
 else if tipomedian==7
 tipomediana5=tipomediana(1,3);
 else if tipomedian==8
 tipomediana5=tipomediana(1,3);
 else if tipomedian==9
 tipomediana5=tipomediana(1,3);
 else if tipomedian==10
 tipomediana5=tipomediana(1,3);
 else if tipomedian==11
 tipomediana5=tipomediana(1,3);
 else if tipomedian==12
 tipomediana5=tipomediana(1,3);
 else if tipomedian==13
 tipomediana5=tipomediana(1,3);
 else if tipomedian==14
 tipomediana5=tipomediana(1,3);
 else if tipomedian==15
 tipomediana5=tipomediana(1,3);
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
%Calidad del cruce peatonal
disp('1 = Deficiente')
disp('2 = Adecuado')
disp('3 = No aplica')
calicruc=x(40);
if calicruc==1
    calicruce=1;
else if calicruc==2
    calicruce=1.5;    
else if calicruc==3
    calicruce=1;
    end
   end
end
%%Interseccion
if tipointe==1
    tipointer7=tipointer(1,3);
else if tipointe==2
    tipointer7=tipointer(1,3);
else if tipointe==3
    tipointer7=tipointer(1,3);
else if tipointe==4
    tipointer7=tipointer(1,3);
else if tipointe==5
    tipointer7=tipointer(1,3);
else if tipointe==6
    tipointer7=tipointer(1,3);
else if tipointe==7
    tipointer7=tipointer(1,3);
else if tipointe==8
    tipointer7=tipointer(1,3);
else if tipointe==9
    tipointer7=tipointer(1,3);
else if tipointe==10
    tipointer7=tipointer(1,3);
else if tipointe==12
    tipointer7=tipointer(1,3);
else if tipointe==13
    tipointer7=tipointer(1,3);
else if tipointe==14
    tipointer7=tipointer(1,3);
else if tipointe==15
    tipointer7=tipointer(1,3);
end
end
end
end
end
end
end
end
end
end
end
    end
    end
end
%Vallas peatonales
disp('1 = Presente')
disp('2 = Ausente')
valla=x(42);
if valla==1
    vallap=1
    else if valla==2
    vallap=1.25
        end
        end
if alumbrad==1
    alumbrado3=alumbrado(1,2);
else  alumbrad==2
   alumbrado3=alumbrado(1,2);
end
%Numero de carriles
ncarrile=x(12);
if ncarrile==1
    ncarrilespe=1;
else if ncarrile==2
        ncarrilespe=2.8;
else if ncarrile==3
        ncarrilespe=5.2;
else if ncarrile==4
        ncarrilespe=8;
else if ncarrile==5
        ncarrilespe=1.8;
else ncarrile==6
        ncarrilespe=4;
end
end
end
end
end
%Atributo vial severidad
infcruceinsp1=90;
flujoext9=0.03;
U=infcruceinsp1*tipomediana5*ncarrilespe*calicruce*tipointer7*calinter*vallap*resdeslizamiento2*alumbrado3*distvisual*estveh*gestvelo*infcrucep*flujoext9*veloperacionpe;
%Cruce peatonal (vía lateral)
%Atributo vial (probabilidad)
%Numero de carriles
if tipomedian==1
 tipomediana6=tipomediana(1,3);
else if tipomedian==2
 tipomediana6=tipomediana(1,3);
 else if tipomedian==3
 tipomediana6=tipomediana(1,3);
 else if tipomedian==4
 tipomediana6=tipomediana(1,3);
 else if tipomedian==5
 tipomediana6=tipomediana(1,3);
 else if tipomedian==6
 tipomediana6=tipomediana(1,3);
 else if tipomedian==7
 tipomediana6=tipomediana(1,3);
 else if tipomedian==8
 tipomediana6=tipomediana(1,3);
 else if tipomedian==9
 tipomediana6=tipomediana(1,3);
 else if tipomedian==10
 tipomediana6=tipomediana(1,3);
 else if tipomedian==11
 tipomediana6=tipomediana(1,3);
 else if tipomedian==12
 tipomediana6=tipomediana(1,3);
 else if tipomedian==13
 tipomediana6=tipomediana(1,3);
 else if tipomedian==14
 tipomediana6=tipomediana(1,3);
 else if tipomedian==15
 tipomediana6=tipomediana(1,3);
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
%%Interseccion
if tipointe==1
    tipointer8=tipointer(1,3);
else if tipointe==2
    tipointer8=tipointer(1,3);
else if tipointe==3
    tipointer8=tipointer(1,3);
else if tipointe==4
    tipointer8=tipointer(1,3);
else if tipointe==5
    tipointer8=tipointer(1,3);
else if tipointe==6
    tipointer8=tipointer(1,3);
else if tipointe==7
    tipointer8=tipointer(1,3);
else if tipointe==8
    tipointer8=tipointer(1,3);
else if tipointe==9
    tipointer8=tipointer(1,3);
else if tipointe==10
    tipointer8=tipointer(1,3);
else if tipointe==12
    tipointer8=tipointer(1,3);
else if tipointe==13
    tipointer8=tipointer(1,3);
else if tipointe==14
    tipointer8=tipointer(1,3);
else tipointe==15
    tipointer8=tipointer(1,3);
end
end
end
end
end
end
end
end
end
end
end
    end
end
if alumbrad==1
    alumbrado4=alumbrado(1,2);
else  alumbrad==2
   alumbrado4=alumbrado(1,2);
end
%Atributo vial severidad
V=infcruceinsp1*infcrucep*tipomediana6*ncarriles*calicruce*tipointer8*calinter*vallap*resdeslizamiento2*alumbrado4*distvisual*estveh*gestvelo*flujoext9*veloperacionpe;
%Flujo peatonal en hora pico a lo largo de la carretera (lado del conductor)
%Flujo peatonal en hora pico a lo largo de la carretera (lado del conductor)
porpeatoncon=x(33);
if porpeatoncon==1
        Y=0;
else if porpeatoncon==2
        Y=veloperacionpe*flujoext8*aceconductor2*P;
else if porpeatoncon==3
         Y=veloperacionpe*flujoext8*aceconductor2*P;
else if porpeatoncon==4
         Y=veloperacionpe*flujoext8*aceconductor2*P;
else if porpeatoncon==5
         Y=veloperacionpe*flujoext8*aceconductor2*P;
else if porpeatoncon==6
         Y=veloperacionpe*flujoext8*aceconductor2*P;
else if porpeatoncon==7
         Y=veloperacionpe*flujoext8*aceconductor2*P;     
else if porpeatoncon==8
         Y=veloperacionpe*flujoext8*aceconductor2*P;
else if porpeatoncon==9
         Y=veloperacionpe*flujoext8*aceconductor2*P;      
else if porpeatoncon==10
        Y=veloperacionpe*flujoext8*aceconductor2*P;
else if porpeatoncon==11
         Y=veloperacionpe*flujoext8*aceconductor2*P;
    end
    end
    end
    end
    end
    end
    end
    end
    end
    end
end
%Flujo peaton copiloto
porpeatoncopi=x(34);
if porpeatoncopi==1
        S=0;
else if porpeatoncopi==2
        S=veloperacionpe*flujoext8*acecopiloto2*R;
else if porpeatoncopi==3
         S=veloperacionpe*flujoext8*acecopiloto2*R;
else if porpeatoncopi==4
         S=veloperacionpe*flujoext8*acecopiloto2*R;
else if porpeatoncopi==5
         S=veloperacionpe*flujoext8*acecopiloto2*R;
else if porpeatoncopi==6
         S=veloperacionpe*flujoext8*acecopiloto2*R;
else if porpeatoncopi==7
         S=veloperacionpe*flujoext8*acecopiloto2*R;     
else if porpeatoncopi==8
         S=veloperacionpe*flujoext8*acecopiloto2*R;
else if porpeatoncopi==9
         S=veloperacionpe*flujoext8*acecopiloto2*R;      
else if porpeatoncopi==10
        S=veloperacionpe*flujoext8*acecopiloto2*R;
else if porpeatoncopi==11
        S=veloperacionpe*flujoext8*acecopiloto2*R;
    end
    end
    end
    end
    end
    end
    end
    end
    end
    end
end
%Promedio
if Y==0
    T=S;
    else if S==0
T=Y;  
        else if Y>0 & S>0
 T=(S+Y)/2;                          
    end
    end
end
%Flujo peatonal en hora pico que cruza la carretera
porpeatoncru=x(32);
if porpeatoncru==1 
    Z=0;
    U=0;
else if porpeatoncru==2
    Z=T+U+V;
    else if porpeatoncru==3
    Z=T+U+V;
    else if porpeatoncru==4
    Z=T+U+V;
    else if porpeatoncru==5
    Z=T+U+V;
    else if porpeatoncru==6
    Z=T+U+V;
    else if porpeatoncru==7
    Z=T+U+V;
    else if porpeatoncru==8
    Z=T+U+V;
    else if porpeatoncru==9
    Z=T+U+V;
    else if porpeatoncru==10
    Z=T+U+V;
    else if porpeatoncru==11
    Z=T+U+V;
        end
        end
        end
        end
        end
        end
        end
        end
        end
    end
end
if Z==0 & T>0
   Z=V
end
%Total de estrellas en peatones
EstPeato=Z;
if EstPeato>=90
    EstPeaton=1;
else if EstPeato>=40&EstPeato<90
    EstPeaton=2;
else if EstPeato>=15&EstPeato<40
    EstPeaton=3;
else if EstPeato>=5&EstPeato<15
    EstPeaton=4;
else if EstPeato>0&EstPeato<5
    EstPeaton=5;
    else if EstPeato==0
    EstPeaton=0;
                end
            end
        end
    end
    end
end
end
