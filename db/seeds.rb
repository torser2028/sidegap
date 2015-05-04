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
  { name: 'Laboral Y Pensional' },
  { name: 'Administración Pública Y Estructura Del Estado' },
  { name: 'Infraestructura, Transporte Y Movilidad' },
  { name: 'Justicia, Política Criminal Y Penitenciaria' },
  { name: 'Honores, Conmemoraciones Y Asuntos Culturales' },
  { name: 'Actividad Financiera' },
  { name: 'Estampillas' },
  { name: 'Educación Y Deporte' },
  { name: 'Seguridad Y Defensa' },
  { name: 'Agropecuario' },
  { name: 'Familia Y Género' },
  { name: 'Serviciospúblicos' },
  { name: 'Impuestos Y Condiciones De Inversión' },
  { name: 'Tecnologias De La Información Y Las Comunicaciones' },
  { name: 'Vivienda' },
  { name: 'Relaciones Internacionales' },
  { name: 'Hidrocarburos, Minería Y Energía' },
  { name: 'Derechos Fundamentales Y Derechos Humanos' }
  ])
PoliticalParty.create([
  { name: 'Partido Liberal Colombiano' },
  { name: 'Partido Conservador Colombiano' },
  { name: 'Partido Opcion Ciudadana' },
  { name: 'Partido Cambio Radical' },
  { name: 'Partido Alianza Verde ' },
  { name: 'Movimiento Autoridades Indigenas De Colombia "Aico"' },
  { name: 'Partido Alianza Social Independiente "Asi"' },
  { name: 'Movimiento "Mira"' },
  { name: 'Partido Social De Unidad Nacional "Partido De La U"' },
  { name: 'Partido Polo Democratico Alternativo' },
  { name: 'Partido Union Patriotica "Up"' },
  { name: 'Centro Democratico' },
  { name: 'Movimiento Alternativo Indigena Y Social "Mais"' }
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
  { name: 'Norte De Santander' },
  { name: 'Putumayo' },
  { name: 'Quindío' },
  { name: 'Risaralda' },
  { name: 'San Andres Islas' },
  { name: 'Santander' },
  { name: 'Sucre' },
  { name: 'Tolima' },
  { name: 'Valle Del Cauca ' },
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
  { name: 'Ponencia De Comisiones Conjuntas' },
  { name: 'Debate Comisiones Conjuntas' },
  { name: 'Ponencia De Plenarias Simultaneas' },
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
  { name: 'Representante a La Cámara' },
  { name: 'Senador De La República' },
  { name: 'Senadora  De La República' }
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
    name: "Presidencia De La República",
    institutions: [
      { name: "Departamento Administrativo De La Presidencia De La Republica" },
      { name: "Agencia Colombiana Para La Reintegración De Personas Y Grupos Alzados En Armas" },
      { name: "Unidad Nacional Para La Gestión Del Riesgo De Desastres" },
      { name: "Empresa Nacional De Renovación Y Desarrollo Urbano, Virgilio Barco Vargas S.A.S." },
    ]
  },
  {
    name: "Interior",
    institutions: [
      { name: "Ministerio Del Interior" },
      { name: "Fondo Para La Participación Y El Fortalecimiento De La Democracia" },
      { name: "Corporación Nacional Para La Reconstrucción De La Cuenca Del Río Páez Y Zonas Aledañas Nasa Kiw E" },
      { name: "Unidad Nacional  De Protección" },
      { name: "Dirección Nacional De Derechos De Autor" },
      { name: "Imprenta Nacional De Colombia" },
    ]
  },
  {
    name: "Relaciones Exteriores",
    institutions: [
      { name: "Ministerio De Relaciones Exteriores" },
      { name: "Fondo Rotatorio Del Ministerio De Relaciones Exteriores" },
      { name: "Unidad Administrativa Migración Colombia" },
    ]
  },
  {
    name: "Hacienda Y Credito Público",
    institutions: [
      { name: "Ministerio De Hacienda Y Crédito Público" },
      { name: "Unidad De Proyección Normativa Y Estudios De Regulación Financiera -URF" },
      { name: "Agencia Del Inspector General De Tributos Y Rentas Y Contribuciones Parafiscales - Itrc" },
      { name: "Fondo De Adaptación" },
      { name: "Superintendencia Financiera De Colombia" },
      { name: "Superintendencia De Economia Solidaria" },
      { name: "Dirección De Impuestos Y Aduanas Nacionales Dian" },
      { name: "Contaduría General De La Nación" },
      { name: "Unidad Administrativa Especial De Información Y Análisis Financiero" },
      { name: "Unidad Administrativa De Gestión Pensional Y Contribuciones Parafiscalesde La Protección Social Ugpp" },
      { name: "Fondo De Garantías De Instituciones Financieras  Fogafin" },
      { name: "Fondo De Garantías De Entidades Cooperativas Financieras Y Ahorro Y Crédito Fogacoop" },
      { name: "Financiera De Desarrollo Territorial S.A Findeter " },
      { name: "Financiera De Desarrollo Nacional S.A" },
      { name: "La Previsora S.A. Compañía De Seguros S.A." },
      { name: "Administradora Del Monopolio Rentístico De Los Juegos De Suerte Y Azar -COLJUEGOS" },
      { name: "Central De Inversiones S.A. Cisa" },
      { name: "Fiduciaria Del Estado Sa * En Liquidación" },
      { name: "Banco Central Hipotecario Bch *EN Liquidación" },
      { name: "Banco Del Estado S.A *EN Liquidación" },
      { name: "Sociedad De Activos Especiales S.A.S. - Sae" },
      { name: "Fiduciaria La Previsora S.A." },
      { name: "Banco Cafetero Sa. *EN Liquidación" },
      { name: "Positiva Compañía De Seguros S.A" },
    ]
  },
  {
    name: "Justicia Y Del Derecho",
    institutions: [
      { name: "Ministerio De Justicia Y Del Derecho" },
      { name: "Instituto Nal. Penitenciario Y Carcelario Inpec" },
      { name: "Agencia Nacional De Defensa Jurídica Del Estado" },
      { name: "Unidad De Servicios Penitenciarios Y Carcelarios - Uspec" },
      { name: "Superintendencia De Notariado Y Registro" },
      { name: "Dirección Nacional De Estupefacientes * EN Liquidación" },
      { name: "Superintendencia De Vigilancia Y Seguridad Privada" },
    ]
  },
  {
    name: "Defensa Nacional",
    institutions: [
      { name: "Ministerio De Defensa Nacional" },
      { name: "Caja De Retiro De Las Fuerzas Militares" },
      { name: "Hospital Militar Central" },
      { name: "Defensa Civil Colombiana" },
      { name: "Caja De Sueldos De Retiro De La Policía Nacional" },
      { name: "Agencia Logística De Las Fuerzas Militares" },
      { name: "Fondo Rotatorio De La Policía Naciona" },
      { name: "Instituto De Casas Fiscales Del Ejército " },
      { name: "Club Militar" },
      { name: "Industria Militar - Indumil" },
      { name: "Caja Promotora De Vivienda Militar Y De Policia" },
      { name: "Servicio Aéreo A Territorios Nacionales - Satena" },
      { name: "Corporación De La Industria Aeronáutica Colombiana S.A. -  Ciac  S.A" },
      { name: "Sociedad Hotelera Tequendama Crowne Plaza" },
    ]
  },
  {
    name: "Agricultura Y Desarrollo Rural",
    institutions: [
      { name: "Ministerio De Agricultura Y Desarrollo Rural" },
      { name: "Unidad De Planificación De Tierras Rurales, Adecuación De Tierras Y Usos Agropecuarios -UPRA" },
      { name: "Instituto Colombiano Agropecuario - Ica" },
      { name: "Instituto Colombiano De Desarrollo Rural -INCODER" },
      { name: "Autoridad Nacional De Acuicultura Y Pesca Aunap" },
      { name: "Unidad Administrativa Especial De Gestión De Restitucióin De Tierras Despojadas - Uaegrtd" },
      { name: "Corporaciones De Abastos De Bogotá, S.A." },
      { name: "Caja De Compensación  Familiar Campesina - Comcaja" },
      { name: "Empresa Colombiana De Prodcutos Veterinarios S.A - Vecol S. " },
      { name: "Banco Agrario De Colombia  S.A. - Banagrario S. A." },
      { name: "Fondo Para El Financiamiento Del Sector Agropecuario - Finagro" },
      { name: "Almacenes Generales De Depósito De La Caja Agraria Y El Banco Ganadero -  Almagrario S.A " },
      { name: "Corporacion Colombiana De Investigación Agropecuaria - Corpoica" },
      { name: "Central De Abastos De Cúcuta - Cenbastos" },
      { name: "Sociedad Fiduciaria De Desarrollo Agropecuario - Fiduagraria" },
      { name: "Corporación Colombiana Internacional -CCI" },
    ]
  },
  {
    name: "Salud Y Protección Social",
    institutions: [
      { name: "Ministerio De Salud Y Protección Social" },
      { name: "Superintendencia Nacional De Salud" },
      { name: "Fondo De Previsión Social Del Congreso" },
      { name: "Fondo De Pasivo Social De Ferrocarriles Nacionales De Colombia" },
      { name: "Instituto Nacional De Salud - – Ins" },
      { name: "Instituto De Vigilancia De Medicamentos Y Alimentos - Invima" },
      { name: "Centro Dermatológico Federico Lleras" },
      { name: "Sanatorio De Agua De Dios" },
      { name: "Sanatorio De Contratación" },
      { name: "Instituto Nacional De Cancerología" },
      { name: "Comisión De Regulación En Salud - Cres" },
      { name: "Instituto De Seguros Sociales Iss *EN Liquidación" },
      { name: "Caja Nacional De Previsión Social Cajanal * (EN Liquidación)" },
      { name: "Empresa Social Del Estado Antonio Nariño *EN Liquidación" },
      { name: "Caja De Previsión Social De Comunicaciones - Caprecom" },
    ]
  },
  {
    name: "Trabajo",
    institutions: [
      { name: "Ministerio Del Trabajo" },
      { name: "Superintendencia Del Subsidio Familiar" },
      { name: "Servicio Nacional De Aprendizaje" },
      { name: "Organizaciones Solidarias-Unidad Administrativa Especial De Organizaciones Solidarias" },
      { name: "Administradora Colombiana De Pensiones – Colpensiones" },
    ]
  },
  {
    name: "Minas Y Energía",
    institutions: [
      { name: "Ministerio De Minas Y Energia" },
      { name: "Comisión De Regulación De Energía Y Gas -CREG" },
      { name: "Instituto De Planificación Y Promoción De Soluciones Energéticas Para Las Zonas No Interconectadas -IPSE" },
      { name: "Unidad De Planeación Minero Energética - Upme" },
      { name: "Agencia Nacional De Hidrocarburos - Anh" },
      { name: "Agencia Nacional De Minas" },
      { name: "Servicio Geológico Colombiano" },
      { name: "Empresa Colombiana De Gas -ECOGAS * En Liquidación" },
      { name: "Ecopetrol S.A." },
      { name: "Financiera Energética Nacional S.A.  - Fen" },
      { name: "Corporación Eléctrica De La Costa Atlantica  -CORELCA" },
      { name: "Interconexión Eléctrica I.S.A Esp " },
      { name: "Empresa De Energía Del Amazonas" },
      { name: "Empresa De Energía Del San Andres, Providencia Y Santa Catalina" },
      { name: "Empresas De Servicios Públicos Domiciliarios " },
      { name: "Empresa Urrá S.A Esp " },
      { name: "Empresa Colombiana De Generación Eléctrica - Isagen " },
    ]
  },
  {
    name: "Comercio Industria Y Turismo",
    institutions: [
      { name: "Ministerio De Comercio Industria Y Turismo" },
      { name: "Corporación Para El Desarrollo De Las Microempresas" },
      { name: "Superintendencia De Industria Y Comercio" },
      { name: "Superintendencia De Sociedades" },
      { name: "Instituto Nacional De Metrología  -INM " },
      { name: "Junta Central De Contadores" },
      { name: "Artesanías De Colombia S.A." },
      { name: "Fondo Nacional De Garantías" },
      { name: "Banco De Comercio Exterior S.A. Bancoldex" },
      { name: "Compañia De Financiamiento Comercial Ifi Leasing" },
      { name: "Fiduciaria Colombiana De Comercio - Fiducoldex" },
    ]
  },
  {
    name: "Educación Nacional",
    institutions: [
      { name: "Ministerio De Educación Nacional" },
      { name: "Instituto Nacional Para Ciegos –INCI" },
      { name: "Instituto Nacional Para Sordos – Insor" },
      { name: "Instituto Nacional De Formación Técnica Profesional De San Juan Del Cesar" },
      { name: "Instituto Tolimense De Formación Técnica Profesional" },
      { name: "Instituto Técnico Central" },
      { name: "Instituto Técnico Nacional De Comercio Simón Rodríguez" },
      { name: "Instituto Nacional De Formación Técnica Profesional Del Departamento De San Andrés, Providencia Y Santa Catalina  Infotep De San Andres"},
      { name: "Instituto Colombiano De Crédito Educativo Y Estudios Técnicos En El Exterior “MARIANO Ospina Pérez” - Icetex" },
      { name: "Instituto Colombiano Para El Fomento De La Educación Superior Icfes" },
      { name: "Fondo De Desarrollo Para La Educación Superior -FODESEP" },
      { name: "Universidad Nacional De Colombia" },
      { name: "Universidad Del Cauca" },
      { name: "Universidad De Caldas" },
      { name: "Universidad De Córdoba" },
      { name: "Universidad Pedagogica Nacional" },
      { name: "Universidad Pedagogica Y Tecnologica De Colombia" },
      { name: "Universidad Popular Del Cesar" },
      { name: "Universidad Colegio Mayor De Cundinamarca" },
      { name: "Universidad Surcolombiana" },
      { name: "Universidad Tecnologica Del Choco -DIEGO L. Cordoba" },
      { name: "Universidad De Los Llanos Orientales" },
      { name: "Universidad Tecnologica De Pereira" },
      { name: "Universidad De La Amazonia" },
      { name: "Universidad Del Pacífico" },
      { name: "Universidad Militar Nueva Granada" },
      { name: "Universidad Nacional Abierta Y A Distancia Unad" },
    ]
  },
  {
    name: "Ambiente Y Desarrollo Sostenible",
    institutions: [
      { name: "Ministerio De Ambiente Y Desarrollo Sostenible" },
      { name: "Parques Nacionales Naturales De Colombia" },
      { name: "Autoridad Nacional De Licencias Ambientales –ANLA" },
      { name: "Instituto De Hidrología, Meteorología Y Estudios Ambientales Ideam" },
      { name: "Inst. De Investigaciones Marinas Y Costeras Jose Benito Vives De Andreis - Invemar" },
      { name: "Instituto De Investigación De Recursos Biológicos Alexander Von Humbold" },
      { name: "Instituto Amazónico De Investigaciones Científicas - Sinchi" },
      { name: "Instituto De Investigaciones Ambientales Del Pacífico Jhon Von Neumann" },
      { name: "Fondo Nacional Ambiental -FONAM" },
      { name: "Instituto Nacional De Vivienda De Interés Social Y Reforma Urbana Inurbe En Liquidación" },
      { name: "Corporaciones Autónomas Regionales" },
      { name: "Corporación Autónoma Regional Del Río Grande De La Magdalena" },
      { name: "Corporación Autónoma Regional De La Defensa De La Meseta De Bucaramanga -CDMB" },
      { name: "Corporación Autónoma Regional De Boyacá - Corpoboyaca" },
      { name: "Corporación Autónoma Regional De Caldas – Corpocaldas" },
      { name: "Corporación Autónoma Regional Del Canal Del Dique – Cardique" },
      { name: "Corporación Autónoma Regional Del Cauca -CRC" },
      { name: "Corporación Autónoma Regional Del Centro De Antioquia - Corantioquia" },
      { name: "Corporación Autónoma Regional Del Cesar- Corpocesar" },
      { name: "Corporación Autónoma Regional De Chivor - Corpochivor" },
      { name: "Corporación Autónoma Regional De Cundinamarca - Car" },
      { name: "Corporación Autónoma Regional Del Guavio - Corpoguavio" },
      { name: "Corporación Autónoma Regional De La Frontera Nororiental - Corponor" },
      { name: "Corporación Autónoma Regional De La Guajira - Corpoguajira" },
      { name: "Corporación Autónoma Regional De La Orinoquía - Corporinoquia" },
      { name: "Corporación Autónoma Regional Cuencas De Los Ríos Negro Y Nare - Cornare" },
      { name: "Corporación Autónoma Regional Valles De Sinú Y San Jorge - Cvs" },
      { name: "Corporación Autónoma Regional Del Alto Magdalena - Cam" },
      { name: "Corporación Autónoma Regional Del Magdalena – Corpamag" },
      { name: "Corporación Autónoma Regional De Nariño - Corponariño" },
      { name: "Corporación Autónoma Regional Del Quindío - Crq" },
      { name: "Corporación Autónoma Regional De Risaralda - Carder" },
      { name: "Corporación Autónoma Regional De Santander - Cas" },
      { name: "Corporación Autónoma Regional Del Sur De Bolívar - Csb" },
      { name: "Corporación Autónoma Regional Del Tolima - Cortolima" },
      { name: "Corporación Autónoma Regional Del Valle Del Cauca – Cvc" },
      { name: "Corporación Autónoma Regional De Sucre – Carsucre" },
      { name: "Corporación Autónoma Regional Del Atlántico - Cra" },
      { name: "Corporación Para El Desarrollo Sostenible Del Archipiélago De San Andrés, Providencia Y Santa Catalina-Coralina" },
      { name: "Corporación Para El Desarrollo Sostenible Del Chocó - Codechocó" },
      { name: "Corporación Para El Desarrollo Sostenible De La Macarena – Cormacarena" },
      { name: "Corporación Para El Desarrollo Sostenible De La Mojana Y El San Jorge – Corpomojana" },
      { name: "Corporación Para El Desarrollo Sostenible Del Norte Y Del Oriente De La Amazonía – Cda" },
      { name: "Corporación Para El Desarrollo Sostenible Del Sur De La Amazonía - Corpoamazonía" },
      { name: "Corporación Para El Desarrollo Sostenible Del Uraba - Corpouraba" },
    ]
  },
  {
    name: "Vivienda Ciudad Y Territorio",
    institutions: [
      { name: "Ministerio De Vivienda Ciudad Y Territorio"},
      { name: "Fondo Nacional De Vivienda - – Fonvivienda "},
      { name: "Comisión De Regulación De Agua Potable  Y Saneamiento Básica -CRA"},
      { name: "Fondo Nacional De Ahorro -FNA"},
    ]
  },
  {
    name: "Tecnologías De La Información Y Las Comunicaciones",
    institutions: [
      { name: "Ministerio De Tecnologías De La Información Y Las Comunicaciones" },
      { name: "Empresa De Telecomunicaciones Del Caqueta S.A. Telecaquetä En Liquidación" },
      { name: "Empresa De Telecomunicaciones De Maicao Telemaicao En Liquidación" },
      { name: "Empresa De Telecomunicaciones De Calarcatelecalarca En Liquidación" },
      { name: "Empresa De Telecomunicaciones De Tulúa Teletuluá En Liquidación" },
      { name: "Empresa De Telecomunicaciones De Nariño Telenariño En Liquidación" },
      { name: "Empresa De Telecomunicaciones De Santa Rosa De Cabál Telesantarosa En Liquidación" },
      { name: "Empresa De Telecomunicaciones De Cartagena S.A. Telecartagena En Liquidación" },
      { name: "Empresa De Telecomunicaciones De Buenaventura S.A. Telebuenaventura En Liquidación" },
      { name: "Empresa De Telecomunicaciones De Armenia S.A. Telearmenia En Liquidación" },
      { name: "Empresa De Telecomunicaciones De Tolima S.A. Teletolima En Liquidación" },
      { name: "Empresa De Telecomunicaciones De Valledupar S.A. Teleupar En Liquidación" },
      { name: "Empresa De Telecomunicaciones De Huila Telehuila En Liquidación" },
      { name: "Empresa Nacional De Telecomunicaciones Telecom En Liquidación" },
      { name: "Empresa De Telecomunicaciones De Santa Marta Telesantamarta En Liquidación" },
      { name: "Comisión De Regulación De Comunicaciones - Crc" },
      { name: "Fondo De Tecnología De La Información Y Las Comunicaciones" },
      { name: "Agencia Nacional Del Espectro -ANE" },
      { name: "Radio Televisión Nacional De Colombia - Rtvc" },
      { name: "Empresa Colombiana De Telecomunicaciones S.A. - En Liquidación" },
      { name: "Empresa Metropolitana De Telecomunicaciones Barranquilla – Metrotel." },
      { name: "Empresa De Telecomunicaciones De Tequendama -TELETEQUENDAMA." },
      { name: "Empresa De Telecomunicaciones De Bucaramanga -TELEBUCARAMANGA." },
      { name: "Colombia Telecomunicaciones S.A Esp " },
      { name: "Canal Regional Del Caribe Telecaribe" },
      { name: "Servicios Postales Nacionales S.A." },
    ]
  },
  {
    name: "Transporte",
    institutions: [
      { name: "Ministerio De Transporte" },
      { name: "Superintendencia De Puertos Y Transporte" },
      { name: "Agencia Nacional De Infraestructura - Ani" },
      { name: "Unidad Administrativa Especial  De Aeronatica Civil - Aerocivil" },
      { name: "Instituto Nacionalesde Vías - Invias " },
    ]
  },
  {
    name: "Cultura",
    institutions: [
      { name: "Ministerio De Cultura" },
      { name: "Instituto Colombiano De Antropología E Historia" },
      { name: "Archivo General De La Nación" },
      { name: "Instituto Caro Y Cuervo" },
    ]
  },
  {
    name: "Planeación",
    institutions: [
      { name: "Departamento Nacional De Planeación" },
      { name: "Agencia Nacional De Contratación Pública -COLOMBIA Compra Eficiente" },
      { name: "Superintendencia De Servicios Públicos Domiciliarios" },
      { name: "Fondo Nacional De Proyectos De Desarrollo - Fonade" },
    ]
  },
  {
    name: "Inteligencia Estratégica Y Contrainteligencia",
    institutions: [
      { name: "Dirección Nacional De Inteligencia" },
      { name: "Fondo Rotatorio Del Departamento Administrativo De Seguridad" },
    ]
  },
  {
    name: "Función Pública",
    institutions: [
      { name: "Departamento Administrativo De La Función Pública" },
      { name: "Escuela Superior De La Administración Pública -ESAP" },
    ]
  },
  {
    name: "Estadística",
    institutions: [
      { name: "Departamento Administrativo Nacional De Estadística" },
      { name: "Fondo Rotatorio Del Dane – Fondane" },
      { name: "Instituto Geográfico Agustín Codazzi - Igac" },
    ]
  },
  {
    name: "Deporte",
    institutions: [
      { name: "Sector Del Deporte, La Recreación, La Actividad Física Y El Aprovechamiento Del Tiempo Libre- Coldeportes" },
    ]
  },
  {
    name: "Ciencia, Tecnología E Innovación",
    institutions: [
      { name: "Departamento Administrativo De Ciencia, Tecnología E Innovación - Colciencias" },
    ]
  },
  {
    name: "Inclusión Social Y Reconciliación",
    institutions: [
      { name: "Departamento Administrativo Para La Prosperidad Social" },
      { name: "Instituto Colombiano De Bienestar Familiar" },
      { name: "Agencia Nacional Para La Superación De La Pobreza Extrema" },
      { name: "Unidad Para La Atención Y Reparación Integral A Las Víctimas" },
      { name: "Centro De Memoria Histórica" },
      { name: "Unidad Administrativa Para La Consolidación Territorial" },
    ]
  },
  {
    name: "Organismos Autónomos",
    institutions: [
      { name: "Autoridad Nacional De Televisión - Antv" },
      { name: "Canal De Televisión Telecafe" },
      { name: "Canal De Televisión Telepacifico" },
      { name: "Canal De Televisión Teveandina Canal 13" },
      { name: "Canal De Televisión Teleantioquia" },
      { name: "Canal De Televisión Teleislas" },
      { name: "Canal De Televisión Regional De Oriente Teleoriente" },
      { name: "Comisión Nacional Del Servicio Civil" },
      { name: "Banco De La República" },
      { name: "Comision Nacional De Televisión *EN Liquidación " },
    ]
  },
]
sectors.each do |s|
  sector = Sector.create(name: s[:name])
  s[:institutions].each do |i|
    Institution.create(name: i[:name], sector: sector)
  end
end
