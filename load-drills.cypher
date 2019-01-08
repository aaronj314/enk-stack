call apoc.load.json("file:///drills.json") yield value as drill
merge (d:Drill{drill_id: drill.id})
SET d.type=drill.drillType, d.name=drill.drillName