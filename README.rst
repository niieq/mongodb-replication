Mongo DB Master/Slave
========================

Implement Master and Slave replication in Mongo DB

Usage
-----

.. code-block:: bash
	
	$ vagrant up


	# To View Sample Data in slave

<<<<<<< HEAD
=======
	$ vagrant ssh slave

>>>>>>> 8b2b91cf8928e55f38cde6929969450f7bcf0397
	$ mongo 192.168.33.12

	$ set0:SECONDARY> rs.slaveOk()

<<<<<<< HEAD
	$ db.students.find()


	# To Back Up

	# SSh into slave

	$ vagrant ssh slave

	# Execute Backup Script
	$ ./backup.sh 

	NB: Backups should be done on replicas
=======
	$ db.students.find()
>>>>>>> 8b2b91cf8928e55f38cde6929969450f7bcf0397
