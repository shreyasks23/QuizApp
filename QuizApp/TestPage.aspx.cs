﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuizApp
{
    public partial class Index : System.Web.UI.Page
    {
        private int Empathy, LeadershipPotential, Emotions, Confidence, Sportsmanship, Relationship, Ethics, FearOfFailure, Power, ManagingPressure, LackOfSelfConfidence, Aggressiveness, SelfEfficacy = 0;
        private string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null || Session["UserName"].ToString() == "user")
            {
                Response.Redirect("Index.aspx", true);
            }            
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                LblMsg.Visible = true;
                LblMsg.Text = "Question marked with * sign is not answered";
                LblMsg.Focus();
            }
            else
            {
                SqlConnection SCon = new SqlConnection(CS);
                SqlCommand SCmd;
                try
                {
                    //Question 1
                    if (RBLOpt1.SelectedIndex != -1)
                    {
                        Empathy += Convert.ToInt32(RBLOpt1.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt1.SelectedValue);
                    }

                    //Question 2
                    if (RBLOpt2.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt2.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt2.SelectedValue);
                    }
                   

                    //Question 3
                    if (RBLOpt3.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt3.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt3.SelectedValue);
                        Aggressiveness += Convert.ToInt32(RBLOpt3.SelectedValue);
                        SelfEfficacy += Convert.ToInt32(RBLOpt3.SelectedValue);
                    }                   

                    //Question 4
                    if (RBLOpt4.SelectedIndex != -1)
                    {
                        Empathy += Convert.ToInt32(RBLOpt4.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt4.SelectedValue);
                        Sportsmanship += Convert.ToInt32(RBLOpt4.SelectedValue);
                    }                   

                    //Question 5
                    if (RBLOpt5.SelectedIndex != -1)
                    {
                        Empathy += Convert.ToInt32(RBLOpt5.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt5.SelectedValue);
                        Sportsmanship += Convert.ToInt32(RBLOpt5.SelectedValue);
                    }
                    

                    //Question 6
                    if (RBLOpt6.SelectedIndex != -1)
                    {
                        Empathy += Convert.ToInt32(RBLOpt6.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt6.SelectedValue);
                        Relationship += Convert.ToInt32(RBLOpt6.SelectedValue);
                        FearOfFailure += Convert.ToInt32(RBLOpt6.SelectedValue);
                    }
                   
                    //Question 7
                    if (RBLOpt7.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt7.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt7.SelectedValue);
                        SelfEfficacy += Convert.ToInt32(RBLOpt7.SelectedValue);
                        Power += Convert.ToInt32(RBLOpt7.SelectedValue);
                    }                   

                    //Question 8

                    if (RBLOpt8.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt8.SelectedValue);
                        ManagingPressure += Convert.ToInt32(RBLOpt8.SelectedValue);
                        SelfEfficacy += Convert.ToInt32(RBLOpt8.SelectedValue);
                        Power += Convert.ToInt32(RBLOpt8.SelectedValue);
                    }

                    //Question 9

                    if (RBLOpt9.SelectedIndex != -1)
                    {
                        Empathy += Convert.ToInt32(RBLOpt9.SelectedValue);
                        Relationship += Convert.ToInt32(RBLOpt9.SelectedValue);
                        Sportsmanship += Convert.ToInt32(RBLOpt9.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt9.SelectedValue);
                    }

                    //Question 10

                    if (RBLOpt10.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt10.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt10.SelectedValue);
                        FearOfFailure += Convert.ToInt32(RBLOpt10.SelectedValue);
                    }
                    
                    //Question 11

                    if (RBLOpt11.SelectedIndex != -1)
                    {
                        LeadershipPotential += Convert.ToInt32(RBLOpt11.SelectedValue);
                        Confidence += Convert.ToInt32(RBLOpt11.SelectedValue);
                        Relationship += Convert.ToInt32(RBLOpt11.SelectedValue);
                        Ethics += Convert.ToInt32(RBLOpt11.SelectedValue);
                    }                   

                    //Question 12

                    if (RBLOpt12.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt12.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt12.SelectedValue);
                    }
                    //Question 13

                    if (RBLOpt13.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt13.SelectedValue);
                        SelfEfficacy += Convert.ToInt32(RBLOpt13.SelectedValue);
                        Power += Convert.ToInt32(RBLOpt13.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt13.SelectedValue);
                    }

                    //Question 14

                    if (RBLOpt14.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt14.SelectedValue);
                        SelfEfficacy += Convert.ToInt32(RBLOpt14.SelectedValue);
                        Power += Convert.ToInt32(RBLOpt14.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt14.SelectedValue);
                    }

                    //Question 15

                    if (RBLOpt15.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt15.SelectedValue);
                        Relationship += Convert.ToInt32(RBLOpt15.SelectedValue);
                        Ethics += Convert.ToInt32(RBLOpt15.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt15.SelectedValue);
                    }
                    //Question 16

                    if (RBLOpt16.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt16.SelectedValue);
                        Relationship += Convert.ToInt32(RBLOpt16.SelectedValue);
                        Ethics += Convert.ToInt32(RBLOpt16.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt16.SelectedValue);
                    }

                    //Question 17

                    if (RBLOpt17.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt17.SelectedValue);
                        Empathy += Convert.ToInt32(RBLOpt17.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt17.SelectedValue);

                    }

                    //Question 18

                    if (RBLOpt18.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt18.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt18.SelectedValue);
                        Ethics += Convert.ToInt32(RBLOpt18.SelectedValue);
                        SelfEfficacy += Convert.ToInt32(RBLOpt18.SelectedValue);

                    }

                    //Question 19

                    if (RBLOpt19.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt19.SelectedValue);
                        FearOfFailure += Convert.ToInt32(RBLOpt19.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt19.SelectedValue);

                    }

                    //Question 20

                    if (RBLOpt20.SelectedIndex != -1)
                    {
                        Relationship += Convert.ToInt32(RBLOpt20.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt20.SelectedValue);
                    }

                    //Question 21

                    if (RBLOpt21.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt21.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt21.SelectedValue);
                        Power += Convert.ToInt32(RBLOpt21.SelectedValue);
                        SelfEfficacy += Convert.ToInt32(RBLOpt21.SelectedValue);

                    }

                    //Question 22

                    if (RBLOpt22.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt22.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt22.SelectedValue);
                        Empathy += Convert.ToInt32(RBLOpt22.SelectedValue);

                    }                    

                    //Question 23

                    if (RBLOpt23.SelectedIndex != -1)
                    {
                        Power += Convert.ToInt32(RBLOpt23.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt23.SelectedValue);
                        Aggressiveness += Convert.ToInt32(RBLOpt23.SelectedValue);

                    }                    
                    //Question 24

                    if (RBLOpt24.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt24.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt24.SelectedValue);
                        FearOfFailure += Convert.ToInt32(RBLOpt24.SelectedValue);

                    }                    
                    //Question 25

                    if (RBLOpt25.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt25.SelectedValue);
                        FearOfFailure += Convert.ToInt32(RBLOpt25.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt25.SelectedValue);
                    }                    

                    //Question 26

                    if (RBLOpt26.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt26.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt26.SelectedValue);
                        Power += Convert.ToInt32(RBLOpt26.SelectedValue);
                        SelfEfficacy += Convert.ToInt32(RBLOpt26.SelectedValue);

                    }                    

                    //Question 27

                    if (RBLOpt27.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt27.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt27.SelectedValue);
                        FearOfFailure += Convert.ToInt32(RBLOpt27.SelectedValue);
                    }
                    
                    //Question 28

                    if (RBLOpt28.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt28.SelectedValue);
                        Empathy += Convert.ToInt32(RBLOpt28.SelectedValue);
                        FearOfFailure += Convert.ToInt32(RBLOpt28.SelectedValue);

                    }
                   
                    //Question 29

                    if (RBLOpt29.SelectedIndex != -1)
                    {
                        Relationship += Convert.ToInt32(RBLOpt29.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt29.SelectedValue);

                    }                    

                    //Question 30

                    if (RBLOpt30.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt30.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt30.SelectedValue);

                    }
                     
                    //Question 31

                    if  (RBLOpt31.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt31.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt31.SelectedValue);
                        Ethics += Convert.ToInt32(RBLOpt31.SelectedValue);
                        Relationship += Convert.ToInt32(RBLOpt31.SelectedValue);

                    }
                    
                    //Question 32

                    if  (RBLOpt32.SelectedIndex != -1)
                    {
                        Relationship += Convert.ToInt32(RBLOpt32.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt32.SelectedValue);

                    }
                    
                    //Question 33

                    if (RBLOpt33.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt33.SelectedValue);
                        FearOfFailure += Convert.ToInt32(RBLOpt33.SelectedValue);
                        Relationship += Convert.ToInt32(RBLOpt33.SelectedValue);

                    }
                     
                    //Question 34

                    if  (RBLOpt34.SelectedIndex != -1)
                    {
                        Relationship += Convert.ToInt32(RBLOpt34.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt34.SelectedValue);

                    }
                    
                    //Question 35

                    if (RBLOpt35.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt35.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt35.SelectedValue);

                    }
                    
                    //Question 36

                    if (RBLOpt36.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt35.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt35.SelectedValue);
                    }
                    
                    //Question 37

                    if(RBLOpt37.SelectedIndex != -1)
                    {
                        Empathy += Convert.ToInt32(RBLOpt37.SelectedValue);
                        Ethics += Convert.ToInt32(RBLOpt37.SelectedValue);

                    }
                    //Question 38

                    if (RBLOpt38.SelectedIndex != -1)
                    {
                        Relationship += Convert.ToInt32(RBLOpt38.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt38.SelectedValue);

                    } 

                    //Question 39

                    if (RBLOpt39.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt39.SelectedValue);
                        Aggressiveness += Convert.ToInt32(RBLOpt39.SelectedValue);
                        Power += Convert.ToInt32(RBLOpt39.SelectedValue);

                    }                   

                    //Question 40

                    if (RBLOpt40.SelectedIndex != -1)
                    {
                        Relationship += Convert.ToInt32(RBLOpt40.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt40.SelectedValue);

                    }
                   
                    //Question 41

                    if (RBLOpt41.SelectedIndex != -1)
                    {
                        Relationship += Convert.ToInt32(RBLOpt41.SelectedValue);
                        Empathy += Convert.ToInt32(RBLOpt41.SelectedValue);

                    }                    
                    //Question 42

                    if (RBLOpt42.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt42.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt42.SelectedValue);
                        Power += Convert.ToInt32(RBLOpt42.SelectedValue);
                        SelfEfficacy += Convert.ToInt32(RBLOpt42.SelectedValue);

                    }                   
                    //Question 43

                    if (RBLOpt43.SelectedIndex != -1)
                    {
                        Relationship += Convert.ToInt32(RBLOpt43.SelectedValue);
                        Empathy += Convert.ToInt32(RBLOpt43.SelectedValue);

                    }                    

                    //Question 44

                    if (RBLOpt44.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt44.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt44.SelectedValue);
                        FearOfFailure += Convert.ToInt32(RBLOpt44.SelectedValue);
                    }
                  
                    //Question 45

                    if (RBLOpt45.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt45.SelectedValue);
                        FearOfFailure += Convert.ToInt32(RBLOpt45.SelectedValue);
                        Relationship += Convert.ToInt32(RBLOpt45.SelectedValue);

                    }
                    
                    //Question 46

                    if (RBLOpt46.SelectedIndex != -1)
                    {
                        Relationship += Convert.ToInt32(RBLOpt46.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt46.SelectedValue);
                        FearOfFailure += Convert.ToInt32(RBLOpt46.SelectedValue);

                    }                   
                    //Question 47

                    if (RBLOpt47.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt47.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt47.SelectedValue);
                        Power += Convert.ToInt32(RBLOpt47.SelectedValue);
                        SelfEfficacy += Convert.ToInt32(RBLOpt47.SelectedValue);

                    }
                   
                    //Question 48

                    if (RBLOpt48.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt48.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt48.SelectedValue);

                    }
                  
                    //Question 49

                    if (RBLOpt49.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt49.SelectedValue);
                        Power += Convert.ToInt32(RBLOpt49.SelectedValue);
                        Aggressiveness += Convert.ToInt32(RBLOpt49.SelectedValue);

                    }
                    
                    //Question 50

                    if (RBLOpt50.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt50.SelectedValue);

                    }                    

                    //Question 51

                    if (RBLOpt51.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt51.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt51.SelectedValue);

                    }
                   
                    //Question 52

                    if (RBLOpt52.SelectedIndex != -1)
                    {
                        Power += Convert.ToInt32(RBLOpt52.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt52.SelectedValue);
                        Aggressiveness += Convert.ToInt32(RBLOpt52.SelectedValue);

                    }                  
                    //Question 53

                    if (RBLOpt53.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt53.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt53.SelectedValue);

                    }                    

                    //Question 54

                    if (RBLOpt54.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt54.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt54.SelectedValue);
                        Power += Convert.ToInt32(RBLOpt54.SelectedValue);
                        SelfEfficacy += Convert.ToInt32(RBLOpt54.SelectedValue);

                    }
                    
                    //Question 55

                    if (RBLOpt55.SelectedIndex != -1)
                    {
                        Empathy += Convert.ToInt32(RBLOpt55.SelectedValue);
                        Relationship += Convert.ToInt32(RBLOpt55.SelectedValue);
                        Sportsmanship += Convert.ToInt32(RBLOpt55.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt55.SelectedValue);

                    }
                    
                    //Question 56

                    if (RBLOpt56.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt56.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt56.SelectedValue);
                        Power += Convert.ToInt32(RBLOpt56.SelectedValue);
                        SelfEfficacy += Convert.ToInt32(RBLOpt56.SelectedValue);

                    }
                    
                    //Question 57

                    if (RBLOpt57.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt57.SelectedValue);
                        Power += Convert.ToInt32(RBLOpt57.SelectedValue);
                        ManagingPressure += Convert.ToInt32(RBLOpt57.SelectedValue);
                        SelfEfficacy += Convert.ToInt32(RBLOpt57.SelectedValue);
                    }
                  
                    //Question 58

                    if (RBLOpt58.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt58.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt58.SelectedValue);

                    }
                   
                    //Question 59

                    if (RBLOpt59.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt59.SelectedValue);
                    }                    

                    //Question 60

                    if (RBLOpt60.SelectedIndex != -1)
                    {
                        Empathy += Convert.ToInt32(RBLOpt60.SelectedValue);
                        Relationship += Convert.ToInt32(RBLOpt60.SelectedValue);

                    }
                   
                    //Question 61

                    if (RBLOpt61.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt61.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt61.SelectedValue);

                    }                    

                    //Question 62

                    if (RBLOpt62.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt62.SelectedValue);

                    }                   

                    //Question 63

                    if (RBLOpt63.SelectedIndex != -1)
                    {
                        Power += Convert.ToInt32(RBLOpt63.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt63.SelectedValue);
                        Aggressiveness += Convert.ToInt32(RBLOpt63.SelectedValue);

                    }
                    
                    //Question 64

                    if (RBLOpt64.SelectedIndex != -1)
                    {
                        Emotions += Convert.ToInt32(RBLOpt64.SelectedValue);

                    }                   

                    //Question 65

                    if (RBLOpt65.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt65.SelectedValue);
                        Empathy += Convert.ToInt32(RBLOpt65.SelectedValue);
                        FearOfFailure += Convert.ToInt32(RBLOpt65.SelectedValue);

                    }
                  
                    //Question 66

                    if (RBLOpt66.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt66.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt66.SelectedValue);

                    }
                    
                    //Question 67

                    if (RBLOpt67.SelectedIndex != -1)
                    {
                        Empathy += Convert.ToInt32(RBLOpt67.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt67.SelectedValue);
                        Power += Convert.ToInt32(RBLOpt67.SelectedValue);
                    }
                  
                    //Question 68

                    if (RBLOpt68.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt68.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt68.SelectedValue);

                    }
                    
                    //Question 69

                    if (RBLOpt69.SelectedIndex != -1)
                    {
                        Empathy += Convert.ToInt32(RBLOpt69.SelectedValue);
                        Relationship += Convert.ToInt32(RBLOpt69.SelectedValue);

                    }
                   
                    //Question 70

                    if (RBLOpt70.SelectedIndex != -1)
                    {
                        SelfEfficacy += Convert.ToInt32(RBLOpt70.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt70.SelectedValue);

                    }
                   
                    //Question 71

                    if (RBLOpt71.SelectedIndex != -1)
                    {
                        Relationship += Convert.ToInt32(RBLOpt71.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt71.SelectedValue);

                    }
                   
                    //Question 72

                    if (RBLOpt72.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt72.SelectedValue);
                        Aggressiveness += Convert.ToInt32(RBLOpt72.SelectedValue);
                        Power += Convert.ToInt32(RBLOpt72.SelectedValue);

                    }
                   
                    //Question 73

                    if (RBLOpt73.SelectedIndex != -1)
                    {
                        SelfEfficacy += Convert.ToInt32(RBLOpt73.SelectedValue);
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt73.SelectedValue);

                    }
                   
                    //Question 74

                    if (RBLOpt74.SelectedIndex != -1)
                    {
                        Empathy += Convert.ToInt32(RBLOpt74.SelectedValue);

                    }
                    
                    //Question 75

                    if (RBLOpt75.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt75.SelectedValue);
                        FearOfFailure += Convert.ToInt32(RBLOpt75.SelectedValue);
                        Relationship += Convert.ToInt32(RBLOpt75.SelectedValue);

                    }
                    
                    //Question 76

                    if (RBLOpt76.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt76.SelectedValue);
                        SelfEfficacy += Convert.ToInt32(RBLOpt76.SelectedValue);

                    }
                    
                    //Question 77

                    if (RBLOpt77.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt77.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt77.SelectedValue);
                    }
                   
                    //Question 78

                    if (RBLOpt78.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt78.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt78.SelectedValue);

                    }
                   
                    //Question 79

                    if (RBLOpt79.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt79.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt79.SelectedValue);

                    }
                    
                    //Question 80

                    if (RBLOpt80.SelectedIndex != -1)
                    {
                        Ethics += Convert.ToInt32(RBLOpt80.SelectedValue);
                        ManagingPressure += Convert.ToInt32(RBLOpt80.SelectedValue);

                    }
                   
                    //Question 81

                    if (RBLOpt81.SelectedIndex != -1)
                    {
                        Emotions += Convert.ToInt32(RBLOpt81.SelectedValue);

                    }
                   
                    //Question 82

                    if (RBLOpt82.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt82.SelectedValue);
                        FearOfFailure += Convert.ToInt32(RBLOpt82.SelectedValue);

                    }
                  
                    //Question 83

                    if (RBLOpt83.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt82.SelectedValue);
                        FearOfFailure += Convert.ToInt32(RBLOpt82.SelectedValue);
                    }
                    
                    //Question 84

                    if (RBLOpt84.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt84.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt84.SelectedValue);

                    }
                  
                    //Question 85

                    if (RBLOpt85.SelectedIndex != -1)
                    {
                        Emotions += Convert.ToInt32(RBLOpt85.SelectedValue);
                    }
                   
                    //Question 86

                    if (RBLOpt86.SelectedIndex != -1)
                    {
                        Empathy += Convert.ToInt32(RBLOpt86.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt86.SelectedValue);

                    }                   
                    //Question 87

                    if (RBLOpt87.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt87.SelectedValue);
                        Empathy += Convert.ToInt32(RBLOpt87.SelectedValue);
                        FearOfFailure += Convert.ToInt32(RBLOpt87.SelectedValue);

                    }
                   
                    //Question 88

                    if (RBLOpt88.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt88.SelectedValue);
                        LeadershipPotential += Convert.ToInt32(RBLOpt88.SelectedValue);

                    }
                   
                    //Question 89

                    if (RBLOpt89.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt89.SelectedValue);

                    }
                    
                    //Question 90

                    if (RBLOpt90.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt90.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt90.SelectedValue);
                        Ethics += Convert.ToInt32(RBLOpt90.SelectedValue);
                        SelfEfficacy += Convert.ToInt32(RBLOpt90.SelectedValue);

                    }                   
                    //Question 91

                    if (RBLOpt91.SelectedIndex != -1)
                    {
                        SelfEfficacy += Convert.ToInt32(RBLOpt91.SelectedValue);

                    }
                   
                    //Question 92

                    if (RBLOpt92.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt92.SelectedValue);

                    }
                     
                    //Question 93

                    if (RBLOpt93.SelectedIndex != -1)
                    {
                        Empathy += Convert.ToInt32(RBLOpt93.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt93.SelectedValue);

                    }
                   
                    //Question 94

                    if (RBLOpt94.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt94.SelectedValue);
                        FearOfFailure += Convert.ToInt32(RBLOpt94.SelectedValue);
                        Relationship += Convert.ToInt32(RBLOpt94.SelectedValue);

                    }                   
                    //Question 95

                    if (RBLOpt95.SelectedIndex != -1)
                    {
                        Power += Convert.ToInt32(RBLOpt95.SelectedValue);
                        Aggressiveness += Convert.ToInt32(RBLOpt95.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt95.SelectedValue);
                    }                    
                    //Question 96

                    if (RBLOpt96.SelectedIndex != -1)
                    {
                        Sportsmanship += Convert.ToInt32(RBLOpt96.SelectedValue);
                        Ethics += Convert.ToInt32(RBLOpt96.SelectedValue);

                    }                    
                    //Question 97

                    if (RBLOpt97.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt97.SelectedValue);
                    }
                    
                    //Question 98

                    if (RBLOpt98.SelectedIndex != -1)
                    {
                        LackOfSelfConfidence += Convert.ToInt32(RBLOpt98.SelectedValue);

                    }                    

                    //Question 99

                    if (RBLOpt99.SelectedIndex != -1)
                    {
                        Confidence += Convert.ToInt32(RBLOpt99.SelectedValue);
                        Emotions += Convert.ToInt32(RBLOpt99.SelectedValue);
                        Empathy += Convert.ToInt32(RBLOpt99.SelectedValue);

                    }                   
                    try
                    {
                        SCon.Open();
                        SCmd = new SqlCommand("UPDATE PsychometricResults SET Empathy = @Empathy , " +
                            "LeadershipPotential = @LeadershipPotential, Emotions = @Emotions , Confidence = @Confidence, SportsmanShip = @SportsmanShip , Relationship = @Relationship ," +
                            " Ethics = @Ethics , FearOfFailure = @FearOfFailure , Power = @Power , ManagingPressure = @ManagingPressure , LackOfSelfConfidence = @LackOfSelfConfidence , Aggressiveness = @Aggressiveness ," +
                            " SelfEfficacy = @SelfEfficacy, RecordStatus = 1 WHERE EmployeeID = @EmployeeID;", SCon);
                        SCmd.Parameters.AddWithValue("@Empathy", Convert.ToDecimal(Empathy / 20.0));
                        SCmd.Parameters.AddWithValue("@LeadershipPotential", Convert.ToDecimal(LeadershipPotential / 30.0));
                        SCmd.Parameters.AddWithValue("@Emotions", Convert.ToDecimal(Emotions / 34.0));
                        SCmd.Parameters.AddWithValue("@Confidence", Convert.ToDecimal(Confidence / 34.0));
                        SCmd.Parameters.AddWithValue("@SportsmanShip", Convert.ToDecimal(Sportsmanship / 4.0));
                        SCmd.Parameters.AddWithValue("@Relationship", Convert.ToDecimal(Relationship / 26.0));
                        SCmd.Parameters.AddWithValue("@Ethics", Convert.ToDecimal(Ethics / 8.0));
                        SCmd.Parameters.AddWithValue("@FearOfFailure", Convert.ToDecimal(FearOfFailure / 19.0));
                        SCmd.Parameters.AddWithValue("@Power", Convert.ToDecimal(Power / 18.0));
                        SCmd.Parameters.AddWithValue("@ManagingPressure", Convert.ToDecimal(ManagingPressure / 3.0));
                        SCmd.Parameters.AddWithValue("@LackOfSelfConfidence", Convert.ToDecimal(LackOfSelfConfidence / 31.0));
                        SCmd.Parameters.AddWithValue("@Aggressiveness", Convert.ToDecimal(Aggressiveness / 8.0));
                        SCmd.Parameters.AddWithValue("@SelfEfficacy", Convert.ToDecimal(SelfEfficacy / 17.0));
                        SCmd.Parameters.AddWithValue("@EmployeeID", Session["EmployeeID"]);
                        int count = SCmd.ExecuteNonQuery();
                        SCmd.Dispose();                     

                        if (count > 0)
                        {
                            Session["UserName"] = "user";
                            ClearCtrls();
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "success", "alert('Thank you for the submission'); window.location ='Index.aspx';", true);
                        }
                        else
                        {
                            throw new Exception("Insert not successfull");
                        }
                    }
                    catch (SqlException ex)
                    {
                        LblMsg.Visible = true;
                        LblMsg.Text = ex.Message.ToString();
                    }
                }
                catch (Exception ex)
                {
                    LblMsg.Visible = true;
                    LblMsg.Text = ex.Message.ToString();
                    
                }
                finally
                {
                    SCon.Close();
                }
            }
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            ClearCtrls();
        }


        #region Private Methods
        private void ClearCtrls()
        {
            RBLOpt1.SelectedIndex = -1;
            RBLOpt2.SelectedIndex = -1;
            RBLOpt3.SelectedIndex = -1;
            RBLOpt4.SelectedIndex = -1;
            RBLOpt5.SelectedIndex = -1;
            RBLOpt6.SelectedIndex = -1;
            RBLOpt7.SelectedIndex = -1;
            RBLOpt8.SelectedIndex = -1;
            RBLOpt9.SelectedIndex = -1;
            RBLOpt10.SelectedIndex = -1;
            RBLOpt11.SelectedIndex = -1;
            RBLOpt12.SelectedIndex = -1;
            RBLOpt13.SelectedIndex = -1;
            RBLOpt14.SelectedIndex = -1;
            RBLOpt15.SelectedIndex = -1;
            RBLOpt16.SelectedIndex = -1;
            RBLOpt17.SelectedIndex = -1;
            RBLOpt18.SelectedIndex = -1;
            RBLOpt19.SelectedIndex = -1;
            RBLOpt20.SelectedIndex = -1;
            RBLOpt21.SelectedIndex = -1;
            RBLOpt22.SelectedIndex = -1;
            RBLOpt23.SelectedIndex = -1;
            RBLOpt24.SelectedIndex = -1;
            RBLOpt25.SelectedIndex = -1;
            RBLOpt26.SelectedIndex = -1;
            RBLOpt27.SelectedIndex = -1;
            RBLOpt28.SelectedIndex = -1;
            RBLOpt29.SelectedIndex = -1;
            RBLOpt30.SelectedIndex = -1;
            RBLOpt31.SelectedIndex = -1;
            RBLOpt32.SelectedIndex = -1;
            RBLOpt33.SelectedIndex = -1;
            RBLOpt34.SelectedIndex = -1;
            RBLOpt35.SelectedIndex = -1;
            RBLOpt36.SelectedIndex = -1;
            RBLOpt37.SelectedIndex = -1;
            RBLOpt38.SelectedIndex = -1;
            RBLOpt39.SelectedIndex = -1;
            RBLOpt40.SelectedIndex = -1;
            RBLOpt41.SelectedIndex = -1;
            RBLOpt42.SelectedIndex = -1;
            RBLOpt43.SelectedIndex = -1;
            RBLOpt44.SelectedIndex = -1;
            RBLOpt45.SelectedIndex = -1;
            RBLOpt46.SelectedIndex = -1;
            RBLOpt47.SelectedIndex = -1;
            RBLOpt48.SelectedIndex = -1;
            RBLOpt49.SelectedIndex = -1;
            RBLOpt50.SelectedIndex = -1;
            RBLOpt51.SelectedIndex = -1;
            RBLOpt52.SelectedIndex = -1;
            RBLOpt53.SelectedIndex = -1;
            RBLOpt54.SelectedIndex = -1;
            RBLOpt55.SelectedIndex = -1;
            RBLOpt56.SelectedIndex = -1;
            RBLOpt57.SelectedIndex = -1;
            RBLOpt58.SelectedIndex = -1;
            RBLOpt59.SelectedIndex = -1;
            RBLOpt60.SelectedIndex = -1;
            RBLOpt61.SelectedIndex = -1;
            RBLOpt62.SelectedIndex = -1;
            RBLOpt63.SelectedIndex = -1;
            RBLOpt64.SelectedIndex = -1;
            RBLOpt65.SelectedIndex = -1;
            RBLOpt66.SelectedIndex = -1;
            RBLOpt67.SelectedIndex = -1;
            RBLOpt68.SelectedIndex = -1;
            RBLOpt69.SelectedIndex = -1;
            RBLOpt70.SelectedIndex = -1;
            RBLOpt71.SelectedIndex = -1;
            RBLOpt72.SelectedIndex = -1;
            RBLOpt73.SelectedIndex = -1;
            RBLOpt74.SelectedIndex = -1;
            RBLOpt75.SelectedIndex = -1;
            RBLOpt76.SelectedIndex = -1;
            RBLOpt77.SelectedIndex = -1;
            RBLOpt78.SelectedIndex = -1;
            RBLOpt79.SelectedIndex = -1;
            RBLOpt80.SelectedIndex = -1;
            RBLOpt81.SelectedIndex = -1;
            RBLOpt82.SelectedIndex = -1;
            RBLOpt83.SelectedIndex = -1;
            RBLOpt84.SelectedIndex = -1;
            RBLOpt85.SelectedIndex = -1;
            RBLOpt86.SelectedIndex = -1;
            RBLOpt87.SelectedIndex = -1;
            RBLOpt88.SelectedIndex = -1;
            RBLOpt89.SelectedIndex = -1;
            RBLOpt90.SelectedIndex = -1;
            RBLOpt91.SelectedIndex = -1;
            RBLOpt92.SelectedIndex = -1;
            RBLOpt93.SelectedIndex = -1;
            RBLOpt94.SelectedIndex = -1;
            RBLOpt95.SelectedIndex = -1;
            RBLOpt96.SelectedIndex = -1;
            RBLOpt97.SelectedIndex = -1;
            RBLOpt98.SelectedIndex = -1;
            RBLOpt99.SelectedIndex = -1;
            LblMsg.Visible = false;
        }
        #endregion
    }
}