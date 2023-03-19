class SocialMediaModel {
  final String name;
  final String desc;
  final String profileImage;
  final Map<String, String> socialHandles;

  SocialMediaModel({
    required this.name,
    required this.desc,
    required this.profileImage,
    required this.socialHandles,
  });
}

List<SocialMediaModel> socialMediaData = [
  SocialMediaModel(
    name: "Shri Satnam Singh Sandhu",
    desc:
        "An eminent edupreneur, philanthropist, and visionary leader who is driven by the tenets of truthful living and service to humanity and has adopted education as his instrument to deliver equitable and affordable opportunities for all in the higher education landscape in India. His multiple endeavours towards giving back to society and nation-building are stark examples of leading with benevolence that resonate with both national and global leaders across the world.",
    socialHandles: {
      "twitter":
          "https://twitter.com/satnamsandhuchd?t=TprBYLN7XbTUlQYxvX7Xyg&s=09",
      "linkedin": "https://www.linkedin.com/in/satnam-singh-sandhu-03a67945"
    },
    profileImage: 'assets/social_media/sandhu.jpeg',
  ),
  SocialMediaModel(
      name: "NID Foundation",
      desc:
          "NID Foundation is a social, economic, and political outreach & engagement organization that works with the community, government, industry, and civil society stakeholders to generate reform-oriented intelligence in areas of domestic and international issues, governance, education, and environmental reforms, thereby supporting leaders and policymakers in making informed decisions. Our vision uses global challenges as props and set cutting-edge experiential learning tools to trigger this adaptive capacity.",
      profileImage: 'assets/social_media/nid.jpeg',
      socialHandles: {
        "linkedin": "https://www.linkedin.com/company/nid-foundation/",
        "twitter":
            "https://twitter.com/NID_Foundation?t=jrx9RLoIV-fPNG5v3E6apw&s=09"
      }),
  SocialMediaModel(
      name: "Chandigarh Welfare Trust",
      desc:
          "Chandigarh Welfare Trust is established and driven by the sole conviction of giving back to the city that has given us our lifeblood. With the aspiration of restituting this city as a model of development for other cities in India and elevating its standing among the cities of the world, Chandigarh Welfare Trust will restore, advance, and promote the glory of our city beautiful to the farthest corners of the world through impact oriented programs aimed at improving the status quo on every facet of the city.",
      profileImage: 'assets/social_media/cwt.jpeg',
      socialHandles: {
        "twitter":
            "https://twitter.com/ChdWelfareTrust?t=wUiu73J-FbjsGT3w02V2rA&s=09",
        "linkedin": "https://www.linkedin.com/company/chandigarh-welfare-trust/"
      }),
  SocialMediaModel(
      name: "Chandigarh University",
      desc:
          "Chandigarh University (CU) is a leading Indian Institution offering its students a unique amalgamation of professional and academic excellence. The University has been accredited with the prestigious A+ grade by the National Assessment and Accreditation Council (NAAC). Chandigarh University has become Youngest and the only private university in India to bag an A+ grade in the first cycle of the accreditation process and has also become the only state private university of Punjab to be accredited by NAAC.",
      profileImage: 'assets/social_media/cu.jpeg',
      socialHandles: {
        "twitter":
            "https://twitter.com/Chandigarh_uni?t=k9sldmJ6gBD0DZeGRfudjg&s=09",
        "linkedin": "https://www.linkedin.com/school/chandigarh-university/",
        "instagram":
            "https://instagram.com/chandigarhuniversity?igshid=YmMyMTA2M2Y="
      }),
];
