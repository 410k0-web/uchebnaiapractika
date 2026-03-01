-- Схема и данные для подсистемы работы с продукцией компании «Комфорт»
PRAGMA foreign_keys = ON;

CREATE TABLE ProductTypes (
    ProductTypeId INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL UNIQUE,
    Coefficient REAL NOT NULL CHECK (Coefficient > 0)
);

CREATE TABLE MaterialTypes (
    MaterialTypeId INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL UNIQUE,
    WastePercentage REAL NOT NULL CHECK (WastePercentage >= 0)
);

CREATE TABLE Workshops (
    WorkshopId INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL UNIQUE,
    WorkshopType TEXT NOT NULL,
    EmployeeCount INTEGER NOT NULL CHECK (EmployeeCount >= 0)
);

CREATE TABLE Products (
    ProductId INTEGER PRIMARY KEY AUTOINCREMENT,
    Article INTEGER NOT NULL,
    ProductTypeId INTEGER NOT NULL,
    Name TEXT NOT NULL,
    PartnerMinPrice NUMERIC NOT NULL CHECK (PartnerMinPrice >= 0),
    MaterialTypeId INTEGER NOT NULL,
    FOREIGN KEY (ProductTypeId) REFERENCES ProductTypes(ProductTypeId) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (MaterialTypeId) REFERENCES MaterialTypes(MaterialTypeId) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE ProductWorkshops (
    ProductWorkshopId INTEGER PRIMARY KEY AUTOINCREMENT,
    ProductId INTEGER NOT NULL,
    WorkshopId INTEGER NOT NULL,
    ProductionHours REAL NOT NULL CHECK (ProductionHours >= 0),
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (WorkshopId) REFERENCES Workshops(WorkshopId) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT UQ_ProductWorkshop UNIQUE (ProductId, WorkshopId)
);

CREATE INDEX IX_Products_ProductTypeId ON Products(ProductTypeId);
CREATE INDEX IX_Products_MaterialTypeId ON Products(MaterialTypeId);
CREATE INDEX IX_ProductWorkshops_ProductId ON ProductWorkshops(ProductId);
CREATE INDEX IX_ProductWorkshops_WorkshopId ON ProductWorkshops(WorkshopId);

INSERT INTO ProductTypes (ProductTypeId, Name, Coefficient) VALUES (1, 'Гостиные', 3.5);
INSERT INTO ProductTypes (ProductTypeId, Name, Coefficient) VALUES (2, 'Прихожие', 5.6);
INSERT INTO ProductTypes (ProductTypeId, Name, Coefficient) VALUES (3, 'Мягкая мебель', 3);
INSERT INTO ProductTypes (ProductTypeId, Name, Coefficient) VALUES (4, 'Кровати', 4.7);
INSERT INTO ProductTypes (ProductTypeId, Name, Coefficient) VALUES (5, 'Шкафы', 1.5);
INSERT INTO ProductTypes (ProductTypeId, Name, Coefficient) VALUES (6, 'Комоды', 2.3);

INSERT INTO MaterialTypes (MaterialTypeId, Name, WastePercentage) VALUES (1, 'Мебельный щит из массива дерева', 0.008);
INSERT INTO MaterialTypes (MaterialTypeId, Name, WastePercentage) VALUES (2, 'Ламинированное ДСП', 0.007);
INSERT INTO MaterialTypes (MaterialTypeId, Name, WastePercentage) VALUES (3, 'Фанера', 0.0055);
INSERT INTO MaterialTypes (MaterialTypeId, Name, WastePercentage) VALUES (4, 'МДФ', 0.003);

INSERT INTO Workshops (WorkshopId, Name, WorkshopType, EmployeeCount) VALUES (1, 'Проектный', 'Проектирование', 4);
INSERT INTO Workshops (WorkshopId, Name, WorkshopType, EmployeeCount) VALUES (2, 'Расчетный', 'Проектирование', 5);
INSERT INTO Workshops (WorkshopId, Name, WorkshopType, EmployeeCount) VALUES (3, 'Раскроя', 'Обработка', 5);
INSERT INTO Workshops (WorkshopId, Name, WorkshopType, EmployeeCount) VALUES (4, 'Обработки', 'Обработка', 6);
INSERT INTO Workshops (WorkshopId, Name, WorkshopType, EmployeeCount) VALUES (5, 'Сушильный', 'Сушка', 3);
INSERT INTO Workshops (WorkshopId, Name, WorkshopType, EmployeeCount) VALUES (6, 'Покраски', 'Обработка', 5);
INSERT INTO Workshops (WorkshopId, Name, WorkshopType, EmployeeCount) VALUES (7, 'Столярный', 'Обработка', 7);
INSERT INTO Workshops (WorkshopId, Name, WorkshopType, EmployeeCount) VALUES (8, 'Изготовления изделий из искусственного камня и композитных материалов', 'Обработка', 3);
INSERT INTO Workshops (WorkshopId, Name, WorkshopType, EmployeeCount) VALUES (9, 'Изготовления мягкой мебели', 'Обработка', 5);
INSERT INTO Workshops (WorkshopId, Name, WorkshopType, EmployeeCount) VALUES (10, 'Монтажа стеклянных, зеркальных вставок и других изделий', 'Сборка', 2);
INSERT INTO Workshops (WorkshopId, Name, WorkshopType, EmployeeCount) VALUES (11, 'Сборки', 'Сборка', 6);
INSERT INTO Workshops (WorkshopId, Name, WorkshopType, EmployeeCount) VALUES (12, 'Упаковки', 'Сборка', 4);

INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (1, 1549922, 1, 'Комплект мебели для гостиной Ольха горная', 160507, 1);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (2, 1018556, 1, 'Стенка для гостиной Вишня темная', 216907, 1);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (3, 3028272, 2, 'Прихожая Венге Винтаж', 24970, 2);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (4, 3029272, 2, 'Тумба с вешалкой Дуб натуральный', 18206, 2);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (5, 3028248, 2, 'Прихожая-комплект Дуб темный', 177509, 1);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (6, 7118827, 3, 'Диван-кровать угловой Книжка', 85900, 1);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (7, 7137981, 3, 'Диван модульный Телескоп', 75900, 1);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (8, 7029787, 3, 'Диван-кровать Соло', 120345, 1);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (9, 7758953, 3, 'Детский диван Выкатной', 25990, 3);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (10, 6026662, 4, 'Кровать с подъемным механизмом с матрасом 1600х2000 Венге', 69500, 1);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (11, 6159043, 4, 'Кровать с матрасом 90х2000 Венге', 55600, 2);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (12, 6588376, 4, 'Кровать универсальная Дуб натуральный', 37900, 2);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (13, 6758375, 4, 'Кровать с ящиками Ясень белый', 46750, 3);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (14, 2759324, 5, 'Шкаф-купе 3-х дверный Сосна белая', 131560, 2);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (15, 2118827, 5, 'Стеллаж Бук натуральный', 38700, 1);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (16, 2559898, 5, 'Шкаф 4 дверный с ящиками Ясень серый', 160151, 3);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (17, 2259474, 5, 'Шкаф-пенал Береза белый', 40500, 3);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (18, 4115947, 6, 'Комод 6 ящиков Вишня светлая', 61235, 1);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (19, 4033136, 6, 'Комод 4 ящика Вишня светлая', 41200, 1);
INSERT INTO Products (ProductId, Article, ProductTypeId, Name, PartnerMinPrice, MaterialTypeId) VALUES (20, 4028048, 6, 'Тумба под ТВ', 12350, 4);

INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (1, 10, 8, 2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (2, 20, 8, 2.7);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (3, 6, 9, 4.2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (4, 7, 9, 4.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (5, 8, 9, 4.7);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (6, 9, 9, 4);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (7, 11, 9, 5.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (8, 2, 10, 0.3);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (9, 3, 10, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (10, 5, 10, 0.3);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (11, 10, 10, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (12, 14, 10, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (13, 20, 10, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (14, 1, 4, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (15, 2, 4, 0.3);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (16, 3, 4, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (17, 4, 4, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (18, 5, 4, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (19, 6, 4, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (20, 7, 4, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (21, 8, 4, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (22, 9, 4, 0.3);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (23, 10, 4, 0.6);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (24, 11, 4, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (25, 12, 4, 0.8);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (26, 13, 4, 2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (27, 14, 4, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (28, 15, 4, 0.3);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (29, 16, 4, 1.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (30, 17, 4, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (31, 18, 4, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (32, 19, 4, 0.4);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (33, 20, 4, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (34, 1, 6, 0.3);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (35, 2, 6, 0.4);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (36, 5, 6, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (37, 6, 6, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (38, 7, 6, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (39, 8, 6, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (40, 9, 6, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (41, 10, 6, 0.4);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (42, 13, 6, 1.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (43, 15, 6, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (44, 17, 6, 2.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (45, 18, 6, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (46, 19, 6, 0.4);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (47, 20, 6, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (48, 1, 1, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (49, 2, 1, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (50, 5, 1, 1.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (51, 8, 1, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (52, 14, 1, 2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (53, 15, 1, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (54, 20, 1, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (55, 1, 3, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (56, 2, 3, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (57, 3, 3, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (58, 4, 3, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (59, 5, 3, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (60, 6, 3, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (61, 7, 3, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (62, 8, 3, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (63, 9, 3, 0.7);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (64, 10, 3, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (65, 11, 3, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (66, 12, 3, 1.1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (67, 13, 3, 2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (68, 14, 3, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (69, 15, 3, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (70, 16, 3, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (71, 17, 3, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (72, 18, 3, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (73, 19, 3, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (74, 20, 3, 0.6);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (75, 1, 2, 0.4);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (76, 2, 2, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (77, 5, 2, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (78, 8, 2, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (79, 14, 2, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (80, 15, 2, 0.7);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (81, 20, 2, 0.4);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (82, 2, 11, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (83, 3, 11, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (84, 5, 11, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (85, 6, 11, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (86, 7, 11, 0.3);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (87, 12, 11, 0.8);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (88, 13, 11, 0.3);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (89, 14, 11, 1.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (90, 15, 11, 0.3);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (91, 16, 11, 2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (92, 18, 11, 0.3);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (93, 20, 11, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (94, 1, 7, 1.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (95, 2, 7, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (96, 5, 7, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (97, 7, 7, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (98, 8, 7, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (99, 9, 7, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (100, 15, 7, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (101, 16, 7, 1);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (102, 17, 7, 3);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (103, 18, 7, 2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (104, 19, 7, 2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (105, 1, 5, 2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (106, 2, 5, 2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (107, 5, 5, 2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (108, 6, 5, 2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (109, 7, 5, 2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (110, 15, 5, 2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (111, 18, 5, 2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (112, 19, 5, 2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (113, 1, 12, 0.3);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (114, 4, 12, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (115, 5, 12, 0.2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (116, 6, 12, 0.3);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (117, 7, 12, 0.2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (118, 8, 12, 0.3);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (119, 9, 12, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (120, 10, 12, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (121, 11, 12, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (122, 12, 12, 0.3);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (123, 13, 12, 0.2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (124, 14, 12, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (125, 15, 12, 0.2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (126, 16, 12, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (127, 17, 12, 0.5);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (128, 18, 12, 0.2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (129, 19, 12, 0.2);
INSERT INTO ProductWorkshops (ProductWorkshopId, ProductId, WorkshopId, ProductionHours) VALUES (130, 20, 12, 0.3);
