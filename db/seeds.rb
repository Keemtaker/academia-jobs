# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "creating Jobs"

description = "Role Purpose
We are looking for an experienced Warehouse Supervisor to oversee and coordinate the daily warehousing activities.

Ultimately, you should be able to ensure that daily operations meet and exceed daily performance expectations and to increase the company’s overall market share.

Responsibilities

• Achieve high levels of customer satisfaction through excellence in receiving, identifying, dispatching and assuring quality of goods
 • Measure and report the effectiveness of warehousing activities and employees performance
 • Organize and maintain inventory and storage area
 • Ensure shipments’ and inventory transactions’ accuracy
 • Maintain items record, document necessary information and utilize reports to project warehouse status
 • Identify areas of improvement and establish innovative or adjust existing work procedures and practices

Requirements

• BSC Degree in logistics, supply chain management or business administration
 • Proven work experience as a Warehouse Supervisor
 • Knowledge of warehouse software packages and MS Office proficiency
 • Ability to input, retrieve and analyse data
 • Hands-on commitment to getting the job done"


job_list = [
  {title: "Postdoctoral Researcher in Biostatistics", description: description, employer: "Karolinska Institutet", country: "SWeden", city: "Stockholm"},
  {title: "PHD fellow", description: description, employer: "Arhus University", country: "Denmark", city: "Arhus"},
  {title: "Lecturer", description: description, employer: "University of Ghana", country: "Ghana", city: "Accra"}
]

Job.create!(job_list)
