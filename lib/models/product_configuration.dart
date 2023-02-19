class ResponseModel{
  String? name;
  String? message;
  int? code;
  List<ResponseData>? data;
  Pagination? pagination;

  ResponseModel(
      {this.name, this.message, this.code, this.data, this.pagination});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    message = json['message'];
    code = json['code'];
    if (json['data'] != null) {
    //  data = new List<Data>();
      json['data'].forEach((v) {
        data!.add(new ResponseData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination?.toJson();
    }
    return data;
  }
}

class ResponseData {
  int? id;
  int? userId;
  String? title;
  String? content;
  String? keywords;
  int? createdAt;
  int? updatedAt;

  ResponseData(
      {this.id,
      this.userId,
      this.title,
      this.content,
      this.keywords,
      this.createdAt,
      this.updatedAt});

  ResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    content = json['content'];
    keywords = json['keywords'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['keywords'] = this.keywords;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Pagination {
  int? pageSize;
  int? totalCount;
  int? pageCount;
  int? currentPage;

  Pagination(
      {this.pageSize, this.totalCount, this.pageCount, this.currentPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    pageSize = json['pageSize'];
    totalCount = json['totalCount'];
    pageCount = json['pageCount'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageSize'] = this.pageSize;
    data['totalCount'] = this.totalCount;
    data['pageCount'] = this.pageCount;
    data['currentPage'] = this.currentPage;
    return data;
  }
}

class ProductConfiguration {
  int? productConfigurationId;
  int? productId;
  int? productServiceId;
  int? referingProductServiceId;
  List<ProductConfigurableColumns>? productConfigurableColumns;
  String? apiCall;
  String? redirect;
  String? batch;
  dynamic? displayToCustomer;
  int? step;
  bool? storeInDb;
  // String? createdDate;
  dynamic? modifiedDate;
  // String? createdBy;
  dynamic? modifiedBy;
  List<ApiConfig>? apiConfig;

  ProductConfiguration(
      {this.productConfigurationId,
      this.productId,
      this.productServiceId,
      this.referingProductServiceId,
      this.productConfigurableColumns,
      this.apiCall,
      this.redirect,
      this.batch,
      this.displayToCustomer,
      this.step,
      this.storeInDb,
      // this.createdDate,
      this.modifiedDate,
      // this.createdBy,
      this.modifiedBy,
      this.apiConfig});

  ProductConfiguration.fromJson(Map<String, dynamic> json) {
    productConfigurationId = json['productConfigurationId'];
    productId = json['productId'];
    productServiceId = json['productServiceId'];
    referingProductServiceId = json['referingProductServiceId'];
    if (json['productConfigurableColumns'] != null) {
      productConfigurableColumns = <ProductConfigurableColumns>[];
      json['productConfigurableColumns'].forEach((v) {
        productConfigurableColumns!
            .add(new ProductConfigurableColumns.fromJson(v));
      });
    }
    apiCall = json['apiCall'];
    redirect = json['redirect'];
    batch = json['batch'];
    displayToCustomer = json['displayToCustomer'];
    step = json['step'];
    storeInDb = json['storeInDb'];
    // createdDate = json['createdDate'];
    modifiedDate = json['modifiedDate'];
    // createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
    if (json['apiConfig'] != null) {
      apiConfig = <ApiConfig>[];
      json['apiConfig'].forEach((v) {
        apiConfig!.add(new ApiConfig.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productConfigurationId'] = this.productConfigurationId;
    data['productId'] = this.productId;
    data['productServiceId'] = this.productServiceId;
    data['referingProductServiceId'] = this.referingProductServiceId;
    if (this.productConfigurableColumns != null) {
      data['productConfigurableColumns'] =
          this.productConfigurableColumns!.map((v) => v.toJson()).toList();
    }
    data['apiCall'] = this.apiCall;
    data['redirect'] = this.redirect;
    data['batch'] = this.batch;
    data['displayToCustomer'] = this.displayToCustomer;
    data['step'] = this.step;
    data['storeInDb'] = this.storeInDb;
    // data['createdDate'] = this.createdDate;
    data['modifiedDate'] = this.modifiedDate;
    // data['createdBy'] = this.createdBy;
    data['modifiedBy'] = this.modifiedBy;
    if (this.apiConfig != null) {
      data['apiConfig'] = this.apiConfig!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductConfigurableColumns {
  List<Field>? data;
  String? step;
  List<String>? store;
  StepDetails? stepDetails;
  List<String>? pathParameter;
  List<String>? queryParameter;
  Map<String, dynamic>? requestParameter;
  ResponseHandling? responseHandling;

  ProductConfigurableColumns(
      {this.data,
      this.step,
      this.store,
      this.stepDetails,
      this.pathParameter,
      this.queryParameter,
      this.responseHandling,
      this.requestParameter});

  ProductConfigurableColumns.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Field>[];
      json['data'].forEach((v) {
        data!.add(new Field.fromJson(v));
      });
    }
    step = json['step'];
    store = json['store'].cast<String>();
    stepDetails = json['stepDetails'] != null
        ? new StepDetails.fromJson(json['stepDetails'])
        : null;
    if (json['pathParameter'] != null) {
      pathParameter = <String>[];
      json['pathParameter'].forEach((v) {
        pathParameter!.add(v.toString());
      });
    }
    if (json['queryParameter'] != null) {
      queryParameter = <String>[];
      json['queryParameter'].forEach((v) {
        queryParameter!.add(v.toString());
      });
    }
    requestParameter = json['requestParameter'];
    responseHandling = json['responseHandling'] != null
        ? ResponseHandling.fromJson(json['responseHandling'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['step'] = this.step;
    data['store'] = this.store;
    if (this.stepDetails != null) {
      data['stepDetails'] = this.stepDetails!.toJson();
    }
    if (this.pathParameter != null) {
      data['pathParameter'] =
          this.pathParameter!.map((v) => v.toString()).toList();
    }
    if (this.queryParameter != null) {
      data['queryParameter'] =
          this.queryParameter!.map((v) => v.toString()).toList();
    }
    if (this.responseHandling != null) {
      data['responseHandling'] = this.responseHandling!.toJson();
    }
    data['requestParameter'] = this.requestParameter;
    return data;
  }
}

class Field {
  int? id;
  String? field;
  String? regEx;
  String? table;
  bool? editable;
  String? linkText;
  String? linktype;
  String? maxValue;
  String? minValue;
  String? textSize;
  String? condition;
  String? fieldName;
  String? formField;
  bool? mandatory;
  String? maskInput;
  String? timerText;
  String? actionStep;
  String? textColour;
  String? timerLimit;
  String? validation;
  String? calculation;
  String? displayName;
  String? dropdownKey;
  String? dynamicList;
  String? fieldLength;
  String? imageOption;
  String? dataSetValue;
  String? symbol;
  String? dynamicRegEx;
  String? textPosition;
  String? chipTextColor;
  String? dropdownValue;
  String? textHierarchy;
  String? textTransform;
  bool? visibleToUser;
  String? dynamicFieldId;
  bool? isDynamicArray;
  bool? isEncrypted;
  String? dropdownItemType;
  String? dynamicValidation;
  bool? conditionalRendering;
  String? groupId;
  String? labelToTextbox;

  Field(
      {this.id,
      this.field,
      this.regEx,
      this.table,
      this.editable,
      this.linkText,
      this.linktype,
      this.maxValue,
      this.minValue,
      this.textSize,
      this.condition,
      this.fieldName,
      this.formField,
      this.symbol,
      this.mandatory,
      this.maskInput,
      this.timerText,
      this.actionStep,
      this.textColour,
      this.timerLimit,
      this.validation,
      this.calculation,
      this.displayName,
      this.dropdownKey,
      this.dynamicList,
      this.fieldLength,
      this.imageOption,
      this.dataSetValue,
      this.dynamicRegEx,
      this.textPosition,
      this.chipTextColor,
      this.dropdownValue,
      this.textHierarchy,
      this.textTransform,
      this.visibleToUser,
      this.dynamicFieldId,
      this.isDynamicArray,
      this.groupId,
      this.isEncrypted,
      this.dropdownItemType,
      this.dynamicValidation,
      this.conditionalRendering,
      this.labelToTextbox});

  Field.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    field = json['field'];
    regEx = json['regEx'];
    table = json['table'];
    editable = json['editable'];
    linkText = json['linkText'];
    linktype = json['linktype'];
    maxValue = json['maxValue'];
    minValue = json['minValue'];
    textSize = json['textSize'];
    condition = json['condition'];
    fieldName = json['fieldName'];
    formField = json['formField'];
    mandatory = json['mandatory'];
    maskInput = json['maskInput'];
    symbol = json['symbol'];
    timerText = json['timerText'];
    groupId = json['groupId'];
    actionStep = json['actionStep'];
    textColour = json['textColour'];
    timerLimit = json['timerLimit'];
    validation = json['validation'];
    calculation = json['calculation'];
    displayName = json['displayName'];
    dropdownKey = json['dropdownKey'];
    dynamicList = json['dynamicList'];
    fieldLength = json['fieldLength'];
    imageOption = json['imageOption'];
    dataSetValue = json['dataSetValue'];
    dynamicRegEx = json['dynamicRegEx'];
    textPosition = json['textPosition'];
    chipTextColor = json['chipTextColor'];
    dropdownValue = json['dropdownValue'];
    textHierarchy = json['textHierarchy'];
    textTransform = json['textTransform'];
    visibleToUser = json['visibleToUser'];
    dynamicFieldId = json['dynamicFieldId'];
    isDynamicArray = json['isDynamicArray'];
    isEncrypted = json['isEncrypted'];
    dropdownItemType = json['dropdownItemType'];
    dynamicValidation = json['dynamicValidation'];
    conditionalRendering = json['conditionalRendering'];
    labelToTextbox = json['labelToTextbox'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['field'] = this.field;
    data['regEx'] = this.regEx;
    data['table'] = this.table;
    data['editable'] = this.editable;
    data['linkText'] = this.linkText;
    data['linktype'] = this.linktype;
    data['maxValue'] = this.maxValue;
    data['minValue'] = this.minValue;
    data['textSize'] = this.textSize;
    data['condition'] = this.condition;
    data['fieldName'] = this.fieldName;
    data['formField'] = this.formField;
    data['mandatory'] = this.mandatory;
    data['maskInput'] = this.maskInput;
    data['timerText'] = this.timerText;
    data['symbol'] = this.symbol;
    data['groupId'] = this.groupId;
    data['actionStep'] = this.actionStep;
    data['textColour'] = this.textColour;
    data['timerLimit'] = this.timerLimit;
    data['validation'] = this.validation;
    data['calculation'] = this.calculation;
    data['displayName'] = this.displayName;
    data['dropdownKey'] = this.dropdownKey;
    data['dynamicList'] = this.dynamicList;
    data['fieldLength'] = this.fieldLength;
    data['imageOption'] = this.imageOption;
    data['dataSetValue'] = this.dataSetValue;
    data['dynamicRegEx'] = this.dynamicRegEx;
    data['textPosition'] = this.textPosition;
    data['chipTextColor'] = this.chipTextColor;
    data['dropdownValue'] = this.dropdownValue;
    data['textHierarchy'] = this.textHierarchy;
    data['textTransform'] = this.textTransform;
    data['visibleToUser'] = this.visibleToUser;
    data['dynamicFieldId'] = this.dynamicFieldId;
    data['isDynamicArray'] = this.isDynamicArray;
    data['isEncrypted'] = this.isEncrypted;
    data['dropdownItemType'] = this.dropdownItemType;
    data['dynamicValidation'] = this.dynamicValidation;
    data['conditionalRendering'] = this.conditionalRendering;
    data['labelToTextbox'] = this.labelToTextbox;
    return data;
  }
}

class StepDetails {
  String? layout;
  String? stepTitle;
  String? subLayout;
  String? listOption;
  String? failureFlow;
  String? multiLayout;
  String? successFlow;
  String? layoutAxis;
  String? previousFlow;
  String? searchOption;
  bool? actionOnClick;
  bool? addbuttonlist;
  String? biometricType;
  String? listCondition;
  bool? dontShowButton;
  String? redirectionUrl;
  bool? hideFaq;
  bool? hideWebImage;
  String? limit;
  bool? hasOptionalFlow;
  bool? showDialogOnLoad;
  bool? skipError;
  String? submitButtonText;
  bool? timerConfirmation;
  String? redirectionAttribute;
  ServiceTimer? timer;
  String? dynamicStepTitle;
  List<ButtonOptions>? buttonOptions;
  List<String>? multiLayoutbuttonOptionsArray;
  List<String>? clearCacheStepsArray;
  List? tabsLayoutOptions;
  String? listItemType;

  StepDetails({
    this.layout,
    this.stepTitle,
    this.subLayout,
    this.listOption,
    this.failureFlow,
    this.multiLayout,
    this.successFlow,
    this.layoutAxis,
    this.previousFlow,
    this.searchOption,
    this.actionOnClick,
    this.addbuttonlist,
    this.biometricType,
    this.listCondition,
    this.dontShowButton,
    this.redirectionUrl,
    this.hasOptionalFlow,
    this.showDialogOnLoad,
    this.submitButtonText,
    this.hideFaq,
    this.limit,
    this.timerConfirmation,
    this.redirectionAttribute,
    this.buttonOptions,
    this.skipError,
    this.dynamicStepTitle,
    this.multiLayoutbuttonOptionsArray,
    this.tabsLayoutOptions,
    this.listItemType,
    this.clearCacheStepsArray,
  });

  StepDetails.fromJson(Map<String, dynamic> json) {
    layout = json['layout'];
    stepTitle = json['stepTitle'];
    subLayout = json['subLayout'];
    listOption = json['listOption'];
    failureFlow = json['failureFlow'];
    multiLayout = json['multiLayout'];
    successFlow = json['successFlow'];
    layoutAxis = json['layoutAxis'];
    hideFaq = json['hideFaq'] == true;
    hideWebImage = json['hideWebImage'] == true;
    previousFlow = json['previousFlow'];
    searchOption = json['searchOption'];
    actionOnClick = json['actionOnClick'];
    addbuttonlist = json['addbuttonlist'];
    biometricType = json['biometricType'];
    listCondition = json['listCondition'];
    limit = json['limit'];
    dontShowButton = json['dontShowButton'];
    redirectionUrl = json['redirectionUrl'];
    hasOptionalFlow = json['hasOptionalFlow'];
    dynamicStepTitle = json['dynamicStepTitle'];
    skipError = json['skipError'];
    showDialogOnLoad = json['showDialogOnLoad'];
    if (json['buttonOptions'] != null) {
      buttonOptions = <ButtonOptions>[];
      json['buttonOptions'].forEach((v) {
        buttonOptions!.add(new ButtonOptions.fromJson(v));
      });
    }
    timer =
        json['timer'] != null ? new ServiceTimer.fromJson(json['timer']) : null;
    submitButtonText = json['submitButtonText'];
    timerConfirmation = json['timerConfirmation'];
    hideFaq = json['hideFaq'] == true;
    redirectionAttribute = json['redirectionAttribute'];
    if (json['multiLayoutbuttonOptionsArray'] != null &&
        json['multiLayoutbuttonOptionsArray'].isNotEmpty)
      multiLayoutbuttonOptionsArray =
          json['multiLayoutbuttonOptionsArray'].cast<String>();

    if (json['clearCacheStepsArray'] != null &&
        json['clearCacheStepsArray'].isNotEmpty)
      clearCacheStepsArray = json['clearCacheStepsArray'].cast<String>();
    tabsLayoutOptions = json['tabsLayoutOptions'];
    listItemType = json['listItemType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['layout'] = this.layout;
    data['stepTitle'] = this.stepTitle;
    data['subLayout'] = this.subLayout;
    data['listOption'] = this.listOption;
    data['failureFlow'] = this.failureFlow;
    data['multiLayout'] = this.multiLayout;
    data['hideWebImage'] = this.hideWebImage;
    data['successFlow'] = this.successFlow;
    data['layoutAxis'] = this.layoutAxis;
    data['previousFlow'] = this.previousFlow;
    data['searchOption'] = this.searchOption;
    data['actionOnClick'] = this.actionOnClick;
    data['limit'] = this.limit;
    data['addbuttonlist'] = this.addbuttonlist;
    data['biometricType'] = this.biometricType;
    data['listCondition'] = this.listCondition;
    data['dontShowButton'] = this.dontShowButton;
    data['redirectionUrl'] = this.redirectionUrl;
    data['hasOptionalFlow'] = this.hasOptionalFlow;
    data['dynamicStepTitle'] = this.dynamicStepTitle;
    data['skipError'] = this.skipError;
    data['showDialogOnLoad'] = this.showDialogOnLoad;
    data['submitButtonText'] = this.submitButtonText;
    data['timerConfirmation'] = this.timerConfirmation;
    data['redirectionAttribute'] = this.redirectionAttribute;
    data['timer'] = this.timer?.toJson();
    data['multiLayoutbuttonOptionsArray'] = this.multiLayoutbuttonOptionsArray;
    data['clearCacheStepsArray'] = this.clearCacheStepsArray;
    data['tabsLayoutOptions'] = this.tabsLayoutOptions;
    data['listItemType'] = this.listItemType;
    return data;
  }
}

class ButtonOptions {
  String? buttonName;
  String? failureFlow;
  String? successFlow;
  bool? validation;

  ButtonOptions(
      {this.buttonName, this.failureFlow, this.successFlow, this.validation});

  ButtonOptions.fromJson(Map<String, dynamic> json) {
    buttonName = json['buttonName'];
    failureFlow = json['failureFlow'];
    successFlow = json['successFlow'];
    validation = json['validation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['buttonName'] = this.buttonName;
    data['failureFlow'] = this.failureFlow;
    data['successFlow'] = this.successFlow;
    data['validation'] = this.validation;
    return data;
  }
}

class ServiceTimer {
  String? timeLimit;
  String? timerText;
  String? runsTillTimer;
  String? timerfailureFlow;
  String? timerSuccessFlow;
  String? timerDisplayOption;

  ServiceTimer(
      {this.timeLimit,
      this.timerText,
      this.runsTillTimer,
      this.timerDisplayOption,
      this.timerSuccessFlow,
      this.timerfailureFlow});

  ServiceTimer.fromJson(Map<String, dynamic> json) {
    timeLimit = json['timeLimit'];
    timerText = json['timerText'];
    runsTillTimer = json['runsTillTimer'];
    timerfailureFlow = json['timerfailureFlow'];
    timerSuccessFlow = json['timerSuccessFlow'];
    timerDisplayOption = json['timerDisplayOption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timeLimit'] = this.timeLimit;
    data['timerText'] = this.timerText;
    data['runsTillTimer'] = this.runsTillTimer;
    data['timerfailureFlow'] = this.timerfailureFlow;
    data['timerSuccessFlow'] = this.timerSuccessFlow;
    data['timerDisplayOption'] = this.timerDisplayOption;
    return data;
  }
}

class ApiConfig {
  int? apiConfigurationId;
  String? apiName;
  String? authenticationType;
  dynamic? username;
  dynamic? password;
  String? accessToken;
  String? tokenEndpoint;
  String? endpointName;
  String? useAs;
  dynamic? dataType;
  String? apiMethod;
  String? apiEndpointUrl;
  List? headers;
  List? parameters;
  String? accept;
  String? contentType;
  ErrorHandling? errorHandling;

  ApiConfig({
    this.apiConfigurationId,
    this.apiName,
    this.authenticationType,
    this.username,
    this.password,
    this.accessToken,
    this.tokenEndpoint,
    this.endpointName,
    this.useAs,
    this.dataType,
    this.apiMethod,
    this.apiEndpointUrl,
    this.headers,
    this.parameters,
    this.accept,
    this.contentType,
  });

  ApiConfig.fromJson(Map<String, dynamic> json) {
    apiConfigurationId = json['apiConfigurationId'];
    apiName = json['apiName'];
    authenticationType = json['authenticationType'];
    username = json['username'];
    password = json['password'];
    accessToken = json['accessToken'];
    tokenEndpoint = json['tokenEndpoint'];
    endpointName = json['endpointName'];
    useAs = json['useAs'];
    dataType = json['dataType'];
    apiMethod = json['apiMethod'];
    apiEndpointUrl = json['apiEndpointUrl'];
    if (json['headers'] != null) {
      headers = [];
      json['headers'].forEach((v) {
        headers!.add(v);
      });
    }
    if (json['parameters'] != null) {
      parameters = [];
      json['parameters'].forEach((v) {
        parameters!.add(v);
      });
    }

    errorHandling = json['errorHandling'] != null
        ? new ErrorHandling.fromJson(json['errorHandling'])
        : null;
    accept = json['accept'];
    contentType = json['contentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apiConfigurationId'] = this.apiConfigurationId;
    data['apiName'] = this.apiName;
    data['authenticationType'] = this.authenticationType;
    data['username'] = this.username;
    data['password'] = this.password;
    data['accessToken'] = this.accessToken;
    data['tokenEndpoint'] = this.tokenEndpoint;
    data['endpointName'] = this.endpointName;
    data['useAs'] = this.useAs;
    data['dataType'] = this.dataType;
    data['apiMethod'] = this.apiMethod;
    data['apiEndpointUrl'] = this.apiEndpointUrl;
    if (this.headers != null) {
      data['headers'] = this.headers!.map((v) => v.toJson()).toList();
    }
    if (this.parameters != null) {
      data['parameters'] = this.parameters!.map((v) => v.toJson()).toList();
    }
    data['accept'] = this.accept;
    data['contentType'] = this.contentType;
    if (this.errorHandling != null) {
      data['errorHandling'] = this.errorHandling!.toJson();
    }
    return data;
  }
}

class ErrorHandling {
  String? errorCode;
  String? errorMessage;

  ErrorHandling({this.errorCode, this.errorMessage});

  ErrorHandling.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['errorMessage'] = this.errorMessage;
    return data;
  }
}

class OptionalData {
  String? optionalFlowStep;
  String? optionalFlowCondition;

  OptionalData({this.optionalFlowStep, this.optionalFlowCondition});

  OptionalData.fromJson(Map<String, dynamic> json) {
    optionalFlowStep = json['optionalFlowStep'];
    optionalFlowCondition = json['optionalFlowCondition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['optionalFlowStep'] = this.optionalFlowStep;
    data['optionalFlowCondition'] = this.optionalFlowCondition;
    return data;
  }
}

class ResponseHandling {
  String? dialogText;
  String? dialogTitle;
  bool? dialogCancel;
  bool? dialogSuccess;
  String? cancelDialogText;
  String? successDialogText;
  String? stepsDialogPopUpCancel;
  String? responseHandlingOptions;
  String? redirectionAttribute;
  String? stepsDialogPopUpSuccess;
  List<OptionalData>? optionalData;

  ResponseHandling({
    this.dialogText,
    this.dialogTitle,
    this.dialogCancel,
    this.dialogSuccess,
    this.cancelDialogText,
    this.successDialogText,
    this.stepsDialogPopUpCancel,
    this.responseHandlingOptions,
    this.redirectionAttribute,
    this.stepsDialogPopUpSuccess,
    this.optionalData,
  });

  ResponseHandling.fromJson(Map<String, dynamic> json) {
    dialogText = json['dialogText'];
    dialogTitle = json['dialogTitle'];
    dialogCancel = json['dialogCancel'];
    dialogSuccess = json['dialogSuccess'];
    cancelDialogText = json['cancelDialogText'];
    successDialogText = json['successDialogText'];
    stepsDialogPopUpCancel = json['stepsDialogPopUpCancel'];
    responseHandlingOptions = json['responseHandlingOptions'];
    redirectionAttribute = json['redirectionAttribute'];
    stepsDialogPopUpSuccess = json['stepsDialogPopUpSuccess'];
    if (json['optionalData'] != null) {
      optionalData = <OptionalData>[];
      json['optionalData'].forEach((v) {
        optionalData!.add(new OptionalData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dialogText'] = this.dialogText;
    data['dialogTitle'] = this.dialogTitle;
    data['dialogCancel'] = this.dialogCancel;
    data['dialogSuccess'] = this.dialogSuccess;
    data['cancelDialogText'] = this.cancelDialogText;
    data['successDialogText'] = this.successDialogText;
    data['stepsDialogPopUpCancel'] = this.stepsDialogPopUpCancel;
    data['redirectionAttribute'] = this.redirectionAttribute;
    data['responseHandlingOptions'] = this.responseHandlingOptions;
    data['stepsDialogPopUpSuccess'] = this.stepsDialogPopUpSuccess;
    if (this.optionalData != null) {
      data['optionalData'] = this.optionalData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

