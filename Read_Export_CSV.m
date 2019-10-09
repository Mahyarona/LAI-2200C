%------------ Update: 10/09/2019-------------------%
%------------ Written by: Mahyar Aboutalebi--------%


clc;
clear;
close all;


Data_Address_Input='E:\LAI_From_Box\LAI\';

Data_Address_Output='E:\LAI_From_Box\LAI\\Results';

cd(Data_Address_Input)

Filename=dir ('*.txt');

for i=1:length(Filename)
    
Data=function2Read(Filename(i).name);
LAI_index=find(Data.PROMPT1=='LAI');
Date_index=find(Data.PROMPT1=='DATE');
Lat_index=find(Data.PROMPT1=='GPSLAT');
Long_index=find(Data.PROMPT1=='GPSLONG');

if isempty(LAI_index)
    LAI(i)=0;
else
    LAI(i)=Data{LAI_index,2};
end

if isempty(Date_index)
    Date(i)=0;
else
    Date(i)=Data{Date_index,2};
end

if isempty(Lat_index)
    Lat(i)=0;
else
    Lat(i)=Data{Lat_index,2};
end

if isempty(Long_index)
    Long(i)=0;
else
    Long(i)=Data{Long_index,2};
end

end
Data_All=[Date' Lat' Long' LAI'];
cd(Data_Address_Output)
dlmwrite('Data_All_Gallo.csv', Data_All, 'delimiter', ',', 'precision', 9);

