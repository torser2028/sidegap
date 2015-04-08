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
