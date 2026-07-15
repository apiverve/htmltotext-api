declare module '@apiverve/htmltotext' {
  export interface htmltotextOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface htmltotextResponse {
    status: string;
    error: string | null;
    data: HTMLtoTextData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface HTMLtoTextData {
      text:             null | string;
      parsed:           boolean | null;
      detectedLanguage: DetectedLanguage;
      characterCount:   number | null;
      wordCount:        number | null;
  }
  
  interface DetectedLanguage {
      language:   null | string;
      confidence: number | null;
  }

  export default class htmltotextWrapper {
    constructor(options: htmltotextOptions);

    execute(callback: (error: any, data: htmltotextResponse | null) => void): Promise<htmltotextResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: htmltotextResponse | null) => void): Promise<htmltotextResponse>;
    execute(query?: Record<string, any>): Promise<htmltotextResponse>;
  }
}
