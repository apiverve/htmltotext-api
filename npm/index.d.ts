declare module '@apiverve/htmltotext' {
  export interface htmltotextOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface htmltotextResponse {
    status: string;
    error: string | null;
    data: HTMLtoTextData;
    code?: number;
  }


  interface HTMLtoTextData {
      text:             string;
      parsed:           boolean;
      detectedLanguage: DetectedLanguage;
  }
  
  interface DetectedLanguage {
      language:   string;
      confidence: number;
  }

  export default class htmltotextWrapper {
    constructor(options: htmltotextOptions);

    execute(callback: (error: any, data: htmltotextResponse | null) => void): Promise<htmltotextResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: htmltotextResponse | null) => void): Promise<htmltotextResponse>;
    execute(query?: Record<string, any>): Promise<htmltotextResponse>;
  }
}
