call apoc.load.json("file:///templates.json") yield value as happening
merge (h:Happening{happening_id: happening.id})
SET h.templateName=happening.templateName
with h, happening.agendaItems AS items
unwind items AS i
merge (d:Drill{drill_id: i})
merge (h)-[:AGENDA_ITEMS]->(d)