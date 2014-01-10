unit FluentQuery.Core.Types;

interface
uses
  System.SysUtils;

type
  IMinimalEnumerator<T> = interface
    function MoveNext: Boolean;
    function GetCurrent: T;
    property Current: T read GetCurrent;
  end;

  IBaseQueryEnumerator<T> = interface(IMinimalEnumerator<T>)
{$IFDEF DEBUG}
    function GetOperationName : String;
    procedure SetOperationName(const OperationName : string);
    function GetOperationPath : String;
    property OperationName : string read GetOperationName write SetOperationName;
    property OperationPath : string read GetOperationPath;
{$ENDIF}
    procedure SetUpstreamQuery(UpstreamQuery : IBaseQueryEnumerator<T>);
    procedure SetSourceData(SourceData : IMinimalEnumerator<T>);
  end;

  EFluentQueryException = class(Exception);
    ENilEnumeratorException = class(EFluentQueryException);
implementation

end.
