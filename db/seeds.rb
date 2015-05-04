Commission.create([
  { name: 'I' },
  { name: 'II' },
  { name: 'III' },
  { name: 'IV' },
  { name: 'V' },
  { name: 'VI' },
  { name: 'VII' }
  ])
Source.create([
  { name: 'Cámara'},
  { name: 'Senado'}
  ])
Topic.create([
  { name: 'Salud' },
  { name: 'Medio Ambiente' },
  { name: 'Laboral y Pensional' },
  { name: 'Administración Pública y Estructura del Estado' },
  { name: 'Infraestructura, Transporte y Movilidad' },
  { name: 'Justicia, Política Criminal y Penitenciaria' },
  { name: 'Honores, Conmemoraciones y Asuntos Culturales' },
  { name: 'Actividad Financiera' },
  { name: 'Estampillas' },
  { name: 'Educación y Deporte' },
  { name: 'Seguridad y Defensa' },
  { name: 'Agropecuario' },
  { name: 'Familia y Género' },
  { name: 'Serviciospúblicos' },
  { name: 'Impuestos y Condiciones de Inversión' },
  { name: 'Tecnologias de la Información y las Comunicaciones' },
  { name: 'Vivienda' },
  { name: 'Relaciones Internacionales' },
  { name: 'Hidrocarburos, Minería y Energía' },
  { name: 'Derechos Fundamentales y Derechos Humanos' }
  ])
PoliticalParty.create([
  { name: 'Partido Liberal Colombiano' },
  { name: 'Partido Conservador Colombiano' },
  { name: 'Partido Opcion Ciudadana' },
  { name: 'Partido Cambio Radical' },
  { name: 'Partido Alianza Verde ' },
  { name: 'Movimiento Autoridades Indigenas de Colombia "Aico"' },
  { name: 'Partido Alianza Social Independiente "Asi"' },
  { name: 'Movimiento "Mira"' },
  { name: 'Partido Social de Unidad Nacional "Partido de la U"' },
  { name: 'Partido Polo Democratico Alternativo' },
  { name: 'Partido Union Patriotica "Up"' },
  { name: 'Centro Democratico' },
  { name: 'Movimiento Alternativo Indigena y Social "Mais"' }
  ])
Region.create([
  { name: 'Amazonas' },
  { name: 'Antioquia' },
  { name: 'Arauca' },
  { name: 'Atlántico' },
  { name: 'Bogotá, D.C.' },
  { name: 'Bolivar' },
  { name: 'Boyacá' },
  { name: 'C.E. Exterior' },
  { name: 'Caldas' },
  { name: 'Caquetá' },
  { name: 'Casanare' },
  { name: 'Cauca' },
  { name: 'Cesar' },
  { name: 'Chocó' },
  { name: 'Córdoba' },
  { name: 'Cundinamarca' },
  { name: 'Guanía' },
  { name: 'Guaviare' },
  { name: 'Huila' },
  { name: 'Indígenas' },
  { name: 'La Guajira' },
  { name: 'Magdalena' },
  { name: 'Meta' },
  { name: 'Nariño' },
  { name: 'Negritudes' },
  { name: 'Norte de Santander' },
  { name: 'Putumayo' },
  { name: 'Quindío' },
  { name: 'Risaralda' },
  { name: 'San Andres Islas' },
  { name: 'Santander' },
  { name: 'Sucre' },
  { name: 'Tolima' },
  { name: 'Valle del Cauca ' },
  { name: 'Vaupés' },
  { name: 'Vichada' }
  ])
Status.create([
  { name: 'Ninguno' },
  { name: '1era Ponencia' },
  { name: '1er Debate' },
  { name: '2da Ponencia' },
  { name: '2do Debate' },
  { name: '3era Ponencia' },
  { name: '2er Debate' },
  { name: '4ta Ponencia' },
  { name: '4to Debate' },
  { name: '5ta Ponencia' },
  { name: '5to Debate' },
  { name: '6ta Ponencia' },
  { name: '6to Debate' },
  { name: '7ma Ponencia' },
  { name: '7mo Debate' },
  { name: '8va Ponencia' },
  { name: '8vo Debate' },
  { name: 'Pendiente Conciliación' },
  { name: 'Ponencia de Comisiones Conjuntas' },
  { name: 'Debate Comisiones Conjuntas' },
  { name: 'Ponencia de Plenarias Simultaneas' },
  { name: 'Debate Plenarias Simultaneas' },
  { name: 'Aprobado' }
  ])
FinalStatus.create([
  { name: 'Archivado' },
  { name: 'Retirado' },
  { name: 'Sancionado' }
  ])
Law.create([
  { name: 'Ley Ordinaria' },
  { name: 'Ley Orgánica' },
  { name: 'Ley Estatutaria' },
  { name: 'Acto Legislativo' }
  ])
Probability.create([
  { name: '1' },
  { name: '2' },
  { name: '3' },
  { name: '4' },
  { name: '5' },
  { name: '6' }
  ])
Job.create([
  { name: 'Representante a la Cámara' },
  { name: 'Senador de la República' },
  { name: 'Senadora de la República' }
  ])
Company.create([
  { name: 'Valure' },
  { name: 'Euphoria-net' },
  { name: 'Google' }
  ])
Area.create([
  { name: 'Gerencia' },
  { name: 'Legal' },
  { name: 'Jurídica' },
  { name: 'Administración' },
  { name: 'Asuntos' }
  ])
Role.create([
  { name: 'admin' },
  { name: 'client' }
  ])
sectors = [
  {
    name: "Presidencia de la República",
    institutions: [
      { name: "Departamento Administrativo de la Presidencia de la Republica" },
      { name: "Agencia Colombiana para la Reintegración de Personas y Grupos Alzados En Armas" },
      { name: "Unidad Nacional para la Gestión del Riesgo de Desastres" },
      { name: "Empresa Nacional de Renovación y Desarrollo Urbano, Virgilio Barco Vargas S.A.S." },
    ]
  },
  {
    name: "Interior",
    institutions: [
      { name: "Ministerio del Interior" },
      { name: "Fondo para la Participación y el Fortalecimiento de la Democracia" },
      { name: "Corporación Nacional para la Reconstrucción de la Cuenca del Río Páez y Zonas Aledañas Nasa Kiw E" },
      { name: "Unidad Nacional  de Protección" },
      { name: "Dirección Nacional de Derechos de Autor" },
      { name: "Imprenta Nacional de Colombia" },
    ]
  },
  {
    name: "Relaciones Exteriores",
    institutions: [
      { name: "Ministerio de Relaciones Exteriores" },
      { name: "Fondo Rotatorio del Ministerio de Relaciones Exteriores" },
      { name: "Unidad Administrativa Migración Colombia" },
    ]
  },
  {
    name: "Hacienda y Credito Público",
    institutions: [
      { name: "Ministerio de Hacienda y Crédito Público" },
      { name: "Unidad de Proyección Normativa y Estudios de Regulación Financiera -URF" },
      { name: "Agencia del Inspector General de Tributos y Rentas y Contribuciones Parafiscales - Itrc" },
      { name: "Fondo de Adaptación" },
      { name: "Superintendencia Financiera de Colombia" },
      { name: "Superintendencia de Economia Solidaria" },
      { name: "Dirección de Impuestos y Aduanas Nacionales Dian" },
      { name: "Contaduría General de la Nación" },
      { name: "Unidad Administrativa Especial de Información y Análisis Financiero" },
      { name: "Unidad Administrativa de Gestión Pensional y Contribuciones Parafiscalesde la Protección Social Ugpp" },
      { name: "Fondo de Garantías de Instituciones Financieras  Fogafin" },
      { name: "Fondo de Garantías de Entidades Cooperativas Financieras y Ahorro y Crédito Fogacoop" },
      { name: "Financiera de Desarrollo Territorial S.A Findeter " },
      { name: "Financiera de Desarrollo Nacional S.A" },
      { name: "La Previsora S.A. Compañía de Seguros S.A." },
      { name: "Administradora del Monopolio Rentístico de Los Juegos de Suerte y Azar -COLJUEGOS" },
      { name: "Central de Inversiones S.A. Cisa" },
      { name: "Fiduciaria del Estado Sa * En Liquidación" },
      { name: "Banco Central Hipotecario Bch *En Liquidación" },
      { name: "Banco del Estado S.A *En Liquidación" },
      { name: "Sociedad de Activos Especiales S.A.S. - Sae" },
      { name: "Fiduciaria la Previsora S.A." },
      { name: "Banco Cafetero Sa. *En Liquidación" },
      { name: "Positiva Compañía de Seguros S.A" },
    ]
  },
  {
    name: "Justicia y del Derecho",
    institutions: [
      { name: "Ministerio de Justicia y del Derecho" },
      { name: "Instituto Nal. Penitenciario y Carcelario Inpec" },
      { name: "Agencia Nacional de Defensa Jurídica del Estado" },
      { name: "Unidad de Servicios Penitenciarios y Carcelarios - Uspec" },
      { name: "Superintendencia de Notariado y Registro" },
      { name: "Dirección Nacional de Estupefacientes * En Liquidación" },
      { name: "Superintendencia de Vigilancia y Seguridad Privada" },
    ]
  },
  {
    name: "Defensa Nacional",
    institutions: [
      { name: "Ministerio de Defensa Nacional" },
      { name: "Caja de Retiro de las Fuerzas Militares" },
      { name: "Hospital Militar Central" },
      { name: "Defensa Civil Colombiana" },
      { name: "Caja de Sueldos de Retiro de la Policía Nacional" },
      { name: "Agencia Logística de las Fuerzas Militares" },
      { name: "Fondo Rotatorio de la Policía Naciona" },
      { name: "Instituto de Casas Fiscales del Ejército " },
      { name: "Club Militar" },
      { name: "Industria Militar - Indumil" },
      { name: "Caja Promotora de Vivienda Militar y de Policia" },
      { name: "Servicio Aéreo A Territorios Nacionales - Satena" },
      { name: "Corporación de la Industria Aeronáutica Colombiana S.A. -  Ciac  S.A" },
      { name: "Sociedad Hotelera Tequendama Crowne Plaza" },
    ]
  },
  {
    name: "Agricultura y Desarrollo Rural",
    institutions: [
      { name: "Ministerio de Agricultura y Desarrollo Rural" },
      { name: "Unidad de Planificación de Tierras Rurales, Adecuación de Tierras y Usos Agropecuarios -UPRA" },
      { name: "Instituto Colombiano Agropecuario - Ica" },
      { name: "Instituto Colombiano de Desarrollo Rural -INCODER" },
      { name: "Autoridad Nacional de Acuicultura y Pesca Aunap" },
      { name: "Unidad Administrativa Especial de Gestión de Restitucióin de Tierras Despojadas - Uaegrtd" },
      { name: "Corporaciones de Abastos de Bogotá, S.A." },
      { name: "Caja de Compensación  Familiar Campesina - Comcaja" },
      { name: "Empresa Colombiana de Prodcutos Veterinarios S.A - Vecol S. " },
      { name: "Banco Agrario de Colombia  S.A. - Banagrario S. A." },
      { name: "Fondo para el Financiamiento del Sector Agropecuario - Finagro" },
      { name: "Almacenes Generales de Depósito de la Caja Agraria y el Banco Ganadero -  Almagrario S.A " },
      { name: "Corporacion Colombiana de Investigación Agropecuaria - Corpoica" },
      { name: "Central de Abastos de Cúcuta - Cenbastos" },
      { name: "Sociedad Fiduciaria de Desarrollo Agropecuario - Fiduagraria" },
      { name: "Corporación Colombiana Internacional -CCI" },
    ]
  },
  {
    name: "Salud y Protección Social",
    institutions: [
      { name: "Ministerio de Salud y Protección Social" },
      { name: "Superintendencia Nacional de Salud" },
      { name: "Fondo de Previsión Social del Congreso" },
      { name: "Fondo de Pasivo Social de Ferrocarriles Nacionales de Colombia" },
      { name: "Instituto Nacional de Salud - – Ins" },
      { name: "Instituto de Vigilancia de Medicamentos y Alimentos - Invima" },
      { name: "Centro Dermatológico Federico Lleras" },
      { name: "Sanatorio de Agua de Dios" },
      { name: "Sanatorio de Contratación" },
      { name: "Instituto Nacional de Cancerología" },
      { name: "Comisión de Regulación En Salud - Cres" },
      { name: "Instituto de Seguros Sociales Iss *En Liquidación" },
      { name: "Caja Nacional de Previsión Social Cajanal * (EN Liquidación)" },
      { name: "Empresa Social del Estado Antonio Nariño *En Liquidación" },
      { name: "Caja de Previsión Social de Comunicaciones - Caprecom" },
    ]
  },
  {
    name: "Trabajo",
    institutions: [
      { name: "Ministerio del Trabajo" },
      { name: "Superintendencia del Subsidio Familiar" },
      { name: "Servicio Nacional de Aprendizaje" },
      { name: "Organizaciones Solidarias-Unidad Administrativa Especial de Organizaciones Solidarias" },
      { name: "Administradora Colombiana de Pensiones – Colpensiones" },
    ]
  },
  {
    name: "Minas y Energía",
    institutions: [
      { name: "Ministerio de Minas y Energia" },
      { name: "Comisión de Regulación de Energía y Gas -CREG" },
      { name: "Instituto de Planificación y Promoción de Soluciones Energéticas para las Zonas No Interconectadas -IPSE" },
      { name: "Unidad de Planeación Minero Energética - Upme" },
      { name: "Agencia Nacional de Hidrocarburos - Anh" },
      { name: "Agencia Nacional de Minas" },
      { name: "Servicio Geológico Colombiano" },
      { name: "Empresa Colombiana de Gas -ECOGAS * En Liquidación" },
      { name: "Ecopetrol S.A." },
      { name: "Financiera Energética Nacional S.A.  - Fen" },
      { name: "Corporación Eléctrica de la Costa Atlantica  -CORELCA" },
      { name: "Interconexión Eléctrica I.S.A Esp " },
      { name: "Empresa de Energía del Amazonas" },
      { name: "Empresa de Energía del San Andres, Providencia y Santa Catalina" },
      { name: "Empresas de Servicios Públicos Domiciliarios " },
      { name: "Empresa Urrá S.A Esp " },
      { name: "Empresa Colombiana de Generación Eléctrica - Isagen " },
    ]
  },
  {
    name: "Comercio Industria y Turismo",
    institutions: [
      { name: "Ministerio de Comercio Industria y Turismo" },
      { name: "Corporación para el Desarrollo de las Microempresas" },
      { name: "Superintendencia de Industria y Comercio" },
      { name: "Superintendencia de Sociedades" },
      { name: "Instituto Nacional de Metrología  -INM " },
      { name: "Junta Central de Contadores" },
      { name: "Artesanías de Colombia S.A." },
      { name: "Fondo Nacional de Garantías" },
      { name: "Banco de Comercio Exterior S.A. Bancoldex" },
      { name: "Compañia de Financiamiento Comercial Ifi Leasing" },
      { name: "Fiduciaria Colombiana de Comercio - Fiducoldex" },
    ]
  },
  {
    name: "Educación Nacional",
    institutions: [
      { name: "Ministerio de Educación Nacional" },
      { name: "Instituto Nacional para Ciegos –INCI" },
      { name: "Instituto Nacional para Sordos – Insor" },
      { name: "Instituto Nacional de Formación Técnica Profesional de San Juan del Cesar" },
      { name: "Instituto Tolimense de Formación Técnica Profesional" },
      { name: "Instituto Técnico Central" },
      { name: "Instituto Técnico Nacional de Comercio Simón Rodríguez" },
      { name: "Instituto Nacional de Formación Técnica Profesional del Departamento de San Andrés, Providencia y Santa Catalina  Infotep de San Andres"},
      { name: "Instituto Colombiano de Crédito Educativo y Estudios Técnicos En el Exterior “MARIANO Ospina Pérez” - Icetex" },
      { name: "Instituto Colombiano para el Fomento de la Educación Superior Icfes" },
      { name: "Fondo de Desarrollo para la Educación Superior -FODESEP" },
      { name: "Universidad Nacional de Colombia" },
      { name: "Universidad del Cauca" },
      { name: "Universidad de Caldas" },
      { name: "Universidad de Córdoba" },
      { name: "Universidad Pedagogica Nacional" },
      { name: "Universidad Pedagogica y Tecnologica de Colombia" },
      { name: "Universidad Popular del Cesar" },
      { name: "Universidad Colegio Mayor de Cundinamarca" },
      { name: "Universidad Surcolombiana" },
      { name: "Universidad Tecnologica del Choco -DIEGO L. Cordoba" },
      { name: "Universidad de Los Llanos Orientales" },
      { name: "Universidad Tecnologica de Pereira" },
      { name: "Universidad de la Amazonia" },
      { name: "Universidad del Pacífico" },
      { name: "Universidad Militar Nueva Granada" },
      { name: "Universidad Nacional Abierta y A Distancia Unad" },
    ]
  },
  {
    name: "Ambiente y Desarrollo Sostenible",
    institutions: [
      { name: "Ministerio de Ambiente y Desarrollo Sostenible" },
      { name: "Parques Nacionales Naturales de Colombia" },
      { name: "Autoridad Nacional de Licencias Ambientales –ANLA" },
      { name: "Instituto de Hidrología, Meteorología y Estudios Ambientales Ideam" },
      { name: "Inst. de Investigaciones Marinas y Costeras Jose Benito Vives de Andreis - Invemar" },
      { name: "Instituto de Investigación de Recursos Biológicos Alexander Von Humbold" },
      { name: "Instituto Amazónico de Investigaciones Científicas - Sinchi" },
      { name: "Instituto de Investigaciones Ambientales del Pacífico Jhon Von Neumann" },
      { name: "Fondo Nacional Ambiental -FONAM" },
      { name: "Instituto Nacional de Vivienda de Interés Social y Reforma Urbana Inurbe En Liquidación" },
      { name: "Corporaciones Autónomas Regionales" },
      { name: "Corporación Autónoma Regional del Río Grande de la Magdalena" },
      { name: "Corporación Autónoma Regional de la Defensa de la Meseta de Bucaramanga -CDMB" },
      { name: "Corporación Autónoma Regional de Boyacá - Corpoboyaca" },
      { name: "Corporación Autónoma Regional de Caldas – Corpocaldas" },
      { name: "Corporación Autónoma Regional del Canal del Dique – Cardique" },
      { name: "Corporación Autónoma Regional del Cauca -CRC" },
      { name: "Corporación Autónoma Regional del Centro de Antioquia - Corantioquia" },
      { name: "Corporación Autónoma Regional del Cesar- Corpocesar" },
      { name: "Corporación Autónoma Regional de Chivor - Corpochivor" },
      { name: "Corporación Autónoma Regional de Cundinamarca - Car" },
      { name: "Corporación Autónoma Regional del Guavio - Corpoguavio" },
      { name: "Corporación Autónoma Regional de la Frontera Nororiental - Corponor" },
      { name: "Corporación Autónoma Regional de la Guajira - Corpoguajira" },
      { name: "Corporación Autónoma Regional de la Orinoquía - Corporinoquia" },
      { name: "Corporación Autónoma Regional Cuencas de Los Ríos Negro y Nare - Cornare" },
      { name: "Corporación Autónoma Regional Valles de Sinú y San Jorge - Cvs" },
      { name: "Corporación Autónoma Regional del Alto Magdalena - Cam" },
      { name: "Corporación Autónoma Regional del Magdalena – Corpamag" },
      { name: "Corporación Autónoma Regional de Nariño - Corponariño" },
      { name: "Corporación Autónoma Regional del Quindío - Crq" },
      { name: "Corporación Autónoma Regional de Risaralda - Carder" },
      { name: "Corporación Autónoma Regional de Santander - Cas" },
      { name: "Corporación Autónoma Regional del Sur de Bolívar - Csb" },
      { name: "Corporación Autónoma Regional del Tolima - Cortolima" },
      { name: "Corporación Autónoma Regional del Valle del Cauca – Cvc" },
      { name: "Corporación Autónoma Regional de Sucre – Carsucre" },
      { name: "Corporación Autónoma Regional del Atlántico - Cra" },
      { name: "Corporación para el Desarrollo Sostenible del Archipiélago de San Andrés, Providencia y Santa Catalina-Coralina" },
      { name: "Corporación para el Desarrollo Sostenible del Chocó - Codechocó" },
      { name: "Corporación para el Desarrollo Sostenible de la Macarena – Cormacarena" },
      { name: "Corporación para el Desarrollo Sostenible de la Mojana y el San Jorge – Corpomojana" },
      { name: "Corporación para el Desarrollo Sostenible del Norte y del Oriente de la Amazonía – Cda" },
      { name: "Corporación para el Desarrollo Sostenible del Sur de la Amazonía - Corpoamazonía" },
      { name: "Corporación para el Desarrollo Sostenible del Uraba - Corpouraba" },
    ]
  },
  {
    name: "Vivienda Ciudad y Territorio",
    institutions: [
      { name: "Ministerio de Vivienda Ciudad y Territorio"},
      { name: "Fondo Nacional de Vivienda - – Fonvivienda "},
      { name: "Comisión de Regulación de Agua Potable  y Saneamiento Básica -CRA"},
      { name: "Fondo Nacional de Ahorro -FNA"},
    ]
  },
  {
    name: "Tecnologías de la Información y las Comunicaciones",
    institutions: [
      { name: "Ministerio de Tecnologías de la Información y las Comunicaciones" },
      { name: "Empresa de Telecomunicaciones del Caqueta S.A. Telecaquetä En Liquidación" },
      { name: "Empresa de Telecomunicaciones de Maicao Telemaicao En Liquidación" },
      { name: "Empresa de Telecomunicaciones de Calarcatelecalarca En Liquidación" },
      { name: "Empresa de Telecomunicaciones de Tulúa Teletuluá En Liquidación" },
      { name: "Empresa de Telecomunicaciones de Nariño Telenariño En Liquidación" },
      { name: "Empresa de Telecomunicaciones de Santa Rosa de Cabál Telesantarosa En Liquidación" },
      { name: "Empresa de Telecomunicaciones de Cartagena S.A. Telecartagena En Liquidación" },
      { name: "Empresa de Telecomunicaciones de Buenaventura S.A. Telebuenaventura En Liquidación" },
      { name: "Empresa de Telecomunicaciones de Armenia S.A. Telearmenia En Liquidación" },
      { name: "Empresa de Telecomunicaciones de Tolima S.A. Teletolima En Liquidación" },
      { name: "Empresa de Telecomunicaciones de Valledupar S.A. Teleupar En Liquidación" },
      { name: "Empresa de Telecomunicaciones de Huila Telehuila En Liquidación" },
      { name: "Empresa Nacional de Telecomunicaciones Telecom En Liquidación" },
      { name: "Empresa de Telecomunicaciones de Santa Marta Telesantamarta En Liquidación" },
      { name: "Comisión de Regulación de Comunicaciones - Crc" },
      { name: "Fondo de Tecnología de la Información y las Comunicaciones" },
      { name: "Agencia Nacional del Espectro -ANE" },
      { name: "Radio Televisión Nacional de Colombia - Rtvc" },
      { name: "Empresa Colombiana de Telecomunicaciones S.A. - En Liquidación" },
      { name: "Empresa Metropolitana de Telecomunicaciones Barranquilla – Metrotel." },
      { name: "Empresa de Telecomunicaciones de Tequendama -TELETEQUENDAMA." },
      { name: "Empresa de Telecomunicaciones de Bucaramanga -TELEBUCARAMANGA." },
      { name: "Colombia Telecomunicaciones S.A Esp " },
      { name: "Canal Regional del Caribe Telecaribe" },
      { name: "Servicios Postales Nacionales S.A." },
    ]
  },
  {
    name: "Transporte",
    institutions: [
      { name: "Ministerio de Transporte" },
      { name: "Superintendencia de Puertos y Transporte" },
      { name: "Agencia Nacional de Infraestructura - Ani" },
      { name: "Unidad Administrativa Especial  de Aeronatica Civil - Aerocivil" },
      { name: "Instituto Nacionalesde Vías - Invias " },
    ]
  },
  {
    name: "Cultura",
    institutions: [
      { name: "Ministerio de Cultura" },
      { name: "Instituto Colombiano de Antropología E Historia" },
      { name: "Archivo General de la Nación" },
      { name: "Instituto Caro y Cuervo" },
    ]
  },
  {
    name: "Planeación",
    institutions: [
      { name: "Departamento Nacional de Planeación" },
      { name: "Agencia Nacional de Contratación Pública -COLOMBIA Compra Eficiente" },
      { name: "Superintendencia de Servicios Públicos Domiciliarios" },
      { name: "Fondo Nacional de Proyectos de Desarrollo - Fonade" },
    ]
  },
  {
    name: "Inteligencia Estratégica y Contrainteligencia",
    institutions: [
      { name: "Dirección Nacional de Inteligencia" },
      { name: "Fondo Rotatorio del Departamento Administrativo de Seguridad" },
    ]
  },
  {
    name: "Función Pública",
    institutions: [
      { name: "Departamento Administrativo de la Función Pública" },
      { name: "Escuela Superior de la Administración Pública -ESAP" },
    ]
  },
  {
    name: "Estadística",
    institutions: [
      { name: "Departamento Administrativo Nacional de Estadística" },
      { name: "Fondo Rotatorio del Dane – Fondane" },
      { name: "Instituto Geográfico Agustín Codazzi - Igac" },
    ]
  },
  {
    name: "Deporte",
    institutions: [
      { name: "Sector del Deporte, la Recreación, la Actividad Física y el Aprovechamiento del Tiempo Libre- Coldeportes" },
    ]
  },
  {
    name: "Ciencia, Tecnología E Innovación",
    institutions: [
      { name: "Departamento Administrativo de Ciencia, Tecnología E Innovación - Colciencias" },
    ]
  },
  {
    name: "Inclusión Social y Reconciliación",
    institutions: [
      { name: "Departamento Administrativo para la Prosperidad Social" },
      { name: "Instituto Colombiano de Bienestar Familiar" },
      { name: "Agencia Nacional para la Superación de la Pobreza Extrema" },
      { name: "Unidad para la Atención y Reparación Integral A las Víctimas" },
      { name: "Centro de Memoria Histórica" },
      { name: "Unidad Administrativa para la Consolidación Territorial" },
    ]
  },
  {
    name: "Organismos Autónomos",
    institutions: [
      { name: "Autoridad Nacional de Televisión - Antv" },
      { name: "Canal de Televisión Telecafe" },
      { name: "Canal de Televisión Telepacifico" },
      { name: "Canal de Televisión Teveandina Canal 13" },
      { name: "Canal de Televisión Teleantioquia" },
      { name: "Canal de Televisión Teleislas" },
      { name: "Canal de Televisión Regional de Oriente Teleoriente" },
      { name: "Comisión Nacional del Servicio Civil" },
      { name: "Banco de la República" },
      { name: "Comision Nacional de Televisión *En Liquidación " },
    ]
  },
]
sectors.each do |s|
  sector = Sector.create(name: s[:name])
  s[:institutions].each do |i|
    Institution.create(name: i[:name], sector: sector)
  end
end
Kind.create([
  { name: "Circular", executive: true },
  { name: "Decreto", executive: true },
  { name: "Resolución", executive: true },
  ])