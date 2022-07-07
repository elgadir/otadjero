@extends('layouts.admin')

@section('title', trans('general.title.edit', ['type' => trans_choice('inventory::general.adjustments', 1)]))

@section('content')
{!! Form::model($adjustment, [
    'id' => 'adjustment',
    'method' => 'PATCH',
    'route' => ['inventory.adjustments.update', $adjustment->id],
    '@submit.prevent' => 'onSubmit',
    '@keydown' => 'form.errors.clear($event.target.name)',
    'files' => true,
    'role' => 'form',
    'class' => 'form-loading-button',
    'novalidate' => true
]) !!}

    <div class="card">
        <div class="card-body">
            <div class="row">
                {{ Form::textGroup('adjustment_number', trans('inventory::adjustments.adjustment_number'), 'file', ['required' => 'required']) }}

                {{ Form::dateGroup('date', trans('general.date'), 'calendar', ['id' => 'closed_at', 'required' => 'required', 'class' => 'form-control datepicker', 'show-date-format' => company_date_format(), 'date-format' => 'Y-m-d', 'autocomplete' => 'off'], Date::parse($adjustment->date)->toDateString()) }}

                <akaunting-select
                    class="col-md-6 required"
                    :form-classes="[{'has-error': form.errors.get('warehouse_id') }]"
                    :icon="'warehouse'"
                    :title="'{{ trans_choice('inventory::general.warehouses',1) }}'"
                    :placeholder="'{{ trans('general.form.select.field', ['field' => trans_choice('inventory::general.warehouses',1)]) }}'"
                    :name="'warehouse_id'"
                    :options="{{ $warehouses }}"
                    :value="'{{ $adjustment->warehouse_id }}'"
                    @interface="form.warehouse_id = $event"
                    @change="onChangeType()"
                    :form-error="form.errors.get('warehouse_id')"
                    :no-data-text="'{{ trans('general.no_data') }}'"
                    :no-matching-data-text="'{{ trans('general.no_matching_data') }}'"
                ></akaunting-select>

                {{ Form::selectGroup('reason', trans('inventory::transferorders.reason'), 'id-card', $reasons, $adjustment->reason) }}

                {{ Form::textareaGroup('description', trans('general.description')) }}
            </div>
        </div>
    </div>

    <div class="card" v-if="items">
        <div class="table-responsive">
            <table class="table table-bordered" id="items">
                <thead class="thead-light">
                    <tr class="row">
                        <th class="col-md-1">{{ trans('general.actions') }}</th>
                        <th class="col-md-3">{{ trans_choice('general.items', 1) }}</th>
                        <th class="col-md-3">{{ trans('inventory::transferorders.item_quantity') }}</th>
                        <th class="col-md-3">{{ trans('inventory::adjustments.adjusted_quantity') }}</th>
                        <th class="col-md-2">{{ trans('inventory::adjustments.new_quantity') }}</th>
                    </tr>
                </thead>

                <tbody>
                    <tr class="row" v-for="(row, index) in form.items" :index="index">
                        <td class="col-md-1">
                            <button type="button"
                                @click="onDeleteItem(index)"
                                data-toggle="tooltip"
                                title="{{ trans('general.delete') }}"
                                class="btn btn-icon btn-outline-danger btn-lg"><i class="fa fa-trash"></i>
                            </button>
                        </td>
                        <td class="col-md-3">
                            <akaunting-select
                                class="col-md-12"
                                :class="[{'show': items}]"
                                :form-classes="[{'has-error': form.errors.get('item') }]"
                                :placeholder="'{{ trans('general.form.select.field',
                                ['field' => trans_choice('general.items', 1)]) }}'"
                                name="items[][item_id]"
                                :dynamic-options="options.item_id"
                                :value="row.item_id"
                                @interface="row.item_id = $event"
                                @change="onChangeItemQuantity(index)"
                                :form-error="form.errors.get('item_id')"
                                :no-data-text="'{{ trans('general.no_data') }}'"
                                :no-matching-data-text="'{{ trans('general.no_matching_data') }}'"
                                >
                            </akaunting-select>
                        </td>
                        <td class="col-md-3">
                            <input value=""
                            disabled
                            class="form-control"
                            data-item="item_quantity"
                            required="required"
                            name="items[][item_quantity]"
                            v-model="row.item_quantity"
                            type="text"
                            autocomplete="off">
                        </td>
                        <td class="col-md-3">
                            <input value=""
                            class="form-control"
                            data-item="adjusted_quantity"
                            required="required"
                            name="items.' + index + '.adjusted_quantity'"
                            v-model="row.adjusted_quantity"
                            @input="onChangeNewQuantity(index)"
                            type="text"
                            autocomplete="off">
                            <div class="invalid-feedback d-block" v-if="adjusment_button"
                                v-if="form.errors.has('items.' + index + '.adjusted_quantity')"
                                v-html="form.errors.get('items.' + index + '.adjusted_quantity')">
                            </div>
                        </td>
                        <td class="col-md-2">
                            <input value=""
                            disabled
                            class="form-control"
                            data-item="new_quantity"
                            required="required"
                            name="items[][new_quantity]"
                            v-model="row.new_quantity"
                            type="text"
                            autocomplete="off">
                        </td>
                    </tr>
                    <tr id="addItem">
                        <td class="col-md-1">
                            <button type="button"
                                @click="onAddItem"
                                id="button-add-item"
                                data-toggle="tooltip"
                                title="{{ trans('general.add') }}"
                                class="btn btn-icon btn-outline-success btn-lg"
                                data-original-title="{{ trans('general.add') }}">
                                <i class="fa fa-plus"></i>
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="card">
        <div class="card-footer">
            <div class="row save-buttons">
                {{ Form::saveButtons('inventory.adjustments.index') }}
            </div>
        </div>
    </div>
{!! Form::close() !!}
@endsection

@push('scripts_start')
    <script type="text/javascript">
        var adjustment_items = {!! json_encode($adjustment_items) !!};
    </script>

    <script src="{{ asset('modules/Inventory/Resources/assets/js/adjustments.min.js?v=' . module_version('inventory')) }}"></script>
@endpush
