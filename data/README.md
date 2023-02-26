## Data details

### Apple Watch / Healthkit workout data

The data for this app consists of workouts (either `walks` or `hikes`) collected on various Apple Watches over time.

This data is aggregated/consolidation via the Apple Health app and is (most easily) exported from this app on the iPhone.

From the Apple Health app, you tap the user in the top right corner of the main screen and then choose the `Export All Health Data` option. Depending
on the amount of health data that you have this export process can take quite a few minutes to generate the file `export.zip` (a zipped XML file containing various health data.)

### `healthkit-to-sqlite`

An excellent tool which transforms the zipped XML to a SQLite database is available from Simon Willison. Details are available from
[https://github.com/dogsheep/healthkit-to-sqlite](https://github.com/dogsheep/healthkit-to-sqlite).

Essentially you just need to pip install the tool and then convert it on the command line:

    $ pip install healthkit-to-sqlite

    $ healthkit-to-sqlite export.zip healthkit_db.sqlite
