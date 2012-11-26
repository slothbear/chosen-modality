modalities = [
  'Acupuncture',
  'Ayurveda',
  'Chinese Medicine',
  'Chiropractic',
  'Counseling/Coaching',
  'Diet/Nutrition',
  'Herbal remedies',
  'Holistic medicine',
  'Home remedies',
  'Homeopathy',
  'Massage',
  'Meditation',
  'Naturopathy',
  'Yoga',
  ]

modalities.each {|name| m = Modality.find_or_create_by_name(name, :standard => true);m.update_attributes(:standard => true)}