%% Попереднє очищення середовища
close all;
clear;
clc;

%% 1. Завантаження з бібліотеки MATLAB кількох зображень у різних форматах
imgA = imread('peppers.png');      % PNG
imgB = imread('cameraman.tif');    % TIFF
imgC = imread('football.jpg');     % JPEG

% Відображення завантажених зображень
figure('Name','Бібліотечні зображення');
subplot(1,3,1), imshow(imgA), title('peppers.png (PNG)');
subplot(1,3,2), imshow(imgB), title('cameraman.tif (TIFF)');
subplot(1,3,3), imshow(imgC), title('football.jpg (JPEG)');

%% 2. Завантаження зображення з довільного каталогу (шлях вказується безпосередньо)
customPath = '/MATLAB Drive/hero.jpg'; 
imgCustom = imread(customPath);

figure('Name','Власне зображення');
imshow(imgCustom), title('Завантажене зображення з вказаного шляху');
disp('--- Інформація про власне зображення ---');
infoCustom = imfinfo(customPath);
disp(infoCustom);

%% 3. Отримання інформації про зображення
disp('--- Інформація про зображення (football.jpg) ---');
infoC = imfinfo('football.jpg');
disp(infoC);

%% 4. Збереження завантаженого зображення у заданому каталозі
% Вкажіть власний шлях, куди потрібно зберегти.
savePathC = '/MATLAB Drive/imgFolder/saved_football.jpg';
imwrite(imgC, savePathC);
disp('Зображення football.jpg збережено у вказаному каталозі.');

%% 5. Побудова гістограми розподілу яскравостей за допомогою imhist
% Для гістограми зазвичай використовують зображення у відтінках сірого.
grayCustom = rgb2gray(imgCustom);

figure('Name','Гістограма яскравостей');
imhist(grayCustom);
title('Гістограма для власного зображення у відтінках сірого');

%% 6. Контрастування зображення за допомогою imadjust
contrastedImg = imadjust(grayCustom);

%% 7. Відображення зображення з підвищеною контрастністю
figure('Name','Покращена контрастність');
imshow(contrastedImg);
title('Зображення з підвищеним контрастом');

%% 8. Відображення негативу зображення
negativeImg = imcomplement(grayCustom);

figure('Name','Негатив зображення');
imshow(negativeImg);
title('Негатив вихідного зображення');

% 9. Ознайомлення з процедурою imadjust
help imadjust
doc imadjust