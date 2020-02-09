import asyncio

from databases import Database


async def main():
    database = Database('postgresql://postgres:postgres@localhost:5432/postgres')
    await database.connect()
    # await database.execute('SELECT 1 FROM __migrations;')
    rows = await database.fetch_all('''SELECT c.name, c.slug FROM _country c WHERE c.slug LIKE 'u%';''')
    import pdb; pdb.set_trace();
    print(rows)


loop = asyncio.get_event_loop()
loop.run_until_complete(main())
