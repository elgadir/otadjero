<?php

namespace Modules\Crm\Http\Requests;

use App\Abstracts\Http\FormRequest;

class ModalDealOwner extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'owner_id' => 'required|integer',
        ];
    }
}
