function [h1,i1,h2,i2,h3,i3,h4,i4,h5,i5,h6,i6,h7,i7,h8,i8,h9,i9,h10,i10,h11,i11,h12,i12,h13,i13,h14,i14,h15,i15,h16,i16,h17,i17,h18,i18,h19,i19,h20,i20,h21,i21,h22,i22,h23,i23,h24,i24,h25,i25,h26,i26,h27,i27,h28,i28,h29,i29,h30,i30,h31,i31,h32,i32,h33,i33,h34,i34,h35,i35,h36,i36,h37,i37,h38,i38,h39,i39,h40,i40,h41,i41,h42,i42,h43,i43,h44,i44,h45,i45,h46,i46,h47,i47,h48,i48,h49,i49,h50,i50,h51,i51,h52,i52,h53,i53,h54,i54] = leer_tablas_5(x) 
%Primer subatributo
f1=find(strcmpi(x.Limite_de_velocidad,'< 30 km/h'));
f2=find(strcmpi(x.Limite_de_velocidad,'35 km/h'));
f3=find(strcmpi(x.Limite_de_velocidad,'40 km/h'));
f4=find(strcmpi(x.Limite_de_velocidad,'45 km/h'));
f5=find(strcmpi(x.Limite_de_velocidad,'50 km/h'));
f6=find(strcmpi(x.Limite_de_velocidad,'55 km/h'));
f7=find(strcmpi(x.Limite_de_velocidad,'60 km/h'));
f8=find(strcmpi(x.Limite_de_velocidad,'65 km/h'));
f9=find(strcmpi(x.Limite_de_velocidad,'70 km/h'));
f10=find(strcmpi(x.Limite_de_velocidad,'75 km/h'));
f11=find(strcmpi(x.Limite_de_velocidad,'80 km/h'));
f12=find(strcmpi(x.Limite_de_velocidad,'85 km/h'));
f13=find(strcmpi(x.Limite_de_velocidad,'90 km/h'));
f14=find(strcmpi(x.Limite_de_velocidad,'95 km/h'));
f15=find(strcmpi(x.Limite_de_velocidad,'100 km/h'));
f16=find(strcmpi(x.Limite_de_velocidad,'105 km/h'));
f17=find(strcmpi(x.Limite_de_velocidad,'110 km/h'));
f18=find(strcmpi(x.Limite_de_velocidad,'115 km/h'));
f19=find(strcmpi(x.Limite_de_velocidad,'120 km/h'));
f20=find(strcmpi(x.Limite_de_velocidad,'125 km/h'));
f21=find(strcmpi(x.Limite_de_velocidad,'130 km/h'));
f22=find(strcmpi(x.Limite_de_velocidad,'135 km/h'));
f23=find(strcmpi(x.Limite_de_velocidad,'140 km/h'));
f24=find(strcmpi(x.Limite_de_velocidad,'145 km/h'));
f25=find(strcmpi(x.Limite_de_velocidad,'≥ 150 km/h'));

g1=x.Distancia(f1);
g2=x.Distancia(f2);
g3=x.Distancia(f3);
g4=x.Distancia(f4);
g5=x.Distancia(f5);
g6=x.Distancia(f6);
g7=x.Distancia(f7);
g8=x.Distancia(f8);
g9=x.Distancia(f9);
g10=x.Distancia(f10);
g11=x.Distancia(f11);
g12=x.Distancia(f12);
g13=x.Distancia(f13);
g14=x.Distancia(f14);
g15=x.Distancia(f15);
g16=x.Distancia(f16);
g17=x.Distancia(f17);
g18=x.Distancia(f18);
g19=x.Distancia(f19);
g20=x.Distancia(f20);
g21=x.Distancia(f21);
g22=x.Distancia(f22);
g23=x.Distancia(f23);
g24=x.Distancia(f24);
g25=x.Distancia(f25);

h1=1/1000*sum(g1);
h2=1/1000*sum(g2);
h3=1/1000*sum(g3);
h4=1/1000*sum(g4);
h5=1/1000*sum(g5);
h6=1/1000*sum(g6);
h7=1/1000*sum(g7);
h8=1/1000*sum(g8);
h9=1/1000*sum(g9);
h10=1/1000*sum(g10);
h11=1/1000*sum(g11);
h12=1/1000*sum(g12);
h13=1/1000*sum(g13);
h14=1/1000*sum(g14);
h15=1/1000*sum(g15);
h16=1/1000*sum(g16);
h17=1/1000*sum(g17);
h18=1/1000*sum(g18);
h19=1/1000*sum(g19);
h20=1/1000*sum(g20);
h21=1/1000*sum(g21);
h22=1/1000*sum(g22);
h23=1/1000*sum(g23);
h24=1/1000*sum(g24);
h25=1/1000*sum(g25);

i1=(h1*100)/(1/1000*sum(x.Distancia));
i2=(h2*100)/(1/1000*sum(x.Distancia));
i3=(h3*100)/(1/1000*sum(x.Distancia));
i4=(h4*100)/(1/1000*sum(x.Distancia));
i5=(h5*100)/(1/1000*sum(x.Distancia));
i6=(h6*100)/(1/1000*sum(x.Distancia));
i7=(h7*100)/(1/1000*sum(x.Distancia));
i8=(h8*100)/(1/1000*sum(x.Distancia));
i9=(h9*100)/(1/1000*sum(x.Distancia));
i10=(h10*100)/(1/1000*sum(x.Distancia));
i11=(h11*100)/(1/1000*sum(x.Distancia));
i12=(h12*100)/(1/1000*sum(x.Distancia));
i13=(h13*100)/(1/1000*sum(x.Distancia));
i14=(h14*100)/(1/1000*sum(x.Distancia));
i15=(h15*100)/(1/1000*sum(x.Distancia));
i16=(h16*100)/(1/1000*sum(x.Distancia));
i17=(h17*100)/(1/1000*sum(x.Distancia));
i18=(h18*100)/(1/1000*sum(x.Distancia));
i19=(h19*100)/(1/1000*sum(x.Distancia));
i20=(h20*100)/(1/1000*sum(x.Distancia));
i21=(h21*100)/(1/1000*sum(x.Distancia));
i22=(h22*100)/(1/1000*sum(x.Distancia));
i23=(h23*100)/(1/1000*sum(x.Distancia));
i24=(h24*100)/(1/1000*sum(x.Distancia));
i25=(h25*100)/(1/1000*sum(x.Distancia));

%Segundo subatributo
f26=find(strcmpi(x.Diferencial_de_limites_de_velocidad,'Ausente'));
f27=find(strcmpi(x.Diferencial_de_limites_de_velocidad,'Presente'));

g26=x.Distancia(f26);
g27=x.Distancia(f27);

h26=1/1000*sum(g26);
h27=1/1000*sum(g27);

i26=(h26*100)/(1/1000*sum(x.Distancia));
i27=(h27*100)/(1/1000*sum(x.Distancia));

%Tercer subatributo
f28=find(strcmpi(x.Gestion_de_la_velocidad_calmante_del_trafico,'Ausente'));
f29=find(strcmpi(x.Gestion_de_la_velocidad_calmante_del_trafico,'Presente'));

g28=x.Distancia(f28);
g29=x.Distancia(f29);

h28=1/1000*sum(g28);
h29=1/1000*sum(g29);

i28=(h28*100)/(1/1000*sum(x.Distancia));
i29=(h29*100)/(1/1000*sum(x.Distancia));

%Cuarto subatributo
f30=find(strcmpi(x.Limite_de_velocidad,'< 30 km/h'));
f31=find(strcmpi(x.Limite_de_velocidad,'35 km/h'));
f32=find(strcmpi(x.Limite_de_velocidad,'40 km/h'));
f33=find(strcmpi(x.Limite_de_velocidad,'45 km/h'));
f34=find(strcmpi(x.Limite_de_velocidad,'50 km/h'));
f35=find(strcmpi(x.Limite_de_velocidad,'55 km/h'));
f36=find(strcmpi(x.Limite_de_velocidad,'60 km/h'));
f37=find(strcmpi(x.Limite_de_velocidad,'65 km/h'));
f38=find(strcmpi(x.Limite_de_velocidad,'70 km/h'));
f39=find(strcmpi(x.Limite_de_velocidad,'75 km/h'));
f40=find(strcmpi(x.Limite_de_velocidad,'80 km/h'));
f41=find(strcmpi(x.Limite_de_velocidad,'85 km/h'));
f42=find(strcmpi(x.Limite_de_velocidad,'90 km/h'));
f43=find(strcmpi(x.Limite_de_velocidad,'95 km/h'));
f44=find(strcmpi(x.Limite_de_velocidad,'100 km/h'));
f45=find(strcmpi(x.Limite_de_velocidad,'105 km/h'));
f46=find(strcmpi(x.Limite_de_velocidad,'110 km/h'));
f47=find(strcmpi(x.Limite_de_velocidad,'115 km/h'));
f48=find(strcmpi(x.Limite_de_velocidad,'120 km/h'));
f49=find(strcmpi(x.Limite_de_velocidad,'125 km/h'));
f50=find(strcmpi(x.Limite_de_velocidad,'130 km/h'));
f51=find(strcmpi(x.Limite_de_velocidad,'135 km/h'));
f52=find(strcmpi(x.Limite_de_velocidad,'140 km/h'));
f53=find(strcmpi(x.Limite_de_velocidad,'145 km/h'));
f54=find(strcmpi(x.Limite_de_velocidad,'≥ 150 km/h'));

g30=x.Distancia(f30);
g31=x.Distancia(f31);
g32=x.Distancia(f32);
g33=x.Distancia(f33);
g34=x.Distancia(f34);
g35=x.Distancia(f35);
g36=x.Distancia(f36);
g37=x.Distancia(f37);
g38=x.Distancia(f38);
g39=x.Distancia(f39);
g40=x.Distancia(f40);
g41=x.Distancia(f41);
g42=x.Distancia(f42);
g43=x.Distancia(f43);
g44=x.Distancia(f44);
g45=x.Distancia(f45);
g46=x.Distancia(f46);
g47=x.Distancia(f47);
g48=x.Distancia(f48);
g49=x.Distancia(f49);
g50=x.Distancia(f50);
g51=x.Distancia(f51);
g52=x.Distancia(f52);
g53=x.Distancia(f53);
g54=x.Distancia(f54);

h30=1/1000*sum(g30);
h31=1/1000*sum(g31);
h32=1/1000*sum(g32);
h33=1/1000*sum(g33);
h34=1/1000*sum(g34);
h35=1/1000*sum(g35);
h36=1/1000*sum(g36);
h37=1/1000*sum(g37);
h38=1/1000*sum(g38);
h39=1/1000*sum(g39);
h40=1/1000*sum(g40);
h41=1/1000*sum(g41);
h42=1/1000*sum(g42);
h43=1/1000*sum(g43);
h44=1/1000*sum(g44);
h45=1/1000*sum(g45);
h46=1/1000*sum(g46);
h47=1/1000*sum(g47);
h48=1/1000*sum(g48);
h49=1/1000*sum(g49);
h50=1/1000*sum(g50);
h51=1/1000*sum(g51);
h52=1/1000*sum(g52);
h53=1/1000*sum(g53);
h54=1/1000*sum(g54);

i30=(h30*100)/(1/1000*sum(x.Distancia));
i31=(h31*100)/(1/1000*sum(x.Distancia));
i32=(h32*100)/(1/1000*sum(x.Distancia));
i33=(h33*100)/(1/1000*sum(x.Distancia));
i34=(h34*100)/(1/1000*sum(x.Distancia));
i35=(h35*100)/(1/1000*sum(x.Distancia));
i36=(h36*100)/(1/1000*sum(x.Distancia));
i37=(h37*100)/(1/1000*sum(x.Distancia));
i38=(h38*100)/(1/1000*sum(x.Distancia));
i39=(h39*100)/(1/1000*sum(x.Distancia));
i40=(h40*100)/(1/1000*sum(x.Distancia));
i41=(h41*100)/(1/1000*sum(x.Distancia));
i42=(h42*100)/(1/1000*sum(x.Distancia));
i43=(h43*100)/(1/1000*sum(x.Distancia));
i44=(h44*100)/(1/1000*sum(x.Distancia));
i45=(h45*100)/(1/1000*sum(x.Distancia));
i46=(h46*100)/(1/1000*sum(x.Distancia));
i47=(h47*100)/(1/1000*sum(x.Distancia));
i48=(h48*100)/(1/1000*sum(x.Distancia));
i49=(h49*100)/(1/1000*sum(x.Distancia));
i50=(h50*100)/(1/1000*sum(x.Distancia));
i51=(h51*100)/(1/1000*sum(x.Distancia));
i52=(h52*100)/(1/1000*sum(x.Distancia));
i53=(h53*100)/(1/1000*sum(x.Distancia));
i54=(h54*100)/(1/1000*sum(x.Distancia));
end