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
  { name: 'Liberal Colombiano' },
  { name: 'Conservador Colombiano' },
  { name: 'Opcion Ciudadana' },
  { name: 'Cambio Radical' },
  { name: 'Alianza Verde' },
  { name: 'Movimiento Autoridades Indigenas de Colombia "Aico"' },
  { name: 'Alianza Social Independiente "Asi"' },
  { name: 'Movimiento "Mira"' },
  { name: 'Social de Unidad Nacional "De la U"' },
  { name: 'Polo Democratico Alternativo' },
  { name: 'Union Patriotica "Up"' },
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
  { name: 'Ninguno' , legislative: true, council: false },
  { name: '1era Ponencia' , legislative: true, council: true },
  { name: '1er Debate' , legislative: true, council: true },
  { name: '2da Ponencia' , legislative: true, council: true },
  { name: '2do Debate' , legislative: true, council: true },
  { name: '3era Ponencia' , legislative: true, council: false },
  { name: '2er Debate' , legislative: true, council: false },
  { name: '4ta Ponencia' , legislative: true, council: false },
  { name: '4to Debate' , legislative: true, council: false },
  { name: '5ta Ponencia' , legislative: true, council: false },
  { name: '5to Debate' , legislative: true, council: false },
  { name: '6ta Ponencia' , legislative: true, council: false },
  { name: '6to Debate' , legislative: true, council: false },
  { name: '7ma Ponencia' , legislative: true, council: false },
  { name: '7mo Debate' , legislative: true, council: false },
  { name: '8va Ponencia' , legislative: true, council: false },
  { name: '8vo Debate' , legislative: true, council: false },
  { name: 'Pendiente Conciliación' , legislative: true, council: false },
  { name: 'Ponencia de Comisiones Conjuntas' , legislative: true, council: false },
  { name: 'Debate Comisiones Conjuntas' , legislative: true, council: false },
  { name: 'Ponencia de Plenarias Simultaneas' , legislative: true, council: false },
  { name: 'Debate Plenarias Simultaneas' , legislative: true, council: false },
  { name: 'Aprobado', legislative: true, council: true }
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
      { name: "Departamento Administrativo de la Presidencia de la Republica", executive: true },
      { name: "Agencia Colombiana para la Reintegración de Personas y Grupos Alzados En Armas", executive: true },
      { name: "Unidad Nacional para la Gestión del Riesgo de Desastres", executive: true },
      { name: "Empresa Nacional de Renovación y Desarrollo Urbano, Virgilio Barco Vargas S.A.S.", executive: true },
    ]
  },
  {
    name: "Interior",
    institutions: [
      { name: "Ministerio del Interior", executive: true },
      { name: "Fondo para la Participación y el Fortalecimiento de la Democracia", executive: true },
      { name: "Corporación Nacional para la Reconstrucción de la Cuenca del Río Páez y Zonas Aledañas Nasa Kiw E", executive: true },
      { name: "Unidad Nacional  de Protección", executive: true },
      { name: "Dirección Nacional de Derechos de Autor", executive: true },
      { name: "Imprenta Nacional de Colombia", executive: true },
    ]
  },
  {
    name: "Relaciones Exteriores",
    institutions: [
      { name: "Ministerio de Relaciones Exteriores", executive: true },
      { name: "Fondo Rotatorio del Ministerio de Relaciones Exteriores", executive: true },
      { name: "Unidad Administrativa Migración Colombia", executive: true },
    ]
  },
  {
    name: "Hacienda y Credito Público",
    institutions: [
      { name: "Ministerio de Hacienda y Crédito Público", executive: true, rule: true },
      { name: "Unidad de Proyección Normativa y Estudios de Regulación Financiera -URF", executive: true },
      { name: "Agencia del Inspector General de Tributos y Rentas y Contribuciones Parafiscales - Itrc", executive: true },
      { name: "Fondo de Adaptación", executive: true },
      { name: "Superintendencia Financiera de Colombia", executive: true, rule: true },
      { name: "Superintendencia de Economia Solidaria", executive: true },
      { name: "Dirección de Impuestos y Aduanas Nacionales Dian", executive: true, rule: true },
      { name: "Contaduría General de la Nación", executive: true },
      { name: "Unidad Administrativa Especial de Información y Análisis Financiero", executive: true },
      { name: "Unidad Administrativa de Gestión Pensional y Contribuciones Parafiscalesde la Protección Social Ugpp", executive: true },
      { name: "Fondo de Garantías de Instituciones Financieras  Fogafin", executive: true },
      { name: "Fondo de Garantías de Entidades Cooperativas Financieras y Ahorro y Crédito Fogacoop", executive: true },
      { name: "Financiera de Desarrollo Territorial S.A Findeter ", executive: true },
      { name: "Financiera de Desarrollo Nacional S.A", executive: true },
      { name: "La Previsora S.A. Compañía de Seguros S.A.", executive: true },
      { name: "Administradora del Monopolio Rentístico de Los Juegos de Suerte y Azar -COLJUEGOS", executive: true },
      { name: "Central de Inversiones S.A. Cisa", executive: true },
      { name: "Fiduciaria del Estado Sa * En Liquidación", executive: true },
      { name: "Banco Central Hipotecario Bch *En Liquidación", executive: true },
      { name: "Banco del Estado S.A *En Liquidación", executive: true },
      { name: "Sociedad de Activos Especiales S.A.S. - Sae", executive: true },
      { name: "Fiduciaria la Previsora S.A.", executive: true },
      { name: "Banco Cafetero Sa. *En Liquidación", executive: true },
      { name: "Positiva Compañía de Seguros S.A", executive: true },
    ]
  },
  {
    name: "Justicia y del Derecho",
    institutions: [
      { name: "Ministerio de Justicia y del Derecho", executive: true },
      { name: "Instituto Nal. Penitenciario y Carcelario Inpec", executive: true },
      { name: "Agencia Nacional de Defensa Jurídica del Estado", executive: true },
      { name: "Unidad de Servicios Penitenciarios y Carcelarios - Uspec", executive: true },
      { name: "Superintendencia de Notariado y Registro", executive: true },
      { name: "Dirección Nacional de Estupefacientes * En Liquidación", executive: true },
      { name: "Superintendencia de Vigilancia y Seguridad Privada", executive: true },
    ]
  },
  {
    name: "Defensa Nacional",
    institutions: [
      { name: "Ministerio de Defensa Nacional", executive: true },
      { name: "Caja de Retiro de las Fuerzas Militares", executive: true },
      { name: "Hospital Militar Central", executive: true },
      { name: "Defensa Civil Colombiana", executive: true },
      { name: "Caja de Sueldos de Retiro de la Policía Nacional", executive: true },
      { name: "Agencia Logística de las Fuerzas Militares", executive: true },
      { name: "Fondo Rotatorio de la Policía Naciona", executive: true },
      { name: "Instituto de Casas Fiscales del Ejército ", executive: true },
      { name: "Club Militar", executive: true },
      { name: "Industria Militar - Indumil", executive: true },
      { name: "Caja Promotora de Vivienda Militar y de Policia", executive: true },
      { name: "Servicio Aéreo A Territorios Nacionales - Satena", executive: true },
      { name: "Corporación de la Industria Aeronáutica Colombiana S.A. -  Ciac  S.A", executive: true },
      { name: "Sociedad Hotelera Tequendama Crowne Plaza", executive: true },
    ]
  },
  {
    name: "Agricultura y Desarrollo Rural",
    institutions: [
      { name: "Ministerio de Agricultura y Desarrollo Rural", executive: true },
      { name: "Unidad de Planificación de Tierras Rurales, Adecuación de Tierras y Usos Agropecuarios -UPRA", executive: true },
      { name: "Instituto Colombiano Agropecuario - Ica", executive: true },
      { name: "Instituto Colombiano de Desarrollo Rural -INCODER", executive: true },
      { name: "Autoridad Nacional de Acuicultura y Pesca Aunap", executive: true },
      { name: "Unidad Administrativa Especial de Gestión de Restitucióin de Tierras Despojadas - Uaegrtd", executive: true },
      { name: "Corporaciones de Abastos de Bogotá, S.A.", executive: true },
      { name: "Caja de Compensación  Familiar Campesina - Comcaja", executive: true },
      { name: "Empresa Colombiana de Prodcutos Veterinarios S.A - Vecol S. ", executive: true },
      { name: "Banco Agrario de Colombia  S.A. - Banagrario S. A.", executive: true },
      { name: "Fondo para el Financiamiento del Sector Agropecuario - Finagro", executive: true },
      { name: "Almacenes Generales de Depósito de la Caja Agraria y el Banco Ganadero -  Almagrario S.A ", executive: true },
      { name: "Corporacion Colombiana de Investigación Agropecuaria - Corpoica", executive: true },
      { name: "Central de Abastos de Cúcuta - Cenbastos", executive: true },
      { name: "Sociedad Fiduciaria de Desarrollo Agropecuario - Fiduagraria", executive: true },
      { name: "Corporación Colombiana Internacional -CCI", executive: true },
    ]
  },
  {
    name: "Salud y Protección Social",
    institutions: [
      { name: "Ministerio de Salud y Protección Social", executive: true, rule: true },
      { name: "Superintendencia Nacional de Salud", executive: true },
      { name: "Fondo de Previsión Social del Congreso", executive: true },
      { name: "Fondo de Pasivo Social de Ferrocarriles Nacionales de Colombia", executive: true },
      { name: "Instituto Nacional de Salud - – Ins", executive: true },
      { name: "Instituto de Vigilancia de Medicamentos y Alimentos - Invima", executive: true },
      { name: "Centro Dermatológico Federico Lleras", executive: true },
      { name: "Sanatorio de Agua de Dios", executive: true },
      { name: "Sanatorio de Contratación", executive: true },
      { name: "Instituto Nacional de Cancerología", executive: true },
      { name: "Comisión de Regulación En Salud - Cres", executive: true },
      { name: "Instituto de Seguros Sociales Iss *En Liquidación", executive: true },
      { name: "Caja Nacional de Previsión Social Cajanal * (EN Liquidación)", executive: true },
      { name: "Empresa Social del Estado Antonio Nariño *En Liquidación", executive: true },
      { name: "Caja de Previsión Social de Comunicaciones - Caprecom", executive: true },
    ]
  },
  {
    name: "Trabajo",
    institutions: [
      { name: "Ministerio del Trabajo", executive: true, rule: true },
      { name: "Superintendencia del Subsidio Familiar", executive: true },
      { name: "Servicio Nacional de Aprendizaje", executive: true },
      { name: "Organizaciones Solidarias-Unidad Administrativa Especial de Organizaciones Solidarias", executive: true },
      { name: "Administradora Colombiana de Pensiones – Colpensiones", executive: true },
    ]
  },
  {
    name: "Minas y Energía",
    institutions: [
      { name: "Ministerio de Minas y Energia", executive: true },
      { name: "Comisión de Regulación de Energía y Gas -CREG", executive: true },
      { name: "Instituto de Planificación y Promoción de Soluciones Energéticas para las Zonas No Interconectadas -IPSE", executive: true },
      { name: "Unidad de Planeación Minero Energética - Upme", executive: true },
      { name: "Agencia Nacional de Hidrocarburos - Anh", executive: true },
      { name: "Agencia Nacional de Minas", executive: true },
      { name: "Servicio Geológico Colombiano", executive: true },
      { name: "Empresa Colombiana de Gas -ECOGAS * En Liquidación", executive: true },
      { name: "Ecopetrol S.A.", executive: true },
      { name: "Financiera Energética Nacional S.A.  - Fen", executive: true },
      { name: "Corporación Eléctrica de la Costa Atlantica  -CORELCA", executive: true },
      { name: "Interconexión Eléctrica I.S.A Esp ", executive: true },
      { name: "Empresa de Energía del Amazonas", executive: true },
      { name: "Empresa de Energía del San Andres, Providencia y Santa Catalina", executive: true },
      { name: "Empresas de Servicios Públicos Domiciliarios ", executive: true },
      { name: "Empresa Urrá S.A Esp ", executive: true },
      { name: "Empresa Colombiana de Generación Eléctrica - Isagen ", executive: true },
    ]
  },
  {
    name: "Comercio Industria y Turismo",
    institutions: [
      { name: "Ministerio de Comercio Industria y Turismo", executive: true, rule: true },
      { name: "Corporación para el Desarrollo de las Microempresas", executive: true },
      { name: "Superintendencia de Industria y Comercio", executive: true, rule: true },
      { name: "Superintendencia de Sociedades", executive: true },
      { name: "Instituto Nacional de Metrología  -INM ", executive: true },
      { name: "Junta Central de Contadores", executive: true },
      { name: "Artesanías de Colombia S.A.", executive: true },
      { name: "Fondo Nacional de Garantías", executive: true },
      { name: "Banco de Comercio Exterior S.A. Bancoldex", executive: true },
      { name: "Compañia de Financiamiento Comercial Ifi Leasing", executive: true },
      { name: "Fiduciaria Colombiana de Comercio - Fiducoldex", executive: true },
    ]
  },
  {
    name: "Educación Nacional",
    institutions: [
      { name: "Ministerio de Educación Nacional", executive: true },
      { name: "Instituto Nacional para Ciegos –INCI", executive: true },
      { name: "Instituto Nacional para Sordos – Insor", executive: true },
      { name: "Instituto Nacional de Formación Técnica Profesional de San Juan del Cesar", executive: true },
      { name: "Instituto Tolimense de Formación Técnica Profesional", executive: true },
      { name: "Instituto Técnico Central", executive: true },
      { name: "Instituto Técnico Nacional de Comercio Simón Rodríguez", executive: true },
      { name: "Instituto Nacional de Formación Técnica Profesional del Departamento de San Andrés, Providencia y Santa Catalina  Infotep , executive: truede San Andres"},
      { name: "Instituto Colombiano de Crédito Educativo y Estudios Técnicos En el Exterior “MARIANO Ospina Pérez” - Icetex", executive: true },
      { name: "Instituto Colombiano para el Fomento de la Educación Superior Icfes", executive: true },
      { name: "Fondo de Desarrollo para la Educación Superior -FODESEP", executive: true },
      { name: "Universidad Nacional de Colombia", executive: true },
      { name: "Universidad del Cauca", executive: true },
      { name: "Universidad de Caldas", executive: true },
      { name: "Universidad de Córdoba", executive: true },
      { name: "Universidad Pedagogica Nacional", executive: true },
      { name: "Universidad Pedagogica y Tecnologica de Colombia", executive: true },
      { name: "Universidad Popular del Cesar", executive: true },
      { name: "Universidad Colegio Mayor de Cundinamarca", executive: true },
      { name: "Universidad Surcolombiana", executive: true },
      { name: "Universidad Tecnologica del Choco -DIEGO L. Cordoba", executive: true },
      { name: "Universidad de Los Llanos Orientales", executive: true },
      { name: "Universidad Tecnologica de Pereira", executive: true },
      { name: "Universidad de la Amazonia", executive: true },
      { name: "Universidad del Pacífico", executive: true },
      { name: "Universidad Militar Nueva Granada", executive: true },
      { name: "Universidad Nacional Abierta y A Distancia Unad", executive: true },
    ]
  },
  {
    name: "Ambiente y Desarrollo Sostenible",
    institutions: [
      { name: "Ministerio de Ambiente y Desarrollo Sostenible", executive: true },
      { name: "Parques Nacionales Naturales de Colombia", executive: true },
      { name: "Autoridad Nacional de Licencias Ambientales –ANLA", executive: true },
      { name: "Instituto de Hidrología, Meteorología y Estudios Ambientales Ideam", executive: true },
      { name: "Inst. de Investigaciones Marinas y Costeras Jose Benito Vives de Andreis - Invemar", executive: true },
      { name: "Instituto de Investigación de Recursos Biológicos Alexander Von Humbold", executive: true },
      { name: "Instituto Amazónico de Investigaciones Científicas - Sinchi", executive: true },
      { name: "Instituto de Investigaciones Ambientales del Pacífico Jhon Von Neumann", executive: true },
      { name: "Fondo Nacional Ambiental -FONAM", executive: true },
      { name: "Instituto Nacional de Vivienda de Interés Social y Reforma Urbana Inurbe En Liquidación", executive: true },
      { name: "Corporaciones Autónomas Regionales", executive: true },
      { name: "Corporación Autónoma Regional del Río Grande de la Magdalena", executive: true },
      { name: "Corporación Autónoma Regional de la Defensa de la Meseta de Bucaramanga -CDMB", executive: true },
      { name: "Corporación Autónoma Regional de Boyacá - Corpoboyaca", executive: true },
      { name: "Corporación Autónoma Regional de Caldas – Corpocaldas", executive: true },
      { name: "Corporación Autónoma Regional del Canal del Dique – Cardique", executive: true },
      { name: "Corporación Autónoma Regional del Cauca -CRC", executive: true },
      { name: "Corporación Autónoma Regional del Centro de Antioquia - Corantioquia", executive: true },
      { name: "Corporación Autónoma Regional del Cesar- Corpocesar", executive: true },
      { name: "Corporación Autónoma Regional de Chivor - Corpochivor", executive: true },
      { name: "Corporación Autónoma Regional de Cundinamarca - Car", executive: true },
      { name: "Corporación Autónoma Regional del Guavio - Corpoguavio", executive: true },
      { name: "Corporación Autónoma Regional de la Frontera Nororiental - Corponor", executive: true },
      { name: "Corporación Autónoma Regional de la Guajira - Corpoguajira", executive: true },
      { name: "Corporación Autónoma Regional de la Orinoquía - Corporinoquia", executive: true },
      { name: "Corporación Autónoma Regional Cuencas de Los Ríos Negro y Nare - Cornare", executive: true },
      { name: "Corporación Autónoma Regional Valles de Sinú y San Jorge - Cvs", executive: true },
      { name: "Corporación Autónoma Regional del Alto Magdalena - Cam", executive: true },
      { name: "Corporación Autónoma Regional del Magdalena – Corpamag", executive: true },
      { name: "Corporación Autónoma Regional de Nariño - Corponariño", executive: true },
      { name: "Corporación Autónoma Regional del Quindío - Crq", executive: true },
      { name: "Corporación Autónoma Regional de Risaralda - Carder", executive: true },
      { name: "Corporación Autónoma Regional de Santander - Cas", executive: true },
      { name: "Corporación Autónoma Regional del Sur de Bolívar - Csb", executive: true },
      { name: "Corporación Autónoma Regional del Tolima - Cortolima", executive: true },
      { name: "Corporación Autónoma Regional del Valle del Cauca – Cvc", executive: true },
      { name: "Corporación Autónoma Regional de Sucre – Carsucre", executive: true },
      { name: "Corporación Autónoma Regional del Atlántico - Cra", executive: true },
      { name: "Corporación para el Desarrollo Sostenible del Archipiélago de San Andrés, Providencia y Santa Catalina-Coralina", executive: true },
      { name: "Corporación para el Desarrollo Sostenible del Chocó - Codechocó", executive: true },
      { name: "Corporación para el Desarrollo Sostenible de la Macarena – Cormacarena", executive: true },
      { name: "Corporación para el Desarrollo Sostenible de la Mojana y el San Jorge – Corpomojana", executive: true },
      { name: "Corporación para el Desarrollo Sostenible del Norte y del Oriente de la Amazonía – Cda", executive: true },
      { name: "Corporación para el Desarrollo Sostenible del Sur de la Amazonía - Corpoamazonía", executive: true },
      { name: "Corporación para el Desarrollo Sostenible del Uraba - Corpouraba", executive: true },
    ]
  },
  {
    name: "Vivienda Ciudad y Territorio",
    institutions: [
      { name: "Ministerio de Vivienda Ciudad y Territorio, executive: true"},
      { name: "Fondo Nacional de Vivienda - – Fonvivienda , executive: true"},
      { name: "Comisión de Regulación de Agua Potable  y Saneamiento Básica -CRA, executive: true"},
      { name: "Fondo Nacional de Ahorro -FNA, executive: true"},
    ]
  },
  {
    name: "Tecnologías de la Información y las Comunicaciones",
    institutions: [
      { name: "Ministerio de Tecnologías de la Información y las Comunicaciones", executive: true },
      { name: "Empresa de Telecomunicaciones del Caqueta S.A. Telecaquetä En Liquidación", executive: true },
      { name: "Empresa de Telecomunicaciones de Maicao Telemaicao En Liquidación", executive: true },
      { name: "Empresa de Telecomunicaciones de Calarcatelecalarca En Liquidación", executive: true },
      { name: "Empresa de Telecomunicaciones de Tulúa Teletuluá En Liquidación", executive: true },
      { name: "Empresa de Telecomunicaciones de Nariño Telenariño En Liquidación", executive: true },
      { name: "Empresa de Telecomunicaciones de Santa Rosa de Cabál Telesantarosa En Liquidación", executive: true },
      { name: "Empresa de Telecomunicaciones de Cartagena S.A. Telecartagena En Liquidación", executive: true },
      { name: "Empresa de Telecomunicaciones de Buenaventura S.A. Telebuenaventura En Liquidación", executive: true },
      { name: "Empresa de Telecomunicaciones de Armenia S.A. Telearmenia En Liquidación", executive: true },
      { name: "Empresa de Telecomunicaciones de Tolima S.A. Teletolima En Liquidación", executive: true },
      { name: "Empresa de Telecomunicaciones de Valledupar S.A. Teleupar En Liquidación", executive: true },
      { name: "Empresa de Telecomunicaciones de Huila Telehuila En Liquidación", executive: true },
      { name: "Empresa Nacional de Telecomunicaciones Telecom En Liquidación", executive: true },
      { name: "Empresa de Telecomunicaciones de Santa Marta Telesantamarta En Liquidación", executive: true },
      { name: "Comisión de Regulación de Comunicaciones - Crc", executive: true },
      { name: "Fondo de Tecnología de la Información y las Comunicaciones", executive: true },
      { name: "Agencia Nacional del Espectro -ANE", executive: true },
      { name: "Radio Televisión Nacional de Colombia - Rtvc", executive: true },
      { name: "Empresa Colombiana de Telecomunicaciones S.A. - En Liquidación", executive: true },
      { name: "Empresa Metropolitana de Telecomunicaciones Barranquilla – Metrotel.", executive: true },
      { name: "Empresa de Telecomunicaciones de Tequendama -TELETEQUENDAMA.", executive: true },
      { name: "Empresa de Telecomunicaciones de Bucaramanga -TELEBUCARAMANGA.", executive: true },
      { name: "Colombia Telecomunicaciones S.A Esp ", executive: true },
      { name: "Canal Regional del Caribe Telecaribe", executive: true },
      { name: "Servicios Postales Nacionales S.A.", executive: true },
    ]
  },
  {
    name: "Transporte",
    institutions: [
      { name: "Ministerio de Transporte", executive: true, rule: true },
      { name: "Superintendencia de Puertos y Transporte", executive: true },
      { name: "Agencia Nacional de Infraestructura - Ani", executive: true },
      { name: "Unidad Administrativa Especial  de Aeronatica Civil - Aerocivil", executive: true },
      { name: "Instituto Nacionalesde Vías - Invias ", executive: true },
    ]
  },
  {
    name: "Cultura",
    institutions: [
      { name: "Ministerio de Cultura", executive: true },
      { name: "Instituto Colombiano de Antropología E Historia", executive: true },
      { name: "Archivo General de la Nación", executive: true },
      { name: "Instituto Caro y Cuervo", executive: true },
    ]
  },
  {
    name: "Planeación",
    institutions: [
      { name: "Departamento Nacional de Planeación", executive: true },
      { name: "Agencia Nacional de Contratación Pública -COLOMBIA Compra Eficiente", executive: true },
      { name: "Superintendencia de Servicios Públicos Domiciliarios", executive: true },
      { name: "Fondo Nacional de Proyectos de Desarrollo - Fonade", executive: true },
    ]
  },
  {
    name: "Inteligencia Estratégica y Contrainteligencia",
    institutions: [
      { name: "Dirección Nacional de Inteligencia", executive: true },
      { name: "Fondo Rotatorio del Departamento Administrativo de Seguridad", executive: true },
    ]
  },
  {
    name: "Función Pública",
    institutions: [
      { name: "Departamento Administrativo de la Función Pública", executive: true },
      { name: "Escuela Superior de la Administración Pública -ESAP", executive: true },
    ]
  },
  {
    name: "Estadística",
    institutions: [
      { name: "Departamento Administrativo Nacional de Estadística", executive: true },
      { name: "Fondo Rotatorio del Dane – Fondane", executive: true },
      { name: "Instituto Geográfico Agustín Codazzi - Igac", executive: true },
    ]
  },
  {
    name: "Deporte",
    institutions: [
      { name: "Sector del Deporte, la Recreación, la Actividad Física y el Aprovechamiento del Tiempo Libre- Coldeportes", executive: true },
    ]
  },
  {
    name: "Ciencia, Tecnología E Innovación",
    institutions: [
      { name: "Departamento Administrativo de Ciencia, Tecnología E Innovación - Colciencias", executive: true },
    ]
  },
  {
    name: "Inclusión Social y Reconciliación",
    institutions: [
      { name: "Departamento Administrativo para la Prosperidad Social", executive: true },
      { name: "Instituto Colombiano de Bienestar Familiar", executive: true },
      { name: "Agencia Nacional para la Superación de la Pobreza Extrema", executive: true },
      { name: "Unidad para la Atención y Reparación Integral A las Víctimas", executive: true },
      { name: "Centro de Memoria Histórica", executive: true },
      { name: "Unidad Administrativa para la Consolidación Territorial", executive: true },
    ]
  },
  {
    name: "Organismos Autónomos",
    institutions: [
      { name: "Autoridad Nacional de Televisión - Antv", executive: true },
      { name: "Canal de Televisión Telecafe", executive: true },
      { name: "Canal de Televisión Telepacifico", executive: true },
      { name: "Canal de Televisión Teveandina Canal 13", executive: true },
      { name: "Canal de Televisión Teleantioquia", executive: true },
      { name: "Canal de Televisión Teleislas", executive: true },
      { name: "Canal de Televisión Regional de Oriente Teleoriente", executive: true },
      { name: "Comisión Nacional del Servicio Civil", executive: true },
      { name: "Banco de la República", executive: true },
      { name: "Comision Nacional de Televisión *En Liquidación ", executive: true },
    ]
  },
]
sectors.each do |s|
  sector = Sector.create(name: s[:name])
  s[:institutions].each do |i|
    Institution.create(name: i[:name], sector: sector, executive: i[:executive], rule: i[:rule])
  end
end
Kind.create([
  { name: "Circular", executive: true },
  { name: "Decreto", executive: true },
  { name: "Resolución", executive: true },
  { name: "Proyecto de Decreto", rule: true },
  { name: "Proyecto de Resolución", rule: true },
  { name: "Proyecto de Circular", rule: true },
  ])
