import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  <Widget>[
          Text(
            'Dashboard Screen',
            style: Get.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
        public static string baseDevAPI = "https://api.kayyen.com";
        public static string baseProdApi = "https://api.kayyen.com";
        public static string baseAPI = HelperGlobalFcn.GetProjectLevelDetail(baseDevAPI, baseProdApi);

        public static string baseHtmlLink = "https://www.kayyen.com/";
        public static string baseHtmlLinkUpload = "https://api.kayyen.com/Uploads/";
        public static string baseHtmlLinkAsset = "https://api.kayyen.com/Uploads/Assets/";
        public static string baseHtmlLinkAssetWeb = "https://api.kayyen.com/Uploads/KayyenAssests/WebMessages/";
        public static string baseHtmlLinkPayment = "https://api.kayyen.com/Uploads/PaymentGateway/";
        public static string baseHtmlLinkPayment2 = "https://pointofsaletech.com/KayyenPaymentGateway/";

        public static string txtCompanyTerms = "Kayyen -Terms -{X}.txt";
        public static string txtCompanyPrivacy = "Kayyen -Privacy -{X}.txt";
        public static string txtCompanyCancel = "Kayyen -Cancellation -{X}.txt";
        public static string txtCompanyRefund = "Kayyen -Refund -{X}.txt";
        public static string txtCompanyShipping = "Kayyen -Shipping -{X}.txt";
        public static string htmlPaymentBankDetail = "Web_PaymentBankDetail -{X}.html";
        public static string htmlWelcome = "Web_Welcome -{X}.html";
        public static string htmlOTP = "SPOTP{X}.htm"; //"Web_SendOTP -";
        public static string htmlSupportThank = "Support{X}.htm";  //Web_SupportThanks -{X}.html
        public static string htmlSupportInfo = "Web_SupportInfo -{X}.html";
        public static string htmlDeletionInfo = "Web_DeletionInfo -{X}.html";
        public static string htmlCompanyDisclaimer = "payment-disclaimer{X}.html";
        public static string htmlCompanyTnC = "payment-tnc{X}.html";


        //========== Trainer Profile APIs ==========================
        public static string companySignin = "/api/Companies/CompanySignInNew/";
        public static string companySignup = "/api/Companies/NewCompany";
        public static string companyUpdate = "/api/Companies/";
        public static string companyUpdateEmailStatus = "/api/Companies/EmailVerification/";
        public static string companyPassCreate = "/api/PasswordChange/CreatePassword/";
        public static string companyPassUpdate = "/api/PasswordChange/ChangePassword/";
        public static string companyIdByEmail = "/api/Companies/CompanyIdByEmail/";
        public static string companyIdByMobile = "/api/Companies/CompanyIdByMobile/";
		
		public static string companyAppVersions = "/api/CompanyAppStoreVersion/CompanyAppVersions/";
        public static string companyActionDeactive = "/api/CompanyAccountAction/CompanyDeactivation/";
        public static string companyActionDelete = "/api/CompanyAccountAction/CompanyDeletion/";
        public static string companyReasonDeactive = "/api/CompanyDeactivationReasons";
        public static string companyReasonDelete = "/api/CompanyDeletionReasons";

        public static string getWelcomePoint = "/api/WelcomeLoyaltyPoints/WelcomeCompanyPoints/";
        public static string getLoyaltyPointList = "/api/LoyaltyPoints/";
        public static string sendMobileOtp = "/api/SMS/SendOTP";

        public static string getGenderList = "/api/Genders/";
        public static string getBusinessServiceList = "/api/BusinessService/";
        public static string getBusinessServiceList2 = "/api/BusinessService/BusinessServicesByCountry/";
        public static string getBusinessTypeList = "/api/BusinessTypes/";
        public static string getAminitiesTypeList = "/api/Amenities/";

        public static string getCountryList = "/api/Countries/";
        public static string getNationalityList = "/api/Countries/NationalityList";
        public static string getStateList = "/api/Provinces/";
        public static string getCityList = "/api/Cities/";
        public static string getLanguageList = "/api/Language";
        public static string getAllLocation = "/api/Area/GetAreaCityCountry/";
        public static string getAllLocation2 = "/api/Cities/GetCityProvinceCountry/";
        public static string getAllLocation2b = "/api/Cities/GetCityProvinceCountryByName/";
        public static string getCountryLanguage = "/api/CountryLanguages";

        public static string getMobileExist = "/api/Companies/MobileAvailability/";
        public static string getEmailExist = "/api/Companies/CompanyEmailExist/";
        public static string getBusinessProfile = "/api/Companies/CompanyProfile/";
        public static string getBusinessProfile2 = "/api/Companies/CompanyProfile2/";
        public static string getBusinessPersonDesignation = "/api/Designation/";
        public static string getBusinessPackages = "/api/Packages/";

        public static string getBusinessGeneralInfo = "/api/CompanyProfile/GeneralInformation/";
        public static string getBusinessAddress = "/api/CompanyProfile/RegionInformation/";
        public static string getBusinessPerson = "/api/CompanyProfile/ContactPersonInfo/";
        public static string getBusinessTiming = "/api/CompanyProfile/TimingInformation/";
        public static string getBusinessPackage = "/api/CompanyProfile/PackageInformation/";
        public static string updateBusinessGeneralInfo = "/api/Companies/UpdateGeneralInformation/";
        public static string updateBusinessSocial = "/api/Companies/UpdateSocialMedia/";
        public static string updateBusinessAddress = "/api/Companies/UpdateAddress/";
        public static string updateBusinessPerson = "/api/Companies/UpdateContactPerson/";
        public static string updateBusinessTiming = "/api/Companies/UpdateTiming/";
        public static string urlBusinessTiming = "/api/CompanyTimings/";
        public static string updateBusinessLogo = "/api/Companies/CompanyLogo/";

        public static string getBusinessImages = "/api/CompanyImages/";
        public static string urlBusinessGroup = "/api/Groups/";
        public static string urlBusinessFormat = "/api/Format/";
        public static string urlBusinessArticle = "/api/Article/";
        public static string urlBusinessArticleFormat = "/api/ArticleFormat/";
        public static string urlBusinessArticleComposition = "/api/ArticleComposition/";
        public static string urlBusinessArticleOffer = "/api/ArticleOffer/";
        public static string urlBusinessOfferType = "/api/OfferType/";
        public static string urlBusinessOffer = "/api/Offer/";
        public static string urlBusinessOfferDow = "/api/OfferDow/";
        public static string urlDow = "/api/DayofWeek/";

        public static string urlStaffServiceProvider = "/api/ServiceProvider/";
        public static string urlStaffSPType = "/api/ServiceProviderType/";
        public static string urlStaffLanguage = "/api/ServiceProviderLanguage/";
        public static string urlStaffAvailabilityStatus = "/api/ServiceProviderAvailabilityStatus/";
        public static string urlStaffActiveStatus = "ServiceProviderActiveStatus/";

        public static string urlStaffProfileList = "/api/ServiceProvidersProfile/";
        public static string urlStaffProfile = "/api/ServiceProvidersGeneralInfo/";
        public static string urlStaffIdentity = "/api/ServiceProviderIdentities/";
        public static string urlStaffAllocation = "/api/ServiceProviderAllocations/";
        public static string urlStaffTiming = "/api/ServiceProviderDayDetails/";
        public static string urlStaffAppointment = "/api/ServiceProviderAppointments/";
        public static string urlStaffHoliday = "/api/ServiceProviderHolidays/";
        public static string urlStaffSkill = "/api/ServiceProviderSkills/";
        public static string urlStaffQualification = "/api/ServiceProviderQualification/";

        public static string urlCompDepartment = "/api/Department/";
        public static string urlCompSection = "/api/Section/";
        public static string urlCompDesignation = "/api/Designation/";

        public static string getPurchasedPackageList2 = "/api/CompanyPackages/CompanyPackageSubscriptionList/";
        public static string getActivePackage = "/api/Companies/CompanyActivePackage/";
        //public static string setPaidPackageNew = "/api/CompanyPackageSubscription";
        public static string setPaidPackageNew = "/api/CompanyPackages/SubscribePackage";

        public static string paymentTypes = "/api/CountryPaymentType/";
        public static string paymentInit = "/api/Companies/GetPaymentURL/";
        public static string urlCompanyPackagePayment = "/api/CompanyPackagePayment/";

        //public static string paymentPaymeeSandbox = "https://sandbox.paymee.tn/";
        //public static string paymentPaymeeLive = "https://app.paymee.tn/";
        //public static string paymentPaymeeInit = "api/v1/payments/create";
        //public static string paymentPaymeeWebview = "gateway/";
        public static string paymentPaymeeWebview2 = "gateway/loader?payment_token=";
        //public static string paymentPaymeeCheck = "api/v1/payments/";
        public static string paymentPaymeeServerInit = "/api/Companies/InitiatePaymeePayment";
        public static string paymentPaymeeServerCheck = "/api/Companies/ValidatePaymeePayment/";

        public static string paymentPayTabServerInit = "/api/Companies/InitiatePayTapsPayment";
        public static string paymentPayTabServerCheck = "/api/Companies/ValidatePayTabsPayment/";

        public static string urlAppointment = "/api/Appointment/";
        public static string getAppointList = "GetAppointmentWithFilterAPI/";
        public static string updateAppointReschedule = "RescheduleAppointment/";
        public static string updateAppointCancel = "CancelAppointment/";
        public static string updateAppointRating = "/api/CustomerRating/";

        public static string getDashboardData = "/api/CompanyDashBoard/";
        public static string getDashboardDataTimer = "/api/CompanyDashBoard/CompanyLuckyDrawCountDown/";
        public static string getNotification = "/api/Companies/GetNotifications/";
        public static string updateDeviceInfo = "/api/DeviceInfo";

        public static string getAdminPromoCodeList = "/api/PromoCode/PromoCodeListByCountry/";
        public static string getCompanyActivePromoCodeList = "/api/PromoCode/Activatedpromocodelistbycompany/";
        public static string activatePromoCode = "/api/PromoCode/ActivateCompanyPromoCode/";
        public static string deactivatePromoCode = "/api/PromoCode/DeactivateCompanyPromoCode/";
        public static string getRedeemedPromoCodeList = "/api/PromoCode/PromoCodeListByCompany/";

